-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qastore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema qastore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qastore` DEFAULT CHARACTER SET utf8 ;
USE `qastore` ;

-- -----------------------------------------------------
-- Table `qastore`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`tipousuario` (
  `idtipoUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipoUsuario`),
  UNIQUE INDEX `idtipoUsuario_UNIQUE` (`idtipoUsuario` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`usuario` (
  `correo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `contrasena` VARCHAR(45) NULL DEFAULT NULL,
  `tipoUsuario_idtipoUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC),
  INDEX `fk_Usuario_tipoUsuario1_idx` (`tipoUsuario_idtipoUsuario` ASC),
  CONSTRAINT `fk_Usuario_tipoUsuario1`
    FOREIGN KEY (`tipoUsuario_idtipoUsuario`)
    REFERENCES `qastore`.`tipousuario` (`idtipoUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`carrito` (
  `idCarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL DEFAULT NULL,
  `Usuario_correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarrito`),
  UNIQUE INDEX `idCarrito_UNIQUE` (`idCarrito` ASC),
  INDEX `fk_Carrito_Usuario1_idx` (`Usuario_correo` ASC),
  CONSTRAINT `fk_Carrito_Usuario1`
    FOREIGN KEY (`Usuario_correo`)
    REFERENCES `qastore`.`usuario` (`correo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`producto` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `imagen` VARCHAR(200) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `stock` INT(11) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idProducto` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`carrito_x_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`carrito_x_producto` (
  `Carrito_idCarrito` INT(11) NOT NULL,
  `Producto_idProducto` INT(11) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`Carrito_idCarrito`, `Producto_idProducto`),
  INDEX `fk_Carrito_has_Producto_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_Carrito_has_Producto_Carrito_idx` (`Carrito_idCarrito` ASC),
  CONSTRAINT `fk_Carrito_has_Producto_Carrito`
    FOREIGN KEY (`Carrito_idCarrito`)
    REFERENCES `qastore`.`carrito` (`idCarrito`),
  CONSTRAINT `fk_Carrito_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `qastore`.`producto` (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`categoria` (
  `idCategoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `condicion` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `idCategoria_UNIQUE` (`idCategoria` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`categoria_x_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`categoria_x_producto` (
  `Categoria_idCategoria` INT(11) NOT NULL,
  `Producto_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`Categoria_idCategoria`, `Producto_idProducto`),
  INDEX `fk_Categoria_has_Producto_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_Categoria_has_Producto_Categoria1_idx` (`Categoria_idCategoria` ASC),
  CONSTRAINT `fk_Categoria_has_Producto_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `qastore`.`categoria` (`idCategoria`),
  CONSTRAINT `fk_Categoria_has_Producto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `qastore`.`producto` (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`tarjeta` (
  `idTarjeta` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_tarjeta` VARCHAR(45) NULL DEFAULT NULL,
  `numero_tarjeta` INT(11) NULL DEFAULT NULL,
  `ccv` INT(11) NULL DEFAULT NULL,
  `fecha_expiracion` DATE NULL DEFAULT NULL,
  `Usuario_correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  UNIQUE INDEX `idPago_UNIQUE` (`idTarjeta` ASC),
  INDEX `fk_Tarjeta_Usuario1_idx` (`Usuario_correo` ASC),
  CONSTRAINT `fk_Tarjeta_Usuario1`
    FOREIGN KEY (`Usuario_correo`)
    REFERENCES `qastore`.`usuario` (`correo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qastore`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qastore`.`orden` (
  `idOrden` INT(11) NOT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  `numero_comprobante` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `Carrito_idCarrito` INT(11) NOT NULL,
  `Tarjeta_idTarjeta` INT(11) NOT NULL,
  PRIMARY KEY (`idOrden`),
  UNIQUE INDEX `idOrden_UNIQUE` (`idOrden` ASC),
  UNIQUE INDEX `numero_comprobante_UNIQUE` (`numero_comprobante` ASC),
  INDEX `fk_Orden_Carrito1_idx` (`Carrito_idCarrito` ASC),
  INDEX `fk_Orden_Tarjeta1_idx` (`Tarjeta_idTarjeta` ASC),
  CONSTRAINT `fk_Orden_Carrito1`
    FOREIGN KEY (`Carrito_idCarrito`)
    REFERENCES `qastore`.`carrito` (`idCarrito`),
  CONSTRAINT `fk_Orden_Tarjeta1`
    FOREIGN KEY (`Tarjeta_idTarjeta`)
    REFERENCES `qastore`.`tarjeta` (`idTarjeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `qastore` ;

-- -----------------------------------------------------
-- function agregarProductoXCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `agregarProductoXCarrito`(pProductoID INT,pCantidad INT, pCarritoID INT) RETURNS int(11)
BEGIN
DECLARE Resultado INT;
SET Resultado = 1;
IF pCantidad <= (SELECT stock from producto where idProducto = pProductoID) THEN
CALL `qastore`.`insertarCarritoXProducto`(pCarritoID, pProductoID, pCantidad);
ELSE
SET Resultado = 0;
END IF;
  
RETURN Resultado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCarrito`(IN pFecha DATETIME, IN pCorreo VARCHAR(45))
BEGIN
INSERT INTO `qastore`.`carrito`
(
`fecha`,
`Usuario_correo`)
VALUES
(
pFecha,
pCorreo);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarCarritoXProducto
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCarritoXProducto`(IN pCarritoID INT, IN pProductoID INT, IN pCantidad INT)
BEGIN
INSERT INTO `qastore`.`carrito_x_producto`
(`Carrito_idCarrito`,
`Producto_idProducto`,
`cantidad`,
`precio`)
VALUES
(pCarritoID,
pProductoID,
pCantidad,
pCantidad * (SELECT 
    precio 
FROM producto where idProducto = pProductoID));
update producto set stock = (stock - pCantidad) where idProducto = pProductoID;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarCategoria
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoria`(IN pNombre VARCHAR(45), IN pDescripcion VARCHAR(200), IN pCondicion INT)
BEGIN
INSERT INTO `qastore`.`categoria`
(
`nombre`,
`descripcion`,
`condicion`)
VALUES
(
pNombre,
pDescripcion,
pCondicion);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarCategoriaXProducto
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoriaXProducto`(IN pCategoriaID INT, IN pProductoID INT)
BEGIN
INSERT INTO `qastore`.`categoria_x_producto`
(`Categoria_idCategoria`,
`Producto_idProducto`)
VALUES
(pCategoriaID,
pProductoID);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarOrden
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarOrden`(IN pFecha DATETIME, IN pDireccion VARCHAR(200), IN PCarritoID INT)
BEGIN
INSERT INTO `qastore`.`orden`
(
`total`,
`fecha`,
`direccion`,
`Carrito_idCarrito`,
`Tarjeta_idTarjeta`)
VALUES
(
0,
pFecha,
pDireccion,
pCarritoID);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto`(IN pNombre VARCHAR(45), IN Pdescripcion VARCHAR(200), IN pImagen VARCHAR (200), IN pPrecio FLOAT, IN pStock INT, IN pEstado VARCHAR(45))
BEGIN
INSERT INTO `qastore`.`producto`
(
`nombre`,
`descripcion`,
`imagen`,
`precio`,
`stock`,
`estado`)
VALUES
(
pNombre,
pDescripcion,
pImagen,
pPrecio,
pStock,
pEstado);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarTarjeta
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTarjeta`(IN pNombre VARCHAR(45), IN pNumero INT, IN pCCV INT, IN pFecha DATE, IN pCorreo VARCHAR(45))
BEGIN
INSERT INTO `qastore`.`tarjeta`
(
`nombre_tarjeta`,
`numero_tarjeta`,
`ccv`,
`fecha_expiracion`,
`Usuario_correo`)
VALUES
(
pNombre,
MD5(pNumero),
MD5(pCCV),
pFecha,
pCorreo);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN pNombre VARCHAR(45), IN pApellido1 VARCHAR(45), IN pApellido2 VARCHAR(45), IN pCorreo VARCHAR(45), IN pContrasena VARCHAR(45), IN pTipoUsuarioID INT)
BEGIN
INSERT INTO `qastore`.`usuario`
(
`nombre`,
`apellido1`,
`apellido2`,
`correo`,
`contrasena`,
`tipoUsuario_idtipoUsuario`)
VALUES
(
pNombre,
pApellido1,
pApellido2,
pCorreo,
MD5(pContrasena),
pTipoUsuarioID);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertartipoUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertartipoUsuario`(IN pNombre VARCHAR(45))
BEGIN
INSERT INTO `qastore`.`tipousuario`
(
`nombre`)
VALUES
(
pNombre);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productos_x_categoria
-- -----------------------------------------------------

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productos_x_categoria`(in IDcategoria INT)
BEGIN
  select idProducto,nombre,descripcion, imagen, precio,stock from Producto
  inner join categoria_x_producto on idProducto = Producto_idProducto and Categoria_idCategoria = IDcategoria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure actualizarProducto
-- -----------------------------------------------------
DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto`(IN id INT,IN pNombre VARCHAR(45), IN Pdescripcion VARCHAR(200), IN pImagen VARCHAR (200), IN pPrecio FLOAT, IN pStock INT, IN cat int)
BEGIN
  update producto set nombre = pNombre, 
  descripcion = Pdescripcion, 
  precio = pPrecio,
  stock = pStock,
  imagen = pImagen
  where idProducto = id;
  update categoria_x_producto set Categoria_idCategoria = cat
  where Producto_idProducto = id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure busqueda_producto
-- -----------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `busqueda_producto`(IN frase VARCHAR(45))
BEGIN
SELECT idProducto, nombre, descripcion, imagen, precio, stock, estado
FROM producto WHERE nombre LIKE CONCAT('%', frase, '%');

END$$
DELIMITER ;


-- -----------------------------------------------------
-- procedure buscarProductoxID
-- -----------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarProductoxID`(IN pID INT)
BEGIN

SELECT p.nombre, p.descripcion, p.precio, p.imagen, p.precio, p.stock, p.estado, pc.Categoria_idCategoria, c.nombre
from producto p, categoria_x_producto pc, categoria c where
pID = p.idProducto and pID = pc.Producto_idProducto and pc.Categoria_idCategoria = c.idCategoria;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure verificarProducto
-- -----------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarProducto`(IN id INT)
BEGIN
  select idProducto, nombre, imagen, precio from producto where idProducto = id and stock > 0;
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- procedure buscarProductoxID
-- -----------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN pCorreo VARCHAR(45), IN pContrasena VARCHAR(45))
BEGIN

IF ((SELECT `login_check`(pCorreo , pContrasena)) = 1) THEN
SELECT correo, nombre, apellido1, apellido2 from usuario where correo = pCorreo;
END IF;

END$$
DELIMITER ;


-- -----------------------------------------------------
-- function login_check
-- -----------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `login_check`(pCorreo VARCHAR(45), pContrasena VARCHAR(45)) RETURNS int(11)
BEGIN
DECLARE Resultado INT;
SET Resultado = 0;
IF (EXISTS(SELECT correo FROM usuario where correo = pCorreo AND
	contrasena = md5(pContrasena))) THEN
SET Resultado = 1;
END IF;
RETURN Resultado;
END$$
DELIMITER ;
