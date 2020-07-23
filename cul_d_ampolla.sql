-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2020 a las 10:39:57
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_d'ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_Customers` int(11) NOT NULL,
  `nameCustomers` varchar(50) NOT NULL,
  `addressCustomers` varchar(100) NOT NULL,
  `telephoneCustomers` int(11) NOT NULL,
  `emailCustomers` char(30) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id_Customers`, `nameCustomers`, `addressCustomers`, `telephoneCustomers`, `emailCustomers`, `dateRegister`) VALUES
(1, 'Elvira Sanchez', 'La calle del mundo 1 08956 Madrid', 78946123, 'elvira@gmail.com', '2020-07-23 08:17:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_Employee` int(11) NOT NULL,
  `nameEmployee` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_Employee`, `nameEmployee`) VALUES
(1, 'Jordi Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_Glass` int(11) NOT NULL,
  `brandGlass` varchar(50) NOT NULL,
  `gradRightCrystal` double NOT NULL,
  `gradLeftCrystal` double NOT NULL,
  `mountType` varchar(50) NOT NULL,
  `colorMount` varchar(20) NOT NULL,
  `colorRightCrystal` varchar(20) NOT NULL,
  `colorLeftCrystal` varchar(20) NOT NULL,
  `priceGlass` double NOT NULL,
  `proveider_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_Glass`, `brandGlass`, `gradRightCrystal`, `gradLeftCrystal`, `mountType`, `colorMount`, `colorRightCrystal`, `colorLeftCrystal`, `priceGlass`, `proveider_Id`) VALUES
(2, 'Traiban', 0, 0, 'Sport', 'Black', 'Green', 'Green', 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveider`
--

CREATE TABLE `proveider` (
  `id_Proveider` int(11) NOT NULL,
  `nameProveider` varchar(50) NOT NULL,
  `ad_Street_Prov` varchar(50) NOT NULL,
  `ad_Number_Prov` int(11) NOT NULL,
  `ad_Flat_Prov` int(11) NOT NULL,
  `ad_Door_Prov` int(11) NOT NULL,
  `ad_City_Prov` varchar(30) NOT NULL,
  `ad_CodePost_Prov` int(11) NOT NULL,
  `ad_Country_Prov` varchar(30) NOT NULL,
  `phoneProveider` int(11) NOT NULL,
  `faxProveider` int(11) NOT NULL,
  `nifProveider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveider`
--

INSERT INTO `proveider` (`id_Proveider`, `nameProveider`, `ad_Street_Prov`, `ad_Number_Prov`, `ad_Flat_Prov`, `ad_Door_Prov`, `ad_City_Prov`, `ad_CodePost_Prov`, `ad_Country_Prov`, `phoneProveider`, `faxProveider`, `nifProveider`) VALUES
(1, 'Import Tolo', 'Calle Industria poligono tutu', 1, 0, 2, 'Barcelona', 8300, 'Barcelona', 456123789, 123456789, 45781245);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id_Sales` int(11) NOT NULL,
  `customer_Id` int(10) NOT NULL,
  `glasses_Id` int(10) NOT NULL,
  `employee_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id_Sales`, `customer_Id`, `glasses_Id`, `employee_Id`) VALUES
(1, 1, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_Customers`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_Employee`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_Glass`),
  ADD KEY `proveider_Id` (`proveider_Id`);

--
-- Indices de la tabla `proveider`
--
ALTER TABLE `proveider`
  ADD PRIMARY KEY (`id_Proveider`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_Sales`),
  ADD KEY `customer_Id` (`customer_Id`),
  ADD KEY `glasses_Id` (`glasses_Id`),
  ADD KEY `employee_Id` (`employee_Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_Customers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_Employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_Glass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveider`
--
ALTER TABLE `proveider`
  MODIFY `id_Proveider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id_Sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`proveider_Id`) REFERENCES `proveider` (`id_Proveider`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`glasses_Id`) REFERENCES `glasses` (`id_Glass`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employee_Id`) REFERENCES `employee` (`id_Employee`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`customer_Id`) REFERENCES `customers` (`id_Customers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
