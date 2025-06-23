<?php
class ProductRepository {
    private PDO $conn;

    public function __construct(PDO $conn) {
        $this->conn = $conn;
    }
    
    public function fetchProducts(string $lang, int $limit = 20, int $offset = 0): array {
        $stmt = $this->conn->prepare("
            SELECT 
                p.id, p.base_price, p.discounted_price, p.rating, p.rating_count,
                l.name, l.description, 
                (SELECT url FROM product_images WHERE product_id = p.id AND is_cover = TRUE LIMIT 1) AS cover_image
            FROM products p
            LEFT JOIN product_localizations l ON l.product_id = p.id AND l.language_code = ?
            ORDER BY p.id DESC
            LIMIT ? OFFSET ?
        ");
        $stmt->bindValue(1, $lang);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        
        $stmt->execute();
    
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductById(int $id, string $lang): ?array {
        $stmt = $this->conn->prepare("
            SELECT p.id, p.base_price, p.discounted_price, p.rating, p.rating_count,
                   l.name, l.description
            FROM products p
            LEFT JOIN product_localizations l ON p.id = l.product_id AND l.language_code = ?
            WHERE p.id = ?
        ");
        $stmt->execute([$lang, $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getProductImages(int $productId): array {
        $stmt = $this->conn->prepare("SELECT url, is_cover FROM product_images WHERE product_id = ?");
        $stmt->execute([$productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductAttributes(int $productId, string $lang = 'en'): array {
         $stmt = $this->conn->prepare("
            SELECT 
                pa.name AS attribute_key,
                COALESCE(pal.label, pa.name) AS attribute_label,
                po.value AS option_key,
                COALESCE(pool.label, po.value) AS option_label
            FROM product_attributes pa
            JOIN product_attribute_options po ON po.attribute_id = pa.id
            LEFT JOIN product_attribute_localizations pal 
                ON pal.attribute_id = pa.id AND pal.language_code = ?
            LEFT JOIN product_attribute_option_localizations pool 
                ON pool.option_id = po.id AND pool.language_code = ?
            WHERE pa.product_id = ?
            ORDER BY pa.id, po.id
        ");
        
        $stmt->execute([$lang, $lang, $productId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
        $grouped = [];
    
        foreach ($rows as $row) {
            $key = $row['attribute_key'];
            if (!isset($grouped[$key])) {
                $grouped[$key] = [
                    'key' => $key,
                    'label' => $row['attribute_label'],
                    'options' => [],
                ];
            }
    
            $grouped[$key]['options'][] = [
                'key' => $row['option_key'],
                'label' => $row['option_label'],
            ];
        }
    
        return array_values($grouped);
    }


    public function getProductVariations(int $productId): array {
        $stmt = $this->conn->prepare("
            SELECT id, price, discounted_price
            FROM product_variations
            WHERE product_id = ?
        ");
        $stmt->execute([$productId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getVariationAttributes(int $variationId): array {
        $stmt = $this->conn->prepare("
            SELECT 
                pa.name AS attribute,
                po.value AS value       
            FROM variation_attribute_values vav
            JOIN product_attributes pa ON pa.id = vav.attribute_id
            JOIN product_attribute_options po ON po.id = vav.option_id
            WHERE vav.variation_id = ?
        ");
        $stmt->execute([$variationId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getVariationImages(int $variationId): array {
        $stmt = $this->conn->prepare("SELECT url FROM variation_images WHERE variation_id = ?");
        $stmt->execute([$variationId]);
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }
    
}
