-- The INNER JOIN keyword selects all rows from both tables as long as there is a match between the columns.
-- Select with inner join
-- When selecting all (*) will combine both tables into one and return all different results

SELECT *
FROM `product`
INNER JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`;

-- When selecting specific columns, be sure they are unique
-- This will result in ambiguity error, because column `id` appears in both `product_price` and `product` tables

SELECT `id`
FROM `product`
INNER JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`;

-- Correct way is to prefix column with a table name

SELECT `product`.`id`
FROM `product`
INNER JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`;

-- Example with INNER JOIN to replace product price references (product_id and shop_id) with actual names
-- Note that column "name" appears twice in this selection, because product and shop tables both have column name
-- Later we will use aliases to separate them and make selection better readable

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

-- You can use inner join not only in SELECT statement but in UPDATE too
-- Note that "Simulate query" is not available since you don't use single table for this operation

UPDATE `product_price`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`
SET `value_without_vat` = 1.8595, `value_with_vat` = 2.25, `updated_at` = NOW()
WHERE `product`.`name` = 'Juoda AGOTOS duona, 800g'
AND `shop`.`name` = 'Rimi';

-- INNER JOIN can also be used with INSERT statement

INSERT INTO `product_price_history` (`product_price_id`, `value_without_vat`, `value_with_vat`)
SELECT `product_price`.`id`, `product_price`.`value_without_vat`, `product_price`.`value_with_vat`
FROM `product_price`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`
WHERE `product`.`name` = 'Juoda AGOTOS duona, 800g'
AND `shop`.`name` = 'Rimi';

-- Or DELETE statement
-- Note that "Simulate query" is not available since you don't use single table for this operation

DELETE `product_price_history`
FROM `product_price_history`
INNER JOIN `product_price` ON `product_price_history`.`product_price_id` = `product_price`.`id`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`
WHERE `product`.`name` = 'Juoda AGOTOS duona, 800g'
AND `shop`.`name` = 'Rimi'
AND `product_price_history`.`value_with_vat` = 2.25;

-- There are 2 ways to check how many entries you are Updating or Deleting

-- 1 Before running your UPDATE or DELETE statements use SELECT with same conditions
SELECT `product_price_history`.*
FROM `product_price_history`
INNER JOIN `product_price` ON `product_price_history`.`product_price_id` = `product_price`.`id`
INNER JOIN `product` ON `product_price`.`product_id` = `product`.`id`
INNER JOIN `shop` ON `product_price`.`shop_id` = `shop`.`id`
WHERE `product`.`name` = 'Juoda AGOTOS duona, 800g'
AND `shop`.`name` = 'Rimi'
AND `product_price_history`.`value_with_vat` = 2.25;

-- 2 Use subqueries to "fool" phpmyadmin into thinking that you are still working on single table
-- We will cover this in lesson 3
