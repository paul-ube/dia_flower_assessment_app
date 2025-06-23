<?php
require_once __DIR__ . '/../../connection.php';
require_once __DIR__ . '/../repositories/product_repository.php';
require_once __DIR__ . '/../services/product_service.php';

$conn = getPDO();
$repo = new ProductRepository($conn);
$service = new ProductService($repo);

// header('Content-Type: application/json');

$productId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$lang = $_GET['lang'] ?? 'en';

if ($productId <= 0) {
    http_response_code(400);
    echo json_encode(['error' => 'Missing or invalid product ID']);
    exit;
}


$product = $service->getProductDetails($productId, $lang);
if (!$product) {
    http_response_code(404);
    echo json_encode(['error' => 'Product not found']);
    exit;
}

echo json_encode($product);
