-- Insert single entry

INSERT INTO `shop`
VALUES (NULL, 'Maxima', NULL);

INSERT INTO `shop` (`name`)
VALUES ('Rimi');

-- Insert multiple entries

INSERT INTO `shop`
VALUES (NULL, 'Iki', NULL),
       (NULL, 'Lidl', NULL);

INSERT INTO `category` (`name`)
VALUES ('Fermentiniai sūriai'),
       ('Geriamieji jogurtai'),
       ('Juoda duona'),
       ('Agurkai');

-- Ignore errors when using Insert

INSERT IGNORE INTO `shop` (`name`)
VALUES ('Norfa'),
       ('Maxima'),
       ('Aldi');

-- Insert from Select

INSERT INTO `product`
SELECT NULL, 'Juoda AGOTOS duona, 700g', `id`, NULL
FROM `category`
WHERE `name` = 'Juoda duona';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Juoda MOČIUTĖS duona, 450g', `id`
FROM `category`
WHERE `name` = 'Juoda duona';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Ruginė duona JONĖ, 390g', `id`
FROM `category`
WHERE `name` = 'Juoda duona';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Lietuviškas ilgavaisis agurkas', `id`
FROM `category`
WHERE `name` = 'Agurkai';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Ekologišgi agurkai I LOVE ECO', `id`
FROM `category`
WHERE `name` = 'Agurkai';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Ger. nat. jogurtas GRAIKIŠKA AMFORA, 2.6%, 500g', `id`
FROM `category`
WHERE `name` = 'Geriamieji jogurtai';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'Ekol. nat. ger. jogurtas DOBILAS, 2.4%, 330g', `id`
FROM `category`
WHERE `name` = 'Geriamieji jogurtai';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'ROKIŠKIO sūris, 45% rieb., 240g', `id`
FROM `category`
WHERE `name` = 'Fermentiniai sūriai';

INSERT INTO `product` (`name`, `category_id`)
SELECT 'DVARO sūris, 50% rieb., 240g', `id`
FROM `category`
WHERE `name` = 'Fermentiniai sūriai';

-- Bonus

INSERT INTO `product_price` (`product_id`, `shop_id`, `value_without_vat`, `value_with_vat`)
SELECT `product`.`id`, `shop`.`id`, 1.5289, 1.85
FROM `product`
JOIN `shop`
WHERE `product`.`name` = 'Juoda AGOTOS duona, 800g'
AND `shop`.`name` = 'Rimi';

SET @price_entry = LAST_INSERT_ID();

INSERT INTO `product_price_history` (`product_price_id`, `value_without_vat`, `value_with_vat`)
SELECT `product_price`.`id`, `product_price`.`value_without_vat`, `product_price`.`value_with_vat`
FROM `product_price`
WHERE `product_price`.`id` = @price_entry;
