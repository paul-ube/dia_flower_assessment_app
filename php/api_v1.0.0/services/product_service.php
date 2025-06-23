<?php
class ProductService {
    private ProductRepository $repo;

    public function __construct(ProductRepository $repo) {
        $this->repo = $repo;
    }
    
    public function fetchProducts(string $lang, int $limit = 20, int $offset = 0): array {
        return $this->repo->fetchProducts($lang, $limit, $offset);
    }


    public function getProductDetails(int $id, string $lang): ?array { 
        $product = $this->repo->getProductById($id, $lang);
    
        if (!$product) return null;
    
        // Product images
        $product['images'] = $this->repo->getProductImages($id);
    
        $product['attributes'] = $this->repo->getProductAttributes($id, $lang);
    
        // Variations
        $variations = $this->repo->getProductVariations($id);
    
        foreach ($variations as &$v) {
            // Use keys for variation attribute logic
            $v['attributes'] = [];
            foreach ($this->repo->getVariationAttributes($v['id']) as $a) {
                $v['attributes'][$a['attribute']] = $a['value'];
            }
    
            // Images
            $v['images'] = $this->repo->getVariationImages($v['id']);
        }
    
        $product['variations'] = $variations;
    
        return $product;
    }


    
}
