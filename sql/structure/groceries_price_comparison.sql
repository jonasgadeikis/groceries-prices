CREATE TABLE IF NOT EXISTS `category` (
    `id` INT(11) AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `shop` (
    `id` INT(11) AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `photo_url` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `product` (
    `id` INT(11) AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `category_id` INT(11) NOT NULL,
    `photo_url` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `product_price` (
    `id` INT(11) AUTO_INCREMENT NOT NULL,
    `product_id` INT(11) NOT NULL,
    `shop_id` INT(11) NOT NULL,
    `value_without_vat` FLOAT(9, 4) NOT NULL,
    `value_with_vat` FLOAT(9, 2) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `product_price_history` (
    `id` INT(11) AUTO_INCREMENT NOT NULL,
    `product_price_id` INT(11) NOT NULL,
    `value_without_vat` FLOAT(9, 4) NOT NULL,
    `value_with_vat` FLOAT(9, 2) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

ALTER TABLE `product`
ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `product_price`
ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `product_price`
ADD CONSTRAINT `fk_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

ALTER TABLE `product_price_history`
ADD CONSTRAINT `fk_product_price_id` FOREIGN KEY (`product_price_id`) REFERENCES `product_price` (`id`);

CREATE UNIQUE INDEX `uidx_shop_name`
ON `shop` (`name`);

CREATE UNIQUE INDEX `uidx_category_name`
ON `category` (`name`);

CREATE UNIQUE INDEX `uidx_shop_product_price`
ON `product_price` (`product_id`, `shop_id`);
