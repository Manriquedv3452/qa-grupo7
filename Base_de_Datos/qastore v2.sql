-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2018 a las 23:11:17
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9
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

--
-- Base de datos: `qastore`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `Usuario_correo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_x_producto`
--

CREATE TABLE `carrito_x_producto` (
  `Carrito_idCarrito` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_x_producto`
--

CREATE TABLE `categoria_x_producto` (
  `Categoria_idCategoria` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `numero_comprobante` int(11) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `Carrito_idCarrito` int(11) NOT NULL,
  `Tarjeta_idTarjeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `idTarjeta` int(11) NOT NULL,
  `nombre_tarjeta` varchar(45) DEFAULT NULL,
  `numero_tarjeta` int(11) DEFAULT NULL,
  `ccv` int(11) DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `Usuario_correo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idtipoUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `tipoUsuario_idtipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD UNIQUE KEY `idCarrito_UNIQUE` (`idCarrito`),
  ADD KEY `fk_Carrito_Usuario1_idx` (`Usuario_correo`);

--
-- Indices de la tabla `carrito_x_producto`
--
ALTER TABLE `carrito_x_producto`
  ADD PRIMARY KEY (`Carrito_idCarrito`,`Producto_idProducto`),
  ADD KEY `fk_Carrito_has_Producto_Producto1_idx` (`Producto_idProducto`),
  ADD KEY `fk_Carrito_has_Producto_Carrito_idx` (`Carrito_idCarrito`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`);

--
-- Indices de la tabla `categoria_x_producto`
--
ALTER TABLE `categoria_x_producto`
  ADD PRIMARY KEY (`Categoria_idCategoria`,`Producto_idProducto`),
  ADD KEY `fk_Categoria_has_Producto_Producto1_idx` (`Producto_idProducto`),
  ADD KEY `fk_Categoria_has_Producto_Categoria1_idx` (`Categoria_idCategoria`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD UNIQUE KEY `idOrden_UNIQUE` (`idOrden`),
  ADD UNIQUE KEY `numero_comprobante_UNIQUE` (`numero_comprobante`),
  ADD KEY `fk_Orden_Carrito1_idx` (`Carrito_idCarrito`),
  ADD KEY `fk_Orden_Tarjeta1_idx` (`Tarjeta_idTarjeta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `idProducto_UNIQUE` (`idProducto`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idTarjeta`),
  ADD UNIQUE KEY `idPago_UNIQUE` (`idTarjeta`),
  ADD KEY `fk_Tarjeta_Usuario1_idx` (`Usuario_correo`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipoUsuario`),
  ADD UNIQUE KEY `idtipoUsuario_UNIQUE` (`idtipoUsuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD KEY `fk_Usuario_tipoUsuario1_idx` (`tipoUsuario_idtipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `numero_comprobante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idtipoUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_Carrito_Usuario1` FOREIGN KEY (`Usuario_correo`) REFERENCES `users` (`email`);

--
-- Filtros para la tabla `carrito_x_producto`
--
ALTER TABLE `carrito_x_producto`
  ADD CONSTRAINT `fk_Carrito_has_Producto_Carrito` FOREIGN KEY (`Carrito_idCarrito`) REFERENCES `carrito` (`idCarrito`),
  ADD CONSTRAINT `fk_Carrito_has_Producto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `categoria_x_producto`
--
ALTER TABLE `categoria_x_producto`
  ADD CONSTRAINT `fk_Categoria_has_Producto_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `fk_Categoria_has_Producto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_Orden_Carrito1` FOREIGN KEY (`Carrito_idCarrito`) REFERENCES `carrito` (`idCarrito`),
  ADD CONSTRAINT `fk_Orden_Tarjeta1` FOREIGN KEY (`Tarjeta_idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `fk_Tarjeta_Usuario1` FOREIGN KEY (`Usuario_correo`) REFERENCES `users` (`email`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_tipoUsuario1` FOREIGN KEY (`tipoUsuario_idtipoUsuario`) REFERENCES `tipousuario` (`idtipoUsuario`);
COMMIT;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto` (IN `id` INT, IN `pNombre` VARCHAR(45), IN `Pdescripcion` VARCHAR(200), IN `pImagen` VARCHAR(200), IN `pPrecio` FLOAT, IN `pStock` INT, IN `cat` INT)  BEGIN
  update producto set nombre = pNombre, 
  descripcion = Pdescripcion, 
  precio = pPrecio,
  stock = pStock,
  imagen = pImagen
  where idProducto = id;
  update categoria_x_producto set Categoria_idCategoria = cat
  where Producto_idProducto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarProductoxID` (IN `pID` INT)  BEGIN

SELECT p.nombre, p.descripcion, p.precio, p.imagen, p.precio, p.stock, p.estado, pc.Categoria_idCategoria, c.nombre
from producto p, categoria_x_producto pc, categoria c where
pID = p.idProducto and pID = pc.Producto_idProducto and pc.Categoria_idCategoria = c.idCategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `busqueda_producto` (IN `frase` VARCHAR(45))  BEGIN
SELECT idProducto, nombre, descripcion, imagen, precio, stock, estado
FROM producto WHERE nombre LIKE CONCAT('%', frase, '%');

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCarrito` (IN `pFecha` DATETIME, IN `pCorreo` VARCHAR(45))  BEGIN
INSERT INTO `qastore`.`carrito`
(
`fecha`,
`Usuario_correo`)
VALUES
(
pFecha,
pCorreo);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCarritoXProducto` (IN `pCarritoID` INT, IN `pProductoID` INT, IN `pCantidad` INT)  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoria` (IN `pNombre` VARCHAR(45), IN `pDescripcion` VARCHAR(200), IN `pCondicion` INT)  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoriaXProducto` (IN `pCategoriaID` INT, IN `pProductoID` INT)  BEGIN
INSERT INTO `qastore`.`categoria_x_producto`
(`Categoria_idCategoria`,
`Producto_idProducto`)
VALUES
(pCategoriaID,
pProductoID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarOrden` (IN `pFecha` DATETIME, IN `pDireccion` VARCHAR(200), IN `PCarritoID` INT)  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto` (IN `pNombre` VARCHAR(45), IN `Pdescripcion` VARCHAR(200), IN `pImagen` VARCHAR(200), IN `pPrecio` FLOAT, IN `pStock` INT, IN `pEstado` VARCHAR(45))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTarjeta` (IN `pNombre` VARCHAR(45), IN `pNumero` INT, IN `pCCV` INT, IN `pFecha` DATE, IN `pCorreo` VARCHAR(45))  BEGIN
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
pNumero,
pCCV,
pFecha,
pCorreo);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertartipoUsuario` (IN `pNombre` VARCHAR(45))  BEGIN
INSERT INTO `qastore`.`tipousuario`
(
`nombre`)
VALUES
(
pNombre);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `pNombre` VARCHAR(45), IN `pApellido1` VARCHAR(45), IN `pApellido2` VARCHAR(45), IN `pCorreo` VARCHAR(45), IN `pContrasena` VARCHAR(45), IN `pTipoUsuarioID` INT)  BEGIN
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
pContrasena,
pTipoUsuarioID);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productos_x_categoria` (IN `IDcategoria` INT)  BEGIN
  select idProducto,nombre,descripcion, imagen, precio,stock from Producto
  inner join categoria_x_producto on idProducto = Producto_idProducto and Categoria_idCategoria = IDcategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarProducto` (IN `id` INT)  BEGIN
  select idProducto, nombre, imagen, precio from producto where idProducto = id and stock > 0;
END$$

DELIMITER $$
USE `qastore`$$
CREATE PROCEDURE `insertarAdministrador`(IN `pNombre` VARCHAR(45), IN `pApellido1` VARCHAR(45), IN `pApellido2` VARCHAR(45), IN `pCorreo` VARCHAR(45), IN `pContrasena` VARCHAR(45))
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
pContrasena,
2);

END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarContrasena`(IN `pCorreo` VARCHAR(45), IN `pContrasena` VARCHAR(45))
BEGIN
update usuario set contrasena = pContrasena where correo = pCorreo;

END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE PROCEDURE `actualizarCategoría` (IN pID INT,`pNombre` VARCHAR(45), IN `pDescripcion` VARCHAR(200))
BEGIN
update categoria set nombre = pNombre, descripcion = pDescripcion where idCategoria = pID;
END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCategoría`(IN pID INT)
BEGIN
update categoria set condicion = 0 where idCategoria = pID;
END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `activarCategoría`(IN pID INT)
BEGIN
update categoria set condicion = 1 where idCategoria = pID;
END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarCategoría`(IN pID INT)
BEGIN
SELECT nombre, descripcion, condicion from categoria where idCategoria = pID;
END$$

DELIMITER ;

DELIMITER $$
USE `qastore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCategoriaDeProducto`(IN pIDProducto INT, IN pNewID INT)
BEGIN
update categoria_x_producto set Categoria_idCategoria = pNewID where Producto_idProducto = pIDProducto;
END$$

DELIMITER ;


--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `agregarProductoXCarrito` (`pProductoID` INT, `pCantidad` INT, `pCarritoID` INT) RETURNS INT(11) BEGIN
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
