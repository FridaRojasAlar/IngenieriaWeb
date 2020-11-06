SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospitaldb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospitaldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `reportes` ;

-- -----------------------------------------------------
-- Schema hospitaldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reportes` DEFAULT CHARACTER SET latin1 ;
USE `reportes` ;

-- ------------------------------------------------------TABLE---------
-- table usuarios
-- --------------

DROP TABLE IF EXISTS  `reportes`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `hospitaldb`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(255) NOT NULL,
  `APaterno` VARCHAR(255) NOT NULL,
  `AMaterno` VARCHAR(45) NOT NULL,
   `correo` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `T_Usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `reportes`.`archivos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reportes`.`archivos` ;

CREATE TABLE IF NOT EXISTS `reportes`.`archivos` (
  `idarchivos` INT NOT NULL AUTO_INCREMENT,
  `n_archivo` VARCHAR(255) NOT NULL,
  `fecha` DATE NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idarchivo`),
  INDEX `fk_archivos_usuario1_idx` (`idusuarios` ASC),
  CONSTRAINT `fk_archivos_usuario1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `reportes`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `reportes`.`regiones `
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reportes`.`regiones ` ;

CREATE TABLE IF NOT EXISTS `reportes`.`regiones` (
  `idregiones` INT NOT NULL AUTO_INCREMENT,
  `n_region` VARCHAR(255) NOT NULL,
  `t_region` DATE NOT NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idRegiones`),
  INDEX `fk_regiones_usuario1_idx` (`idUsuarios` ASC),
  CONSTRAINT `fk_regiones_usuario1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `reportes`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `reortes`.`resumenes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reportes`.`resumen` ;

CREATE TABLE IF NOT EXISTS `reportes`.`resumen` (
  `idResumene ` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `fecha` DATE NOT NULL,
  `resultado1` VARCHAR(45) NOT NULL,
  `resultado2` VARCHAR(45) NOT NULL,
  `resultado3` VARCHAR(45) NOT NULL,
  `T_Regio` INT NOT NULL,
  `idarchivos` INT NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`cedula`),
  INDEX `fk_resumen_archivos1_idx` (`idarchivos` ASC),
  INDEX `fk_resumen_regiones1_idx` (`idregiones` ASC),
  INDEX `fk_resumen_usuario1_idx` (`idUsuarios` ASC),
  CONSTRAINT `fk_resumen_usuario1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `reportes`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resumen_archivos1`
    FOREIGN KEY (`idarchivos`)
    REFERENCES `reportes`.`archivos` (`idarchivos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resumen_regiones1`
    FOREIGN KEY (`idregiones`)
    REFERENCES `repotes`.`regiones` (`idregiones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;