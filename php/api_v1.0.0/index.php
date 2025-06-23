<?php
    $action = $_GET['action'] ?? 'detail';

    switch ($action) {
      case 'all':
        require 'controllers/fetch_products_controller.php';
        break;
      case 'detail':
      default:
        require 'controllers/product_controller.php';
        break;
    }
