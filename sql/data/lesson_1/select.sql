-- Select everything from a table

SELECT *
FROM `product`;

-- Select what you might need from a table

SELECT `id`, `name`
FROM `product`;

-- Select rows by condition

SELECT *
FROM `product`
WHERE `category_id` = 3;

-- Select rows by multiple conditions

SELECT *
FROM `product`
WHERE `category_id` = 3
AND `photo_url` IS NOT NULL;

SELECT *
FROM `product`
WHERE `category_id` = 2
OR `photo_url` IS NOT NULL;

-- Select rows by multiple values of a condition

SELECT *
FROM `product`
WHERE `category_id` IN (3, 4); -- NOT IN instead of IN will return all entries that do not have category_id 3 or 4

-- Select rows by a string condition or by a string fragment condition

SELECT *
FROM `product`
WHERE `name` LIKE 'ROKIŠKIO sūris, 45% rieb., 240g';

SELECT *
FROM `product`
WHERE `name` LIKE '%sūris%'; -- NOT LIKE instead of LIKE will return all entries that do not include 'sūris'

SELECT *
FROM `product`
WHERE `name` LIKE 'Juoda%'; -- NOT LIKE instead of LIKE will return all entries that do not start with 'Juoda'
