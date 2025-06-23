<?php
require_once __DIR__ . '/../../connection.php';
require_once __DIR__ . '/../repositories/product_repository.php';
require_once __DIR__ . '/../services/product_service.php';

$conn = getPDO();
$repo = new ProductRepository($conn);
$service = new ProductService($repo);

$lang = $_GET['lang'] ?? 'en';
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 20;
$offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 0;

$products = $service->fetchProducts($lang, $limit, $offset);
echo json_encode($products);
