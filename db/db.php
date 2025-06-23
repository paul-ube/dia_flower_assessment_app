<?php
/**
 * Export to PHP Array plugin for PHPMyAdmin
 * @version 5.2.1
 */

/**
 * Database `test_database`
 */

/* `test_database`.`products` */
$products = array(
  array('id' => '1','base_price' => '295.00','discounted_price' => NULL,'rating' => '3.5','rating_count' => '12','created_at' => '2025-06-22 10:25:57'),
  array('id' => '2','base_price' => '280.00','discounted_price' => '238.00','rating' => '5','rating_count' => '20','created_at' => '2025-06-22 11:56:22')
);

/* `test_database`.`product_attributes` */
$product_attributes = array(
  array('id' => '1','product_id' => '1','name' => 'Size'),
  array('id' => '2','product_id' => '1','name' => 'Box Color'),
  array('id' => '3','product_id' => '2','name' => 'Size')
);

/* `test_database`.`product_attribute_localizations` */
$product_attribute_localizations = array(
  array('id' => '1','attribute_id' => '2','language_code' => 'en','label' => 'Box Color'),
  array('id' => '2','attribute_id' => '2','language_code' => 'ar','label' => 'لون العلبة'),
  array('id' => '3','attribute_id' => '1','language_code' => 'en','label' => 'Size'),
  array('id' => '4','attribute_id' => '1','language_code' => 'ar','label' => 'الحجم'),
  array('id' => '8','attribute_id' => '3','language_code' => 'ar','label' => 'الحجم'),
  array('id' => '7','attribute_id' => '3','language_code' => 'en','label' => 'Size')
);

/* `test_database`.`product_attribute_options` */
$product_attribute_options = array(
  array('id' => '1','attribute_id' => '1','value' => 'S'),
  array('id' => '2','attribute_id' => '1','value' => 'M'),
  array('id' => '3','attribute_id' => '1','value' => 'L'),
  array('id' => '4','attribute_id' => '2','value' => 'Black'),
  array('id' => '5','attribute_id' => '2','value' => 'White'),
  array('id' => '6','attribute_id' => '3','value' => 'S'),
  array('id' => '7','attribute_id' => '3','value' => 'M'),
  array('id' => '8','attribute_id' => '3','value' => 'L')
);

/* `test_database`.`product_attribute_option_localizations` */
$product_attribute_option_localizations = array(
  array('id' => '1','option_id' => '1','language_code' => 'en','label' => 'Small'),
  array('id' => '2','option_id' => '1','language_code' => 'ar','label' => 'صغير'),
  array('id' => '3','option_id' => '2','language_code' => 'en','label' => 'Medium'),
  array('id' => '4','option_id' => '2','language_code' => 'ar','label' => 'وسط'),
  array('id' => '5','option_id' => '3','language_code' => 'en','label' => 'Large'),
  array('id' => '6','option_id' => '3','language_code' => 'ar','label' => 'كبير'),
  array('id' => '7','option_id' => '4','language_code' => 'en','label' => 'Black'),
  array('id' => '8','option_id' => '4','language_code' => 'ar','label' => 'أسود'),
  array('id' => '9','option_id' => '5','language_code' => 'en','label' => 'White'),
  array('id' => '10','option_id' => '5','language_code' => 'ar','label' => 'أبيض'),
  array('id' => '11','option_id' => '6','language_code' => 'en','label' => 'Small'),
  array('id' => '12','option_id' => '6','language_code' => 'ar','label' => 'صغير'),
  array('id' => '13','option_id' => '7','language_code' => 'en','label' => 'Medium'),
  array('id' => '14','option_id' => '7','language_code' => 'ar','label' => 'وسط'),
  array('id' => '15','option_id' => '8','language_code' => 'en','label' => 'Large'),
  array('id' => '16','option_id' => '8','language_code' => 'ar','label' => 'كبير')
);

/* `test_database`.`product_images` */
$product_images = array(
  array('id' => '1','product_id' => '1','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2F546bee37-3894-43a2-0cff-89fafce22f00%2Fpublic&w=1920&q=100','is_cover' => '1'),
  array('id' => '2','product_id' => '2','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Ff95cebe4-f5b2-48a8-3020-7672e83b7500%2Ftalabat&w=1920&q=100','is_cover' => '1')
);

/* `test_database`.`product_localizations` */
$product_localizations = array(
  array('id' => '1','product_id' => '1','language_code' => 'en','name' => 'Velvet Valley','description' => 'An elegant display featuring deep Red Roses, complemented by the fresh, aromatic touch of Eucalyptus. This striking and timeless centerpiece combines vibrant roses and lush greenery, perfect for adding refined beauty to any occasion.'),
  array('id' => '2','product_id' => '1','language_code' => 'ar','name' => 'وادي المخمل','description' => 'عرض أنيق يضم ورودًا حمراء عميقة، مكملة بلمسة منعشة وعطرية من الكافور. هذا المركز المذهل والخالد يجمع بين الورود النابضة بالحياة والخضرة الخصبة، مثالي لإضافة جمال راقٍ لأي مناسبة.'),
  array('id' => '3','product_id' => '2','language_code' => 'en','name' => 'Citrus Spark','description' => 'Vibrant mix of dark saffina chrysanthemum, eucalyptus, Santini Doria, and bright orange Uhuru Key roses.'),
  array('id' => '4','product_id' => '2','language_code' => 'ar','name' => 'شرارة الحمضيات','description' => 'مزيج نابض من أقحوان سافينا الداكن، الأوكالبتوس، سانتيني دوريا، وورود أوهورو البرتقالية الزاهية.')
);

/* `test_database`.`product_variations` */
$product_variations = array(
  array('id' => '1','product_id' => '1','price' => '394.00','discounted_price' => '295.00'),
  array('id' => '2','product_id' => '1','price' => '394.00','discounted_price' => '295.00'),
  array('id' => '3','product_id' => '1','price' => '640.00','discounted_price' => '480.00'),
  array('id' => '4','product_id' => '1','price' => '640.00','discounted_price' => '480.00'),
  array('id' => '5','product_id' => '1','price' => '880.00','discounted_price' => '660.00'),
  array('id' => '6','product_id' => '1','price' => '880.00','discounted_price' => '660.00'),
  array('id' => '7','product_id' => '2','price' => '280.00','discounted_price' => '238.00'),
  array('id' => '8','product_id' => '2','price' => '360.00','discounted_price' => '306.00'),
  array('id' => '9','product_id' => '2','price' => '440.00','discounted_price' => '374.00')
);

/* `test_database`.`variation_attribute_values` */
$variation_attribute_values = array(
  array('variation_id' => '1','attribute_id' => '1','option_id' => '1'),
  array('variation_id' => '1','attribute_id' => '2','option_id' => '4'),
  array('variation_id' => '2','attribute_id' => '1','option_id' => '1'),
  array('variation_id' => '2','attribute_id' => '2','option_id' => '5'),
  array('variation_id' => '3','attribute_id' => '1','option_id' => '2'),
  array('variation_id' => '3','attribute_id' => '2','option_id' => '4'),
  array('variation_id' => '4','attribute_id' => '1','option_id' => '2'),
  array('variation_id' => '4','attribute_id' => '2','option_id' => '5'),
  array('variation_id' => '5','attribute_id' => '1','option_id' => '3'),
  array('variation_id' => '5','attribute_id' => '2','option_id' => '4'),
  array('variation_id' => '6','attribute_id' => '1','option_id' => '3'),
  array('variation_id' => '6','attribute_id' => '2','option_id' => '5'),
  array('variation_id' => '7','attribute_id' => '1','option_id' => '1'),
  array('variation_id' => '8','attribute_id' => '1','option_id' => '2'),
  array('variation_id' => '9','attribute_id' => '1','option_id' => '3')
);

/* `test_database`.`variation_images` */
$variation_images = array(
  array('id' => '1','variation_id' => '1','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2F546bee37-3894-43a2-0cff-89fafce22f00%2Fpublic&w=1920&q=100'),
  array('id' => '2','variation_id' => '2','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2F04e1c559-ccb5-4438-a6d6-042b726cdd00%2Fpublic&w=1920&q=100'),
  array('id' => '3','variation_id' => '3','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Fe8e519bd-8807-4840-7899-dd5dd6ecb300%2Fpublic&w=1920&q=100'),
  array('id' => '4','variation_id' => '4','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2F9d964b38-6f2a-4c62-edad-676c8139f600%2Fpublic&w=1920&q=100'),
  array('id' => '5','variation_id' => '5','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Fac2d0a77-23a4-4e04-7436-7f7db6ed3700%2Fpublic&w=1920&q=100'),
  array('id' => '6','variation_id' => '6','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2F79b7bd9b-e898-43d0-fd90-8d6ad6a64900%2Fpublic&w=1920&q=100'),
  array('id' => '7','variation_id' => '7','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Fc9a522db-7d97-4535-3e25-ac89ac5f5e00%2Fpublic&w=1920&q=100'),
  array('id' => '8','variation_id' => '8','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Fc9a522db-7d97-4535-3e25-ac89ac5f5e00%2Fpublic&w=1920&q=100'),
  array('id' => '9','variation_id' => '9','url' => 'https://diaflower.com/_next/image?url=https%3A%2F%2Fimagedelivery.net%2FkfVaF5O0522QMIOueHgSrA%2Fc9a522db-7d97-4535-3e25-ac89ac5f5e00%2Fpublic&w=1920&q=100')
);
