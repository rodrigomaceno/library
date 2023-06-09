-- MySQL Script generated by MySQL Workbench
-- Mon Jun  5 10:19:00 2023
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
-- Table `mydb`.`Preferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preferences` (
  `idPreferences` INT NOT NULL AUTO_INCREMENT,
  `favoriteBooks` VARCHAR(45) NULL,
  `favoriteDVDs` VARCHAR(45) NULL,
  `favoriteCDs` VARCHAR(45) NULL,
  PRIMARY KEY (`idPreferences`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dateCreated` DATETIME NULL DEFAULT NOW(),
  `userName` VARCHAR(45) NOT NULL,
  `userPhoneNum` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `idPreferences` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Accounts_Preferences1_idx` (`idPreferences` ASC) VISIBLE,
  CONSTRAINT `fk_Accounts_Preferences1`
    FOREIGN KEY (`idPreferences`)
    REFERENCES `mydb`.`Preferences` (`idPreferences`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemRecommendations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemRecommendations` (
  `id` INT NOT NULL,
  `recommendedBooks` VARCHAR(45) NULL,
  `recommendedCDs` VARCHAR(45) NULL,
  `recommendedDVDs` VARCHAR(45) NULL,
  `Accounts_id` INT NOT NULL,
  PRIMARY KEY (`id`),
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
  `author` VARCHAR(45) NOT NULL,
  `idItemRecommendations` INT NULL,
  `releaseDate` DATE NULL,
  `genre` VARCHAR(45) NULL,
  PRIMARY KEY (`title`, `author`),
  INDEX `fk_DVDs_ItemRecommendations1_idx` (`idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_DVDs_ItemRecommendations1`
    FOREIGN KEY (`idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`id`)
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
  `idItemRecommendations` INT NULL,
  PRIMARY KEY (`isbn`),
  INDEX `fk_Books_ItemRecommendations1_idx` (`idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_Books_ItemRecommendations1`
    FOREIGN KEY (`idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`id`)
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
  `idItemRecommendations` INT NULL,
  PRIMARY KEY (`title`, `artist`),
  INDEX `fk_CDs_ItemRecommendations1_idx` (`idItemRecommendations` ASC) VISIBLE,
  CONSTRAINT `fk_CDs_ItemRecommendations1`
    FOREIGN KEY (`idItemRecommendations`)
    REFERENCES `mydb`.`ItemRecommendations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservations` (
  `idReservations` INT NOT NULL AUTO_INCREMENT,
  `DVDs_title` VARCHAR(45) NULL,
  `DVDs_author` VARCHAR(45) NULL,
  `isbn` VARCHAR(45) NULL,
  `CDs_title` VARCHAR(45) NULL,
  `CDs_artist` VARCHAR(45) NULL,
  `DVD_res_num` INT NULL,
  `CD_res_num` INT NULL,
  `isbn_res_num` INT NULL,
  `Accounts_id` INT NOT NULL,
  PRIMARY KEY (`idReservations`, `Accounts_id`),
  INDEX `fk_Reservations_DVDs1_idx` (`DVDs_title` ASC, `DVDs_author` ASC) VISIBLE,
  INDEX `fk_Reservations_Books1_idx` (`isbn` ASC) VISIBLE,
  INDEX `fk_Reservations_CDs1_idx` (`CDs_title` ASC, `CDs_artist` ASC) VISIBLE,
  INDEX `fk_Reservations_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservations_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Accounts_id` INT NOT NULL,
  `numItems` INT NULL,
  PRIMARY KEY (`id`, `Accounts_id`),
  INDEX `fk_Loans_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DVDLoans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DVDLoans` (
  `copyNumber` INT NOT NULL,
  `idLoans` INT NOT NULL,
  `DVDs_title` VARCHAR(45) NULL,
  `DVDs_author` VARCHAR(45) NULL,
  PRIMARY KEY (`copyNumber`, `idLoans`),
  INDEX `fk_Loans_has_DVDs_Loans1_idx` (`idLoans` ASC) VISIBLE,
  INDEX `fk_DVDLoans_DVDs1_idx` (`DVDs_title` ASC, `DVDs_author` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_DVDs_Loans1`
    FOREIGN KEY (`idLoans`)
    REFERENCES `mydb`.`Loans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DVDLoans_DVDs1`
    FOREIGN KEY (`DVDs_title` , `DVDs_author`)
    REFERENCES `mydb`.`DVDs` (`title` , `author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BookLoans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookLoans` (
  `copyNumber` INT NOT NULL,
  `idLoans` INT NOT NULL,
  `isbn` VARCHAR(45) NULL,
  PRIMARY KEY (`copyNumber`, `idLoans`),
  INDEX `fk_Loans_has_Books_Books1_idx` (`isbn` ASC) VISIBLE,
  INDEX `fk_Loans_has_Books_Loans1_idx` (`idLoans` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_Books_Loans1`
    FOREIGN KEY (`idLoans`)
    REFERENCES `mydb`.`Loans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loans_has_Books_Books1`
    FOREIGN KEY (`isbn`)
    REFERENCES `mydb`.`Books` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CDLoans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CDLoans` (
  `copyNumber` INT NOT NULL,
  `idLoans` INT NOT NULL,
  `CDs_title` VARCHAR(45) NULL,
  `CDs_artist` VARCHAR(45) NULL,
  PRIMARY KEY (`copyNumber`, `idLoans`),
  INDEX `fk_Loans_has_CDs_Loans1_idx` (`idLoans` ASC) VISIBLE,
  INDEX `fk_Loans_has_CDs_CDs1_idx` (`CDs_title` ASC, `CDs_artist` ASC) VISIBLE,
  CONSTRAINT `fk_Loans_has_CDs_Loans1`
    FOREIGN KEY (`idLoans`)
    REFERENCES `mydb`.`Loans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loans_has_CDs_CDs1`
    FOREIGN KEY (`CDs_title` , `CDs_artist`)
    REFERENCES `mydb`.`CDs` (`title` , `artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Histories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Histories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `booksCheckedOut` VARCHAR(45) NULL,
  `dvdsCheckedOut` VARCHAR(45) NULL,
  `cdsCheckedOut` VARCHAR(45) NULL,
  `Accounts_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_History_Accounts1_idx` (`Accounts_id` ASC) VISIBLE,
  CONSTRAINT `fk_History_Accounts1`
    FOREIGN KEY (`Accounts_id`)
    REFERENCES `mydb`.`Accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
