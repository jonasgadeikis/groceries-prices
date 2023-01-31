-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2).
SELECT *
FROM `product`
LEFT JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`;

--

INSERT INTO `product_price` (`product_id`, `shop_id`, `value_without_vat`, `value_with_vat`)
SELECT `product`.`id`, `shop`.`id`, 2.4771, 2.99
FROM `product`
JOIN `shop`
WHERE `product`.`name` = 'DVARO sūris, 50% rieb., 240g'
AND `shop`.`name` = 'Maxima';

SET @price_entry = LAST_INSERT_ID();

INSERT INTO `product_price_history` (`product_price_id`, `value_without_vat`, `value_with_vat`)
SELECT `product_price`.`id`, `product_price`.`value_without_vat`, `product_price`.`value_with_vat`
FROM `product_price`
WHERE `product_price`.`id` = @price_entry;

INSERT INTO `product_price` (`product_id`, `shop_id`, `value_without_vat`, `value_with_vat`)
SELECT `product`.`id`, `shop`.`id`, 2.6364, 3.19
FROM `product`
JOIN `shop`
WHERE `product`.`name` = 'DVARO sūris, 50% rieb., 240g'
AND `shop`.`name` = 'Rimi';

SET @price_entry = LAST_INSERT_ID();

INSERT INTO `product_price_history` (`product_price_id`, `value_without_vat`, `value_with_vat`)
SELECT `product_price`.`id`, `product_price`.`value_without_vat`, `product_price`.`value_with_vat`
FROM `product_price`
WHERE `product_price`.`id` = @price_entry;

-- Example with LEFT JOIN to find all product that have prices

SELECT DISTINCT`product`.*
FROM `product`
LEFT JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
WHERE `product_price`.`id` IS NOT NULL;
