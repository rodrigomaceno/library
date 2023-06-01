-- MySQL Script generated by MySQL Workbench
-- Thu Jun  1 15:33:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Accounts` (
  `id` INT NOT NULL,
  `dateOfCreation` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Accounts_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `Accounts_id`),
  INDEX `fk_Users_Accounts_idx` (`Accounts_id` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Accounts`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemRecommendations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemRecommendations` (
  `idItemRecommendations` INT NOT NULL,
  `Accounts_id` INT NULL,
  PRIMARY KEY (`idItemRecommendations`),
  INDEX `fk_ItemRecommendations_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
  CONSTRAINT `fk_ItemRecommendations_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DVDs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DVDs` (
  `title` VARCHAR(45) NOT NULL,
  `releaseDate` DATE NULL,
  `genre` VARCHAR(45) NULL,
  `ItemRecommendations_idItemRecommendations` INT NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`title`, `ItemRecommendations_idItemRecommendations`, `author`),
  INDEX `fk_DVDs_ItemRecommendations1_idx` (`ItemRecommendations_idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_DVDs_ItemRecommendations1`
    FOREIGN KEY (`ItemRecommendations_idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`idItemRecommendations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Books` (
  `isbn` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NULL,
  `publishingYear` YEAR(4) NULL,
  `author` VARCHAR(45) NULL,
  `ItemRecommendations_idItemRecommendations` INT NOT NULL,
  PRIMARY KEY (`isbn`, `ItemRecommendations_idItemRecommendations`),
  INDEX `fk_Books_ItemRecommendations1_idx` (`ItemRecommendations_idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_Books_ItemRecommendations1`
    FOREIGN KEY (`ItemRecommendations_idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`idItemRecommendations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CDs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CDs` (
  `title` VARCHAR(45) NOT NULL,
  `artist` VARCHAR(45) NOT NULL,
  `releaseDate` DATE NULL,
  `recordLabel` VARCHAR(45) NULL,
  `genre` VARCHAR(45) NULL,
  `ItemRecommendations_idItemRecommendations` INT NOT NULL,
  PRIMARY KEY (`title`, `artist`, `ItemRecommendations_idItemRecommendations`),
  INDEX `fk_CDs_ItemRecommendations1_idx` (`ItemRecommendations_idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_CDs_ItemRecommendations1`
    FOREIGN KEY (`ItemRecommendations_idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`idItemRecommendations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservations` (
  `idReservations` INT NOT NULL,
  `Accounts_id` INT NOT NULL,
  `reservation` VARCHAR(45) NULL,
  `DVDs_title` VARCHAR(45) NOT NULL,
  `DVDs_author` VARCHAR(45) NOT NULL,
  `isbn` VARCHAR(45) NOT NULL,
  `CDs_title` VARCHAR(45) NOT NULL,
  `CDs_artist` VARCHAR(45) NOT NULL,
  `DVD_res_num` INT NULL,
  `CD_res_num` INT NULL,
  `isbn_res_num` INT NULL,
  PRIMARY KEY (`idReservations`, `Accounts_id`),
  INDEX `fk_Reservations_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
  INDEX `fk_Reservations_DVDs1_idx` (`DVDs_title` ASC, `DVDs_author` ASC) VISIBLE,
  INDEX `fk_Reservations_Books1_idx` (`isbn` ASC) VISIBLE,
  INDEX `fk_Reservations_CDs1_idx` (`CDs_title` ASC, `CDs_artist` ASC) VISIBLE,
  CONSTRAINT `fk_Reservations_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservations_DVDs1`
    FOREIGN KEY (`DVDs_title` , `DVDs_author`)
    REFERENCES `mydb`.`DVDs` (`title` , `author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservations_Books1`
    FOREIGN KEY (`isbn`)
    REFERENCES `mydb`.`Books` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservations_CDs1`
    FOREIGN KEY (`CDs_title` , `CDs_artist`)
    REFERENCES `mydb`.`CDs` (`title` , `artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loans` (
  `idLoans` INT NOT NULL,
  `Accounts_id` INT NOT NULL,
  PRIMARY KEY (`idLoans`, `Accounts_id`),
  INDEX `fk_Loans_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loans_has_DVDs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loans_has_DVDs` (
  `Loans_idLoans` INT NOT NULL,
  `DVDs_title` VARCHAR(45) NOT NULL,
  `DVDs_releaseDate` DATE NOT NULL,
  `DVDs_ItemRecommendations_idItemRecommendations` INT NULL,
  `copyNumber` INT NOT NULL,
  PRIMARY KEY (`Loans_idLoans`, `DVDs_title`, `DVDs_releaseDate`, `copyNumber`),
  INDEX `fk_Loans_has_DVDs_DVDs1_idx` (`DVDs_title` ASC, `DVDs_releaseDate` ASC, `DVDs_ItemRecommendations_idItemRecommendations` ASC) VISIBLE,
  INDEX `fk_Loans_has_DVDs_Loans1_idx` (`Loans_idLoans` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_DVDs_Loans1`
    FOREIGN KEY (`Loans_idLoans`)
    REFERENCES `mydb`.`Loans` (`idLoans`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loans_has_DVDs_DVDs1`
    FOREIGN KEY (`DVDs_title` , `DVDs_releaseDate`)
    REFERENCES `mydb`.`DVDs` (`title` , `releaseDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loans_has_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loans_has_Books` (
  `idLoans` INT NOT NULL,
  `isbn` VARCHAR(45) NOT NULL,
  `copyNumber` INT NOT NULL,
  PRIMARY KEY (`idLoans`, `isbn`, `copyNumber`),
  INDEX `fk_Loans_has_Books_Books1_idx` (`isbn` ASC) VISIBLE,
  INDEX `fk_Loans_has_Books_Loans1_idx` (`idLoans` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_Books_Loans1`
    FOREIGN KEY (`idLoans`)
    REFERENCES `mydb`.`Loans` (`idLoans`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loans_has_Books_Books1`
    FOREIGN KEY (`isbn`)
    REFERENCES `mydb`.`Books` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loans_has_CDs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loans_has_CDs` (
  `Loans_idLoans` INT NOT NULL,
  `CDs_title` VARCHAR(45) NOT NULL,
  `CDs_artist` VARCHAR(45) NOT NULL,
  `copyNumber` INT NOT NULL,
  PRIMARY KEY (`Loans_idLoans`, `CDs_title`, `CDs_artist`, `copyNumber`),
  INDEX `fk_Loans_has_CDs_Loans1_idx` (`Loans_idLoans` ASC) VISIBLE,
  INDEX `fk_Loans_has_CDs_CDs1_idx` (`CDs_title` ASC, `CDs_artist` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_CDs_Loans1`
    FOREIGN KEY (`Loans_idLoans`)
    REFERENCES `mydb`.`Loans` (`idLoans`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loans_has_CDs_CDs1`
    FOREIGN KEY (`CDs_title` , `CDs_artist`)
    REFERENCES `mydb`.`CDs` (`title` , `artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
