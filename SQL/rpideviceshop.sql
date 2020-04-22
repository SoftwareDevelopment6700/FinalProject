-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rpideviceshop
-- -----------------------------------------------------
-- Schema used with the RPIDeviceShop applciation
DROP SCHEMA IF EXISTS `rpideviceshop` ;

-- -----------------------------------------------------
-- Schema rpideviceshop
--
-- Schema used with the RPIDeviceShop applciation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rpideviceshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `rpideviceshop` ;

-- -----------------------------------------------------
-- Table `rpideviceshop`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpideviceshop`.`customer` ;

CREATE TABLE IF NOT EXISTS `rpideviceshop`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city_region` VARCHAR(2) NOT NULL,
  `cc_number` VARCHAR(19) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Maintains customer details.';


-- -----------------------------------------------------
-- Table `rpideviceshop`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpideviceshop`.`customer_order` ;

CREATE TABLE IF NOT EXISTS `rpideviceshop`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL,
  `data_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `rpideviceshop`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpideviceshop`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpideviceshop`.`category` ;

CREATE TABLE IF NOT EXISTS `rpideviceshop`.`category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpideviceshop`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpideviceshop`.`product` ;

CREATE TABLE IF NOT EXISTS `rpideviceshop`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `description` TINYTEXT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `rpideviceshop`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpideviceshop`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpideviceshop`.`ordered_product` ;

CREATE TABLE IF NOT EXISTS `rpideviceshop`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordered_product_customer_order1`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `rpideviceshop`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `rpideviceshop`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
