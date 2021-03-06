-- MySQL Script generated by MySQL Workbench
-- sáb 12 feb 2022 12:39:21
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lucasmoy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lucasmoy` ;

-- -----------------------------------------------------
-- Schema lucasmoy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lucasmoy` ;
USE `lucasmoy` ;

-- -----------------------------------------------------
-- Table `lucasmoy`.`Academias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Academias` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Academias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `web` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lucasmoy`.`Profesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Profesores` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Profesores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `apellido` VARCHAR(80) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `academia_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Profesores_Academia_idx` (`academia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Profesores_Academia`
    FOREIGN KEY (`academia_id`)
    REFERENCES `lucasmoy`.`Academias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lucasmoy`.`Alumnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Alumnos` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Alumnos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `apellido` VARCHAR(80) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `academia_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Alumnos_1_idx` (`academia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnos_1`
    FOREIGN KEY (`academia_id`)
    REFERENCES `lucasmoy`.`Academias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lucasmoy`.`Cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Cursos` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NULL,
  `descripcion` VARCHAR(45) NULL,
  `profesor_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cursos_1_idx` (`profesor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cursos_1`
    FOREIGN KEY (`profesor_id`)
    REFERENCES `lucasmoy`.`Profesores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lucasmoy`.`Alumnos_por_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Alumnos_por_curso` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Alumnos_por_curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alumno_id` INT NULL,
  `curso_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Alumnos_por_curso_1_idx` (`alumno_id` ASC) VISIBLE,
  INDEX `fk_Alumnos_por_curso_2_idx` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnos_por_curso_1`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `lucasmoy`.`Alumnos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_por_curso_2`
    FOREIGN KEY (`curso_id`)
    REFERENCES `lucasmoy`.`Cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lucasmoy`.`Notas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lucasmoy`.`Notas` ;

CREATE TABLE IF NOT EXISTS `lucasmoy`.`Notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nota` FLOAT NOT NULL,
  `alumno_id` INT NULL,
  `curso_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_NotaAlumno_idx` (`alumno_id` ASC) VISIBLE,
  INDEX `fk_NotaCurso_idx` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_NotaAlumno`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `lucasmoy`.`Alumnos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaCurso`
    FOREIGN KEY (`curso_id`)
    REFERENCES `lucasmoy`.`Cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
