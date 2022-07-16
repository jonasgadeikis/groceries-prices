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
