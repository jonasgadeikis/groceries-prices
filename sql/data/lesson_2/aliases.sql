-- Our query from before that has an issue with display column names
-- Column "name" appears twice

SELECT
    `product_price`.`id`,
    `product`.`name`,
    `shop`.`name`,
    `product_price`.`value_without_vat`,
    `product_price`.`value_with_vat`,
    `product_price`.`updated_at`
FROM `product_price`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`;

-- We can use aliases on each selected column to make selection more readable

SELECT
    `product_price`.`id`,
    `product`.`name` AS 'Product name',
    `shop`.`name` AS 'Shop name',
    `product_price`.`value_without_vat` AS 'Price without VAT',
    `product_price`.`value_with_vat` AS 'Price with VAT',
    `product_price`.`updated_at` AS 'Last update date'
FROM `product_price`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`;

-- Using a lot of Joins queries become too verbose
-- We can use table aliases to simplify queries
-- Also using aliases you will write queries faster

SELECT
    pp.id,
    p.name AS 'Product name',
    s.name AS 'Shop name',
    pp.value_without_vat AS 'Price without VAT',
    pp.value_with_vat AS 'Price with VAT',
    pp.updated_at AS 'Last update date'
FROM product_price pp
INNER JOIN product p ON pp.product_id = p.id
INNER JOIN shop s ON pp.shop_id = s.id;
