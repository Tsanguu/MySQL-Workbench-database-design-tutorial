-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema booksdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema booksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `booksdb` DEFAULT CHARACTER SET utf8 ;
USE `booksdb` ;

-- -----------------------------------------------------
-- Table `booksdb`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booksdb`.`publisher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `booksdb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booksdb`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(45) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `total_pages` INT NOT NULL,
  `publication_year` YEAR(4) NOT NULL,
  `publisher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `isbn_UNIQUE` (`isbn` ASC) VISIBLE,
  INDEX `fk_book_publisher_idx` (`publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_publisher`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `booksdb`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `booksdb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booksdb`.`author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `booksdb`.`book_has_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booksdb`.`book_has_author` (
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `author_id`),
  INDEX `fk_book_has_author_author_idx` (`author_id` ASC) VISIBLE,
  INDEX `fk_book_has_author_book_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_author_book`
    FOREIGN KEY (`book_id`)
    REFERENCES `booksdb`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_author_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `booksdb`.`author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
