-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 05:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astra_db`
--
CREATE DATABASE IF NOT EXISTS `astra_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `astra_db`;

-- --------------------------------------------------------

--
-- Table structure for table `access_control_tbl`
--

CREATE TABLE `access_control_tbl` (
  `control_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `control_name` varchar(50) NOT NULL,
  `control_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_tbl`
--

CREATE TABLE `delivery_tbl` (
  `delivery_id` int(11) NOT NULL,
  `pr_number` varchar(20) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `uom` varchar(20) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `delivery_receipt_num` varchar(50) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `delivery_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_tbl`
--

INSERT INTO `delivery_tbl` (`delivery_id`, `pr_number`, `item_name`, `quantity`, `uom`, `date_of_delivery`, `delivery_receipt_num`, `supplier`, `delivery_status`) VALUES
(16, 'PR_001', 'Hollowblocks', 500, 'box', '2024-04-17', '123', 'A', 'Received'),
(17, 'PR_002', 'Semento', 1000, 'bags', '2024-04-05', '123456', 'b', 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_tbl`
--

CREATE TABLE `inventory_tbl` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pr_number` varchar(20) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `unit_of_measurement` varchar(20) DEFAULT NULL,
  `unit_cost` decimal(6,2) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `highest_stock` int(11) NOT NULL,
  `stock_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_tbl`
--

INSERT INTO `inventory_tbl` (`item_id`, `user_id`, `pr_number`, `item_name`, `category`, `stock`, `unit_of_measurement`, `unit_cost`, `remarks`, `highest_stock`, `stock_level`) VALUES
(5, 0, 'PR_001', 'Hollowblocks', NULL, 500, 'box', 0.00, '', 500, ''),
(6, 0, 'PR_002', 'Semento', '', 1000, 'bags', 0.00, '', 1000, 'Maximum'),
(7, 0, 'PR_001', 'Hollowblocks', NULL, 1000, 'bags', 0.00, '', 1000, ''),
(8, 0, 'PR_002', 'Semento', NULL, 1000, 'bags', 0.00, '', 1000, '');

-- --------------------------------------------------------

--
-- Table structure for table `material_req_tbl`
--

CREATE TABLE `material_req_tbl` (
  `mat_req_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `request_slip_no` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_of_measurement` varchar(20) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `phase` varchar(10) DEFAULT NULL,
  `block` varchar(10) DEFAULT NULL,
  `lot` varchar(10) DEFAULT NULL,
  `requested_by` varchar(30) DEFAULT NULL,
  `date_requested` date DEFAULT NULL,
  `approved_by` varchar(30) DEFAULT NULL,
  `date_approved` date DEFAULT NULL,
  `intended_for` varchar(20) DEFAULT NULL,
  `mat_req_status` varchar(10) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_req_tbl`
--

INSERT INTO `material_req_tbl` (`mat_req_id`, `user_name`, `request_slip_no`, `item_id`, `item_name`, `quantity`, `unit_of_measurement`, `remarks`, `phase`, `block`, `lot`, `requested_by`, `date_requested`, `approved_by`, `date_approved`, `intended_for`, `mat_req_status`) VALUES
(17, NULL, 10001, 42, 'Hollowblocks', 100, 'pcs', 'Eto na ', '10', '11', '12', 'vin', '2024-03-19', 'bin', '2024-03-27', 'manors', 'Released'),
(18, NULL, 10002, 43, 'Cement', 6, 'kl', 'Eto na ', '10', '11', '12', 'vin', '2024-03-19', 'bin', '2024-03-27', 'manors', 'Released'),
(19, NULL, 10003, 43, 'Cement', 20, 'pcs', 'Remarks 4', '5', '10', '12', 'lvin', '2024-03-01', 'in', '2024-03-02', 'residences', 'Processing'),
(20, NULL, 10004, 42, 'Hollowblocks', 50, 'pcs', 'Remarks 4', '10', '20', '30', 'John', '2024-03-13', 'Doe', '2024-03-13', 'villas', 'Pending'),
(21, NULL, 10005, 42, 'Hollowblocks', 8, 'bags', '', '', '', '', '', '0000-00-00', '', '0000-00-00', '', 'Pending'),
(22, NULL, 10006, 42, 'Hollowblocks', 8, 'bags', 'Remarks 1', '1', '2', '3', 'Alvin', '2024-04-10', 'John', '2024-04-10', 'manors', 'Released'),
(23, NULL, 10010, 6, 'Semento', 500, 'bags', '', '1', '2', '3', 'alvin', '2024-04-17', 'john', '2024-04-17', 'manors', 'Released');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_req_tbl`
--

CREATE TABLE `purchase_req_tbl` (
  `pr_id` int(11) NOT NULL,
  `pr_number` varchar(20) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `qty_per_unit` int(11) DEFAULT NULL,
  `unit_of_measurement` varchar(20) DEFAULT NULL,
  `unit_per_batch` int(11) NOT NULL,
  `unit_cost` decimal(9,2) DEFAULT NULL,
  `total_qty` int(11) NOT NULL,
  `amount_per_unit` decimal(9,2) DEFAULT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `phase` varchar(10) NOT NULL,
  `block` varchar(10) NOT NULL,
  `lot` varchar(10) NOT NULL,
  `pr_status` varchar(10) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_req_tbl`
--

INSERT INTO `purchase_req_tbl` (`pr_id`, `pr_number`, `item_name`, `qty_per_unit`, `unit_of_measurement`, `unit_per_batch`, `unit_cost`, `total_qty`, `amount_per_unit`, `total_amount`, `remarks`, `phase`, `block`, `lot`, `pr_status`) VALUES
(1, 'PR_001', 'Hollowblocks', 50, 'box', 20, 50.00, 1000, 2500.00, 50000.00, '', '1', '2', '3', 'Approved'),
(2, 'PR_002', 'Semento', 50, 'bags', 20, 100.00, 1000, 5000.00, 100000.00, '', '1', '2', '3', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_tbl`
--

CREATE TABLE `user_access_tbl` (
  `username` varchar(50) NOT NULL,
  `purchase` varchar(50) NOT NULL,
  `delivery` varchar(50) NOT NULL,
  `inventory` varchar(50) NOT NULL,
  `withdrawal` varchar(50) NOT NULL,
  `user_access` varchar(50) NOT NULL,
  `user_management` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_access_tbl`
--

INSERT INTO `user_access_tbl` (`username`, `purchase`, `delivery`, `inventory`, `withdrawal`, `user_access`, `user_management`) VALUES
('alvin', 'View', 'None', 'View', 'None', 'View', 'None'),
('johndoe', 'View, Delete', 'None', 'None', 'View, Add, Edit, Delete', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `temp_password` varchar(255) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT NULL,
  `q1_answer` varchar(50) NOT NULL,
  `q2_answer` varchar(50) NOT NULL,
  `q3_answer` varchar(50) NOT NULL,
  `q4_answer` varchar(50) NOT NULL,
  `q5_answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`user_id`, `user_name`, `user_password`, `first_name`, `last_name`, `temp_password`, `user_status`, `q1_answer`, `q2_answer`, `q3_answer`, `q4_answer`, `q5_answer`) VALUES
(1, 'admin', '$2y$12$yJGMv1P8bDgHDG/Esi.mK.peB6RiL48lfzzu0MdE5E1B6udIlD8Aa', 'Janet', 'Cruz', NULL, 'Active', '', '', '', '', ''),
(2, 'alvin', '$2y$12$mPObOYIde9BJe8iS5E35y.UDUEGAHHNo7zFc9pfF2or.UnlZjdW1K', 'Alvin John', 'Aganan', 'hi', 'Active', '', '', '', '', ''),
(7, 'alvin5', '$2y$12$OigNU1xnEhA./XEd0viCNusCo9URHyM5sQAsjVpfiOPQlU6EN1w3y', 'Alvin5', 'John', 'alvin', 'Active', '', '', '', '', ''),
(8, 'bianca', '$2y$12$w8I1t6b6bP88i8ds.1QjPOwtc4mxnpXawpz12cUBxocF94erREpce', 'Bianca', 'De Villa', '123456', 'Active', '', '', '', '', ''),
(9, 'bianca2', '$2y$12$ppJdDYnhSV/LpGgyWbtTlu1Fsb2rsm6WwQL0aXT35ENot20Dq4NPO', 'Bianca', 'Ashly', 'ABC', 'Active', '', '', '', '', ''),
(10, 'johndoe', '$2y$12$zTLHCS2212RZA3fyP.a/Sejf723sq9MGMf4P9tVvoRGIETLEUljpS', 'John', 'Doe', 'doe', 'Active', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_control_tbl`
--
ALTER TABLE `access_control_tbl`
  ADD PRIMARY KEY (`control_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `delivery_tbl`
--
ALTER TABLE `delivery_tbl`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `inventory_tbl`
--
ALTER TABLE `inventory_tbl`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `material_req_tbl`
--
ALTER TABLE `material_req_tbl`
  ADD PRIMARY KEY (`mat_req_id`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `purchase_req_tbl`
--
ALTER TABLE `purchase_req_tbl`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `user_access_tbl`
--
ALTER TABLE `user_access_tbl`
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_control_tbl`
--
ALTER TABLE `access_control_tbl`
  MODIFY `control_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_tbl`
--
ALTER TABLE `delivery_tbl`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `inventory_tbl`
--
ALTER TABLE `inventory_tbl`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `material_req_tbl`
--
ALTER TABLE `material_req_tbl`
  MODIFY `mat_req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `purchase_req_tbl`
--
ALTER TABLE `purchase_req_tbl`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_control_tbl`
--
ALTER TABLE `access_control_tbl`
  ADD CONSTRAINT `fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user_tbl` (`user_name`);

--
-- Constraints for table `material_req_tbl`
--
ALTER TABLE `material_req_tbl`
  ADD CONSTRAINT `material_req_tbl_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user_tbl` (`user_name`);
--
-- Database: `navigatordb`
--
CREATE DATABASE IF NOT EXISTS `navigatordb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `navigatordb`;

-- --------------------------------------------------------

--
-- Table structure for table `emp_prof`
--

CREATE TABLE `emp_prof` (
  `fldID` int(20) NOT NULL,
  `fldEmployeeNum` int(50) NOT NULL,
  `fldName` varchar(100) NOT NULL,
  `fldSurname` varchar(100) NOT NULL,
  `fldFirstname` varchar(100) NOT NULL,
  `fldNick` varchar(50) NOT NULL,
  `fldUser` varchar(20) NOT NULL,
  `fldGroup` varchar(50) NOT NULL,
  `fldGroups` varchar(100) NOT NULL,
  `fldDesig` varchar(50) NOT NULL,
  `fldBirthDate` date DEFAULT NULL,
  `fldGender` varchar(1) NOT NULL DEFAULT 'M',
  `fldStatus` varchar(20) NOT NULL,
  `fldDateHired` date DEFAULT NULL,
  `fldLotus` varchar(50) NOT NULL,
  `fldPic` varchar(100) NOT NULL,
  `fldOthers` double(10,1) NOT NULL DEFAULT 0.0,
  `fldStartTime` varchar(100) NOT NULL,
  `fldMOT` varchar(100) NOT NULL,
  `fldRemarks` varchar(100) NOT NULL,
  `fldUnit` varchar(100) NOT NULL,
  `fldHouse` varchar(100) NOT NULL,
  `fldStreet` varchar(100) NOT NULL,
  `fldSub` varchar(100) NOT NULL,
  `fldBrgy` varchar(100) NOT NULL,
  `fldCity` varchar(100) NOT NULL,
  `fldProv` varchar(100) NOT NULL,
  `fldZip` int(4) DEFAULT NULL,
  `fldDesigStamp` varchar(100) NOT NULL,
  `fldGroupStamp` varchar(100) NOT NULL,
  `fldActiveStamp` varchar(100) NOT NULL,
  `fldStampDate` date DEFAULT NULL,
  `fldChecker` varchar(100) NOT NULL,
  `fldActive` int(1) NOT NULL DEFAULT 1,
  `fldResignDate` date DEFAULT NULL,
  `fldUpload` int(1) NOT NULL DEFAULT 0,
  `fldAccess` int(1) NOT NULL,
  `fldAccessCommute` int(1) NOT NULL,
  `fldMRRSReserve` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_prof`
--

INSERT INTO `emp_prof` (`fldID`, `fldEmployeeNum`, `fldName`, `fldSurname`, `fldFirstname`, `fldNick`, `fldUser`, `fldGroup`, `fldGroups`, `fldDesig`, `fldBirthDate`, `fldGender`, `fldStatus`, `fldDateHired`, `fldLotus`, `fldPic`, `fldOthers`, `fldStartTime`, `fldMOT`, `fldRemarks`, `fldUnit`, `fldHouse`, `fldStreet`, `fldSub`, `fldBrgy`, `fldCity`, `fldProv`, `fldZip`, `fldDesigStamp`, `fldGroupStamp`, `fldActiveStamp`, `fldStampDate`, `fldChecker`, `fldActive`, `fldResignDate`, `fldUpload`, `fldAccess`, `fldAccessCommute`, `fldMRRSReserve`) VALUES
(1, 7, 'LAUREANO_Antonio', 'Laureano', 'Antonio', 'Toni', 'toni1', 'ADM', '', 'CSAD', '1956-07-05', 'M', 'Married', '1989-05-11', 'laureano-kdt/P/KHI', 'pic_7.jpg', 0.0, '07:00', 'Rick', '06:00/16:00', '-', '13 ', 'P. GABRIEL', '-', 'San Jose (Pob.)', 'City of Navotas', 'NCR, Third District', 1409, 'CSAD', 'ADM', '0', '2022-04-19', 'Ernesto Veloso', 0, '2021-07-01', 1, 4, 1, 0),
(2, 8, 'PANADO_Evangeline', 'Panado', 'Evangeline', 'Van', 'van', 'ADM', 'ADM', 'DM', '1960-07-03', 'F', 'Married', '1990-06-11', 'panado-g1/P/KHI', 'pic_8.jpg', 0.0, '06:00', 'carpool', 'Evangeline Panado', '', '8248-B', 'Camachile Street', 'San Antonio', 'San Antonio', 'City of Makati', 'NCR, Fourth District', 1203, 'DM', 'ADM', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(3, 10, 'TAN_Erwin', 'Tan', 'Erwin', 'TAN', 'khi', 'MNG', 'ANA/ADM/CIV/EE/PIP/IT/SYS/MNG/ETCL', 'SM', '1965-12-20', 'M', 'Married', '1989-05-11', 'tan-g1/P/KHI', 'pic_10.jpg', 0.9, '07:00', 'ownCar', '', '104-A Rockford Bldg.', 'Lakeview Manors Cond.', 'Bagong Calzada', '', 'Ususan', 'City of Taguig', 'NCR, Fourth District', 1632, 'SM', 'ANA', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(4, 18, 'MATIBAG_Erwilson', 'Matibag', 'Erwilson', 'Wilson', 'wilson', 'MNG', 'ANA/IT/SYS/MNG', 'DM', '1972-10-16', 'M', 'Married', '1995-06-01', 'matibag-kdt/P/KHI', 'pic_18.jpg', 0.0, '06:00', 'carpool', 'Francis Martee Gulapa', '', 'Lot 14 Block 1', 'Mendiola', 'Vista Verde Executive Village', 'San Isidro', 'Cainta', 'Rizal', 1900, 'DM', 'ANA', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(5, 21, 'SANTOS_Roberto', 'Santos', 'Roberto', 'Bert', 'kuyabert', 'ADM', '', 'MJ', '1962-10-14', 'M', 'Married', '1996-09-01', '', 'pic_21.jpg', 0.0, '06:00', 'bicycle', '', '', '', 'Leon Guinto', '', 'Barangay 726', 'Malate, City of Manila', 'NCR, First District', 1004, 'MJ', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(6, 25, 'DERIGAY_Oliver', 'Derigay', 'Oliver', 'Oliver', 'OLIVER', 'CHE', 'CHE/CRY/CEM/MIL/ETCL/MPM/MNG', 'DM', '1971-10-21', 'M', 'Married', '1997-01-06', 'derigay-g1/P/KHI', 'pic_25.jpg', 3.5, '07:00', 'ownCar', '', '', '', '', '', 'Bayanan', 'City of Bacoor', 'Cavite', 4102, 'DM', 'CHE', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(7, 30, 'ABUAN_Christopher', 'Abuan', 'Christopher', 'Fher', 'fher', 'MHAH', 'MHAH/MNG', 'DM', '1975-12-06', 'M', 'Married', '1997-01-09', 'abuan-kdt/P/KHI', 'pic_30.jpg', 0.0, '07:00', 'carpool', 'Christopher Abuan', '158-C', 'Magtanggol St.', '158-C Magtanggol St. Bgy. 29 Maypajo, Caloocan City', 'Maypajo', 'Barangay 29', 'City of Caloocan', 'NCR, Third District', 1410, 'DM', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 1, 3, 0, 0),
(8, 34, 'CORPUZ_Antonio', 'Corpuz', 'Antonio', 'Tony', 'bosstony', 'ADM', '', 'DR2', '1965-12-14', 'M', 'Married', '1997-02-01', '', 'pic_34.jpg', 0.0, '06:00', 'ownCar', '', '', '8248', 'Camachile', '', 'San Antonio', 'City of Makati', 'NCR, Fourth District', 1203, 'DR2', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(9, 37, 'LLANES_Ferdinand', 'Llanes', 'Ferdinand', 'Ferdie', 'llanes', 'BOI', 'BOI/INT/MNG', 'DM', '1969-10-31', 'M', 'Married', '1997-08-15', 'llanes-kdt/P/KHI', 'pic_37.jpg', 2.0, '06:00', 'carpool', 'Al Shariff Gallardo', '', 'Blk 8 lot 27', '', 'Veracruz', 'Malitlit', 'City of Santa Rosa', 'Laguna', 2406, 'DM', 'BOI', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(10, 40, 'CABELLO_Aristeo', 'Cabello', 'Aristeo', 'Aris', 'aris', 'ENV', 'ENV/MNG', 'DM', '1976-01-24', 'M', 'Married', '1997-10-16', 'cabello-kdt/P/KHI', 'pic_40.jpg', 1.0, '06:00', 'ownCar', '', '', 'Lot 34', '18 Ohio Street', 'Camella Homes', 'Salinas IV', 'City of Bacoor', 'Cavite', 4102, 'AM', 'ENV', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(11, 43, 'AMPIG_Rommel', 'Ampig', 'Rommel', 'Rommel', 'rommel1', 'MIL', 'MIL/CEM/MPM/ETCL', 'DM', '1972-01-15', 'M', 'Married', '1998-01-15', 'ampig-kdt/P/KHI', 'pic_43.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DM', 'MIL', '0', '2022-04-19', 'Ernesto Veloso', 0, '2022-04-01', 1, 3, 0, 0),
(12, 55, 'PEREZ_April', 'Perez', 'April', 'April', 'april', 'ACT', '', 'SA', '1976-04-09', 'F', 'Single', '1998-03-23', 'perez-kdt/P/KHI', 'pic_55.jpg', 0.0, '06:00', 'carpool', 'Lorenzo Diaz', 'Missouri ', '418', 'Dr Sixto Avenue', 'Riverfront Residences', 'Caniogan', 'City of Pasig', 'NCR, Second District', 1606, 'SA', 'ACT', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(13, 61, 'BALISBIS JR._Cezar', 'Balisbis Jr.', 'Cezar', 'Czar', 'czar', 'ANA', 'ANA/SYS/IT', 'AM', '1974-09-18', 'M', 'Married', '1998-04-16', 'balisbis-kdt/P/KHI', 'pic_61.jpg', 0.0, '06:30', 'publicTransportation', '', 'Unit 4A', '#4', 'Haig Street', '_', 'Daang Bakal', 'City of Mandaluyong', 'NCR, Second District', 0, 'AM', 'ANA', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(14, 101, 'SORIANO_Sharon Ann', 'Soriano', 'Sharon Ann', 'Ann', 'soriano-kdt', 'ADM', '', 'ASS', '1976-12-12', 'F', 'Married', '2007-03-03', 'soriano-kdt/P/KHI', 'pic_101.jpg', 0.0, '06:00', 'Arnold', '05:10/15:08', '', 'B2 L11', 'Kiwi St.,', 'Greenlane Villas ', 'Bayanan', 'City of Bacoor', 'Cavite', 4102, 'ASS', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(15, 104, 'VELOSO_Ernesto', 'Veloso', 'Ernesto', 'Lou', 'LOU', 'MNG', 'MNG/ENV/BOI', 'SM', '1967-03-24', 'M', 'Married', '2000-07-03', 'veloso-kdt/P/KHI', 'pic_104.jpg', 9.0, '06:30', 'ownCar', '', '', '#15', 'Road 10-B', 'UPS V', 'San Isidro', 'City of Parañaque', 'NCR, Fourth District', 1713, 'SM', 'MNG', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(16, 107, 'DIAZ_Lorenzo', 'Diaz', 'Lorenzo', 'Lorenz', 'etuc', 'CEM', 'CEM/ETCL/MPM/MIL', 'AM', '1974-11-06', 'M', 'Married', '2000-10-16', 'diaz-kdt/P/KHI', 'pic_107.jpg', 2.0, '06:00', 'carpool', 'Lorenzo Diaz', '214 Riverfront Res.', '', 'Dr. Sixto Avenue', '', 'Caniogan', 'City of Pasig', 'NCR, Second District', 1606, 'AM', 'CEM', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(17, 117, 'VITALICIO_Mae Anne', 'Vitalicio', 'Mae Anne', 'Mae', 'vitalicio-kdt', 'ENV', 'ENV', 'AM', '1976-11-28', 'F', 'Single', '2002-07-01', 'vitalicio-kdt/P/KHI', 'pic_117.jpg', 2.5, '06:00', 'carpool', 'Lorenzo Diaz', '', '47B', '', 'Countryside', 'Barangka Ibaba', 'City of Mandaluyong', 'NCR, Second District', 1550, 'AM', 'ENV', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(18, 121, 'DERIGAY_Arlene', 'Derigay', 'Arlene', 'Arlene', 'arlene', 'ADM', '', 'AAR', '1977-11-20', 'F', 'Married', '2002-01-02', 'magno-kdt/P/KHI', 'pic_121.jpg', 0.0, '07:00', 'ownCar', '', '', '', '', '', 'Bayanan', 'City of Bacoor', 'Cavite', 4102, 'AAR', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(19, 122, 'FABIA_Roderick', 'Fabia', 'Roderick', 'Rick', 'kuyarick', 'ADM', '', 'DR', '1970-03-08', 'M', 'Married', '2004-08-18', '', 'pic_122.jpg', 0.0, '06:00', 'bicycle', '', '', 'Blk 9, Lot 1', '', 'GPL3', 'Anabu II-B', 'City of Imus', 'Cavite', 4103, 'DR', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(20, 134, 'BECINA_Artemio Roel', 'Becina', 'Artemio Roel', 'Brix', 'brix', 'PIP', 'EE/CIV/PIP/DXT/MNG', 'DM', '1978-04-10', 'M', 'Married', '2002-09-02', 'becina-kdt/P/KHI', 'pic_134.jpg', 1.5, '06:30', 'ownCar', '', '', '385', 'tatang exequiel compound', '', 'talon uno', 'City of Las Piñas', 'NCR, Fourth District', 1707, 'AM', 'EE', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(21, 145, 'BARADAS_Ryan', 'Baradas', 'Ryan', 'Ryan', 'ryan', 'CRY', '', 'SSV', '1981-03-25', 'M', 'Married', '2005-04-18', 'baradas-kdt/P/KHI', 'pic_145.jpg', 1.5, '07:00', 'ownCar', '', 'E.T. Homes 1', 'A-13', 'Naga Road', '', 'Pulang Lupa Dos', 'City of Las Piñas', 'NCR, Fourth District', 1740, 'SSV', 'CRY', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(22, 158, 'VALDEZ_Ramir', 'Valdez', 'Ramir', 'Ramir', 'ramir', 'EE', 'EE/MNG', 'DM', '1965-11-25', 'M', 'Married', '2006-04-03', 'valdez-kdt/P/KHI', 'pic_158.jpg', 14.1, '06:00', 'ownCar', '', '', 'Block 1 Lot 12', '', 'Amaia Scapes General Trias', 'Santiago', 'City of General Trias', 'Cavite', 4107, 'DM', 'EE', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(23, 172, 'VIRAY_Jermaine', 'Viray', 'Jermaine', 'Maine', 'maine', 'MHAH', '', 'SSV', '1982-09-20', 'F', 'Married', '2006-05-15', 'marasigan-kdt/P/KHI', 'pic_172.jpg', 0.5, '06:00', 'carpool', 'Aristeo Cabello', 'N/A', 'Blk 19 Lot 4', 'Iligan Street', 'Southern City ', 'Tanzang Luma IV', 'City of Imus', 'Cavite', 4103, 'SSV', 'MHAH', '1', '2022-03-31', '', 0, '2022-12-31', 0, 0, 0, 0),
(24, 173, 'AGUILAR_John Isaac', 'Aguilar', 'John Isaac', 'Ice', 'ice', 'EE', '', 'SSV', '1983-12-24', 'M', 'Married', '2006-05-22', 'aguilar-kdt/P/KHI', 'pic_173.jpg', 0.3, '06:00', 'ownCar', '', '', 'L5, B4', 'Essen St.', 'Mercedes Exec. Vill.', 'San Miguel', 'City of Pasig', 'NCR, Second District', 1600, 'SSV', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(25, 174, 'APOSTOL_Roel Boy', 'Apostol', 'Roel Boy', 'Putol', 'roel', 'EE', '', 'SSV', '1983-06-20', 'M', 'Married', '2006-08-22', 'apostol-kdt/P/KHI', 'pic_174.jpg', 0.0, '06:10', 'carpool', 'Roel Boy Apostol', '', '', '', '', 'San Joaquin', 'City of Pasig', 'NCR, Second District', 1601, 'SSV', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(26, 185, 'DE JESUS_Ryan', 'De Jesus', 'Ryan', 'Ryan', 'ryanm', 'PIP', '', 'SSV', '1982-08-25', 'M', 'Married', '2006-11-16', 'dejesus-kdt/P/KHI', 'pic_185.jpg', 0.0, '06:00', 'carpool', 'Evangeline Panado', '', '8259', 'Camachile Street', 'San Antonio Village', 'San Antonio', 'City of Makati', 'NCR, Fourth District', 1203, 'SSV', 'PIP', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(27, 194, 'CASTUERA_Maxwell', 'Castuera', 'Maxwell', 'Max', 'max', 'MHAH', '', 'SSV', '1980-03-07', 'M', 'Single', '2007-01-02', 'castuera-kdt/P/KHI', 'pic_194.jpg', 0.0, '07:00', 'ownCar', '', '', '4002', 'Gen. Malvar', '', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'SSV', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(28, 209, 'LEAL JR._Ernesto', 'Leal Jr.', 'Ernesto', 'Leal', 'ernesto', 'CEM', 'CEM/ETCL/MPM', 'SSV', '1982-09-28', 'M', 'Married', '2007-03-01', 'leal-kdt/P/KHI', 'pic_209.jpg', 0.5, '07:30', 'motorCycle', '', '', 'Lot5 Blk.1', '', 'Westwood 4', 'Pasong Camachile II', 'City of General Trias', 'Cavite', 4107, 'SSV', 'CEM', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(29, 212, 'LAZARO_Edmon', 'Lazaro', 'Edmon', 'Mon', 'edmon', 'SYS', 'SYS', 'SSS', '1984-10-20', 'M', 'Married', '2007-03-21', 'lazaro-kdt/P/KHI', 'pic_212.jpg', 0.0, '06:15', 'motorCycle', '', '50', '50', 'Virginia Street', ',Manotoc Subdivision', 'Santo Niño', 'City of Marikina', 'NCR, Second District', 1800, 'SSS', 'SYS', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 1),
(30, 215, 'PALMONES_Michael', 'Palmones', 'Michael', 'Mike', 'michaelp', 'CEM', '', 'SSV', '1979-12-12', 'M', 'Single', '2007-03-21', 'palmones-kdt/P/KHI', 'pic_215.jpg', 4.0, '07:00', 'carpool', 'Joseph Michael Macalalad', '', 'B12 L10', 'Lontoc', 'PVHAI', 'Calzada', 'City of Taguig', 'NCR, Fourth District', 1635, 'SSV', 'CEM', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(31, 221, 'CAMATO JR._Gerardo', 'Camato Jr.', 'Gerardo', 'Gerald', 'gerard', 'ENV', '', 'SSV', '1984-10-14', 'M', 'Married', '2007-05-16', 'camato-kdt/P/KHI', 'pic_221.jpg', 0.0, '08:00', 'publicTransportation', '', '', '15Th', 'Cristo rey', 'SAV3', 'San Antonio', 'City of Parañaque', 'NCR, Fourth District', 1715, 'SSV', 'ENV', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(32, 222, 'BELTRAN_Jeffrey', 'Beltran', 'Jeffrey', 'Jeff', 'jeffrey', 'MIL', '', 'SSV', '1983-12-30', 'M', 'Single', '2007-05-16', 'beltran-kdt/P/KHI', 'pic_222.jpg', 0.0, '07:00', 'ownCar', '', '', '1', 'Palo Maria', '', 'Western Bicutan', 'City of Taguig', 'NCR, Fourth District', 1630, 'SSV', 'MIL', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(33, 223, 'PAHEL_Jobert', 'Pahel', 'Jobert', 'Jobs', 'jobert', 'MIL', '', 'SSV', '1982-08-21', 'M', 'Married', '2007-05-16', 'pahel-kdt/P/KHI', 'pic_223.jpg', 0.0, '07:00', 'publicTransportation', '', '', '142 BLK2', 'LANDSCAPE AREA', 'UPS4', 'Marcelo Green Village', 'City of Parañaque', 'NCR, Fourth District', 1700, 'SSV', 'MIL', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(34, 224, 'DESOLOC_Blessel', 'Desoloc', 'Blessel', 'Bles', 'bles', 'ENV', '', 'SSV', '1985-03-29', 'F', 'Single', '2007-05-16', 'desoloc-kdt/P/KHI', 'pic_224.jpg', 0.0, '08:00', 'publicTransportation', '', '-', 'Block 22 Lot 24', '', 'Green Estate 2', 'Malagasang 1-F', 'City of Cavite', 'Cavite', 4103, 'SSV', 'ENV', '1', '2022-03-31', '', 1, NULL, 1, 0, 0, 0),
(35, 226, 'GULAPA_Francis Martee', 'Gulapa', 'Francis Martee', 'Martee', 'martee', 'EE', '', 'SSV', '1985-01-23', 'M', 'Married', '2007-05-16', 'gulapa-kdt/P/KHI', 'pic_226.jpg', 0.0, '06:00', 'carpool', 'Francis Martee Gulapa', '', '17A', 'Peugeot Street', 'Village East Executive Homes ', 'Santo Domingo', 'Cainta', 'Rizal', 1900, 'SSV', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(36, 230, 'OLIVEROS_Mark Anthony', 'Oliveros', 'Mark Anthony', 'Mark', 'mark', 'MHAH', '', 'SV', '1983-04-16', 'M', 'Married', '2007-06-25', 'oliveros-kdt/P/KHI', 'pic_230.jpg', 0.5, '07:00', 'ownCar', '', '', 'Blk 4, Lot 8', 'Peach', 'Park Infina', 'Alapan II-A', 'City of Imus', 'Cavite', 4103, 'SV', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(37, 238, 'SESE_Joseph Ferdinand', 'Sese', 'Joseph Ferdinand', 'Joseph', 'sese', 'ENV', '', 'SV', '1973-09-11', 'M', 'Married', '2007-08-16', 'sese-kdt/P/KHI', 'pic_238.jpg', 8.0, '08:00', 'motorCycle', '', '', '', '', '', 'Cupang', 'Arayat', 'Pampanga', 2012, 'SV', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(38, 240, 'MIRANDA_Christian Jay', 'Miranda', 'Christian Jay', 'Chris', 'christian', 'CEM', '', 'SV', '1983-08-25', 'M', 'Married', '2007-08-16', 'miranda-kdt/P/KHI', 'pic_240.jpg', 0.0, '07:00', 'motorCycle', '', 'LANCASTER NEW CITY', 'BLOCK 9 LOT 10', 'KIPLING ST.', 'BRIGHTON 6', 'Santa Clara', 'City of General Trias', 'Cavite', 4107, 'SV', 'CEM', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(39, 243, 'RAMOS_Sheena', 'Ramos', 'Sheena', 'Shin', 'sheena', 'ACT', '', 'SAA', '1985-09-03', 'F', 'Married', '2007-12-03', 'serdina-kdt/P/KHI', 'pic_243.jpg', 0.0, '06:00', 'Arnold', '04:20/15:00', '', 'Blk 1A Lot 11', 'Lessandra', 'Camella', 'Bagtas', 'Tanza', 'Cavite', 4108, 'SAA', 'ACT', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(40, 252, 'ARANETA_Rex', 'Araneta', 'Rex', 'Rex', 'araneta-kdt', 'CIV', '', 'SSV', '1983-05-16', 'M', 'Married', '2008-05-19', 'araneta-kdt/P/KHI', 'pic_252.jpg', 0.5, '06:30', 'carpool', 'Al Shariff Gallardo', '', 'Blk 14 Lot 22', 'Chico', 'South Fairway Homes', 'Landayan', 'City of San Pedro', 'Laguna', 4023, 'SSV', 'CIV', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(41, 256, 'SAHAGUN_Michelle', 'Sahagun', 'Michelle', 'Cheng', 'cheng', 'CEM', 'INT/CEM', 'SV', '1982-05-20', 'F', 'Married', '2010-03-01', 'canalda-kdt/P/KHI', 'pic_256.jpg', 2.0, '06:00', 'carpool', 'Roel Boy Apostol', '', '34-C', 'BANAAG ST', '', 'Pineda', 'City of Pasig', 'NCR, Second District', 1603, 'SV', 'CEM', '1', '2022-03-31', '', 0, '2022-12-31', 0, 0, 0, 0),
(42, 257, 'ONOD_Abeel', 'Onod', 'Abeel', 'Abel', 'abel', 'MIL', '', 'SV', '1986-07-07', 'M', 'Married', '2010-03-01', 'onod-kdt/P/KHI', 'pic_257.jpg', 0.0, '06:00', 'ownCar', '', '', '107-D', '7th Avenue', '', 'East Rembo', 'City of Makati', 'NCR, Fourth District', 1216, 'SV', 'MIL', '1', '2022-03-31', '', 0, '2023-03-15', 0, 0, 0, 0),
(43, 259, 'LUCENA_Rey', 'Lucena', 'Rey', 'Rey', 'rey', 'CEM', '', 'SV', '1987-05-04', 'M', 'Married', '2010-03-01', 'lucena-kdt/P/KHI', 'pic_259.jpg', 0.0, '07:00', 'ownCar', '', '', '478B', 'Miguelin St', '', 'Barangay 455', 'Sampaloc, City of Manila', 'NCR, First District', 1008, 'SV', 'CEM', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(44, 260, 'VERANO_Ronald', 'Verano', 'Ronald', 'RV', 'rv', 'ETCL', '', 'SV', '1984-07-11', 'M', 'Married', '2010-03-01', 'verano-kdt/P/KHI', 'pic_260.jpg', 1.5, '07:00', 'bicycle', '', '310-A', '', 'eusebio', '', 'Barangay 42', 'Pasay City', 'NCR, Fourth District', 1306, 'SV', 'ETCL', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(45, 261, 'VILLAMOR_Amor', 'Villamor', 'Amor', 'Amor', 'amor', 'CHE', '', 'SV', '1984-09-15', 'M', 'Married', '2010-03-01', 'villamor-kdt/P/KHI', 'pic_261.jpg', 0.1, '06:00', 'publicTransportation', '', 'C3-1H', 'California Garden Square', 'Libertad Street', '', 'Highway Hills', 'City of Mandaluyong', 'NCR, Second District', 1550, 'SV', 'CHE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(46, 262, 'CANTARA_Mark Joel', 'Cantara', 'Mark Joel', 'Joel', 'cantara', 'MHAH', '', 'SV', '1984-01-20', 'M', 'Single', '2010-03-01', 'cantara-kdt/P/KHI', 'pic_262.jpg', 0.0, '06:00', 'publicTransportation', '', '', '65', 'Premium', 'GSIS Village, Project 8', 'Sangandaan', 'Quezon City', 'NCR, Second District', 1106, 'SV', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(47, 263, 'PASCUA_Henry', 'Pascua', 'Henry', 'Henry', 'henry', 'MHAH', '', 'SV', '1984-06-19', 'M', 'Married', '2010-03-01', 'pascua-kdt/P/KHI', 'pic_263.jpg', 0.5, '07:00', 'motorCycle', '', '', 'B8 L6', 'Williamburg', 'Chesapeake Village', 'Buhay na Tubig', 'City of Imus', 'Cavite', 4103, 'SV', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(48, 264, 'CULAR_Giulian Louis', 'Cular', 'Giulian Louis', 'Louis', 'louis', 'CRY', '', 'SDE', '1986-06-21', 'M', 'Single', '2010-03-01', 'cular-kdt/P/KHI', 'pic_264.jpg', 2.2, '06:30', 'carpool', 'Al Shariff Gallardo', '', 'B-41 L-5', 'Bentley Avenue', 'South Spring', 'Canlalay', 'City of Biñan', 'Laguna', 4024, 'SDE', 'CRY', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(49, 265, 'ONOD_Amalia', 'Onod', 'Amalia', 'Amie', 'amie', 'ENV', '', 'SDE', '1989-07-05', 'F', 'Married', '2010-03-01', 'nodalo-kdt/P/KHI', 'pic_265.jpg', 0.0, '06:00', 'ownCar', '', '', '107-D', '7th Avenue', '', 'East Rembo', 'City of Makati', 'NCR, Fourth District', 1216, 'SDE', 'ENV', '1', '2022-03-31', '', 0, '2023-03-15', 0, 0, 0, 0),
(50, 268, 'SANDOVAL_Dan Christian', 'Sandoval', 'Dan Christian', 'Dan', 'sandoval', 'PIP', 'PIP/DXT', 'SV', '1985-10-06', 'M', 'Single', '2010-06-01', 'sandoval-kdt/P/KHI', 'pic_268.jpg', 0.0, '06:00', 'publicTransportation', '', '', 'SM LIGHT RESIDENCES', 'MADISON', '', 'Barangka Ilaya', 'City of Mandaluyong', 'NCR, Second District', 1550, 'SV', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(51, 270, 'CARINGAL_Gian Carlo', 'Caringal', 'Gian Carlo', 'Carlo', 'carlo', 'PIP', '', 'SV', '1985-12-15', 'M', 'Married', '2010-06-01', 'caringal-kdt/P/KHI', 'pic_270.jpg', 2.3, '06:00', 'ownCar', '', '', '21', 'Castello Street', 'Casa Milan Neopolitan', 'Greater Lagro', 'Quezon City', 'NCR, Second District', 1100, 'SV', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(52, 272, 'CAVEIRO_Vincent', 'Caveiro', 'Vincent', 'Vince', 'vince_resigned', 'PIP', '', 'SV', '1986-01-02', 'M', 'Married', '2010-06-01', 'caveiro-resigned/P/KHI', 'pic_272.jpg', 0.0, '08:00', 'publicTransportation', '', 'D&D Place', '38', 'Clemente Jose', 'Malibay', 'Barangay 159', 'Pasay City', 'NCR, Fourth District', 1300, 'SV', 'PIP', '1', '2022-03-31', '', 0, '2023-03-31', 0, 0, 0, 0),
(53, 279, 'PANOPIO_Luisito', 'Panopio', 'Luisito', 'Louie', 'lpanopio', 'MHAH', '', 'SV', '1984-02-27', 'M', 'Single', '2010-06-16', 'panopio-kdt/P/KHI', 'pic_279.jpg', 2.5, '06:00', 'publicTransportation', '', '', '5', 'Baluarte Street', 'Camella Homes 4', 'Poblacion', 'City of Muntinlupa', 'NCR, Fourth District', 1776, 'SV', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(54, 281, 'CURA_Leonard Ryan', 'Cura', 'Leonard Ryan', 'Ryan', 'cura', 'CHE', '', 'SV', '1986-12-08', 'M', 'Married', '2010-06-16', 'cura-kdt/P/KHI', 'pic_281.jpg', 0.2, '06:30', 'publicTransportation', '', '', 'BLK 2 Lot 14', 'Sampaguita St.', 'The Grove', 'Gatbuca', 'Calumpit', 'Bulacan', 3003, 'SV', 'CHE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(55, 283, 'CENIZAL_Ma. Evangeline', 'Cenizal', 'Ma. Evangeline', 'Vangie', 'adami', 'EE', '', 'SV', '1986-10-22', 'F', 'Married', '2010-06-16', 'adami-kdt/P/KHI', 'pic_283.jpg', 0.0, '06:00', 'Arnold', '04:45/15:00', '', 'BLK 6 - LOT 12', 'ROGER FEDERER', 'SOUTH DASMA GARDEN VILLAS', 'Salawag', 'City of Dasmariñas', 'Cavite', 4114, 'SV', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(56, 284, 'CIDRO_James Eric', 'Cidro', 'James Eric', 'Jim', 'james', 'EE', 'EE/DXT', 'SV', '1987-10-18', 'M', 'Married', '2010-06-16', 'cidro-kdt/P/KHI', 'pic_284.jpg', 0.0, '06:00', 'publicTransportation', '', '9E', '-', '5th Avenue', '-', 'Socorro', 'Quezon City', 'NCR, Second District', 1109, 'SV', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(57, 288, 'GODOY_JHON RAY', 'Godoy', 'Jhon Ray', 'Jhon', 'jhon', 'EE', '', 'SV', '1989-01-10', 'M', 'Married', '2011-01-03', 'godoy-kdt/P/KHI', 'pic_288.jpg', 0.0, '07:00', 'publicTransportation', '', '', '#30', 'Calle Cabasaan', '', 'South Signal Village', 'City of Taguig', 'NCR, Fourth District', 1632, 'SV', 'EE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(58, 290, 'ARIAP_JOMANIL', 'Ariap', 'Jomanil', 'Joma', 'joma', 'CRY', '', 'SDE', '1988-06-27', 'M', 'Single', '2011-01-03', 'ariap-kdt/P/KHI', 'pic_290.jpg', 0.0, '07:00', 'bicycle', '', '', 'Unit 310-A', 'Eusebio St.', 'Tramo', 'Barangay 42', 'Pasay City', 'NCR, Fourth District', 1300, 'SDE', 'CRY', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(59, 291, 'LLOSALA_ROWEL', 'Llosala', 'Rowel', 'Wel', 'rowel', 'CHE', '', 'SV', '1988-02-26', 'M', 'Married', '2011-01-03', 'llosala-kdt/P/KHI', 'pic_291.jpg', 0.0, '06:00', 'carpool', 'Henry Pascua', 'Legian 2 Phase B', 'Block 3 Lot 26', '4th street', 'Legian 2', 'Carsadang Bago I', 'City of Imus', 'Cavite', 4103, 'SV', 'CHE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(60, 293, 'DIMAAPI_JASPER', 'Dimaapi', 'Jasper', 'Jasper', 'jasper', 'ETCL', '', 'SV', '1989-05-16', 'M', 'Single', '2011-01-03', 'dimaapi-kdt/P/KHI', 'pic_293.jpg', 0.0, '06:00', 'carpool', 'Jasper Dimaapi', '520L Charleston Bldg.', '', 'C. Raymundo St', 'Hampton Gardens', 'Maybunga', 'City of Pasig', 'NCR, Second District', 1607, 'SV', 'ETCL', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(61, 295, 'MORENO_Rex', 'Moreno', 'Rex', 'Rex', 'moreno', 'MHAH', 'MHAH', 'AM', '1981-03-27', 'M', 'Single', '2011-05-02', 'moreno-kdt/P/KHI', 'pic_295.jpg', 7.0, '07:30', 'publicTransportation', '', 'N/A', '2697', 'General Cailles', 'N/A', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'AM', 'MHAH', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(62, 296, 'MACALALAD_Joseph Michael', 'Macalalad', 'Joseph Michael', 'Joseph', 'macalalad', 'ENV', 'ENV', 'AM', '1981-02-16', 'M', 'Married', '2011-05-02', 'macalalad-kdt/P/KHI', 'pic_296.jpg', 7.4, '07:15', 'carpool', 'Joseph Michael Macalalad', '304 Spruce bldg. Maple Place', '', 'Molave lane', 'Acacia Estates', 'Ususan', 'City of Taguig', 'NCR, Fourth District', 1632, 'AM', 'ENV', '1', '2022-03-31', '', 1, NULL, 1, 3, 0, 0),
(63, 299, 'CANO_Bryan Jay', 'Cano', 'Bryan Jay', 'Bryan', 'cano-kdt', 'BOI', 'BOI/INT', 'SV', '1988-08-12', 'M', 'Single', '2011-08-01', 'cano-kdt/P/KHI', 'pic_299.jpg', 0.7, '06:00', 'motorCycle', '', 'Tower 3 14E', 'San Lorenzo Place Condominium', 'EDSA cor Don Chino Roces Ave', '', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'SV', 'BOI', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(64, 301, 'LINA_Dominador Joshua', 'Lina', 'Dominador Joshua', 'Josh', 'lina-kdt', 'BOI', 'BOI/INT', 'SDE', '1989-07-03', 'M', 'Single', '2011-08-01', 'lina-kdt/P/KHI', 'pic_301.jpg', 0.5, '08:30', 'ownCar', '', '', '105', 'Alligator St Commando Rd', '', 'Rizal', 'City of Makati', 'NCR, Fourth District', 1208, 'SDE', 'BOI', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(65, 302, 'SAMPAGA_LOUIE', 'Sampaga', 'Louie', 'Louie', 'sampaga', 'EE', 'EE/DXT', 'SDE', '1987-12-02', 'M', 'Married', '2012-01-16', 'sampaga-kdt/P/KHI', 'pic_302.jpg', 0.0, '07:00', 'publicTransportation', '', '', 'Block 6 Lot 25A', 'Amethys', 'Jewel Homes', 'Buenavista III', 'City of General Trias', 'Cavite', 4107, 'SDE', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(66, 304, 'MUNDO_DAISY', 'Mundo', 'Daisy', 'Daisy', 'daisy', 'ENV', 'ENV/CHE', 'DE3', '1979-01-18', 'F', 'Single', '2012-01-16', 'mundo-kdt/P/KHI', 'pic_304.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'ENV', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(67, 305, 'ESCUETA_RODERICK', 'Escueta', 'Roderick', 'Eric', 'roderick', 'PIP', '', 'SDE', '1981-02-09', 'M', 'Married', '2012-01-16', 'escueta-kdt/P/KHI', 'pic_305.jpg', 0.0, '06:15', 'carpool', 'Jomari Sanao', '', 'Blk 5 lot 61', '', 'Vista Rosa', 'Soro-soro', 'City of Biñan', 'Laguna', 4024, 'SDE', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(68, 306, 'BELEN_KERVIN', 'Belen', 'Kervin', 'Kervin', 'kervin', 'PIP', 'PIP/DXT', 'SDE', '1988-07-23', 'M', 'Married', '2012-01-16', 'belen-kdt/P/KHI', 'pic_306.jpg', 0.0, '06:20', 'motorCycle', '', '', '5 / Blk 41', 'chrysanthenum', '', 'Addition Hills', 'City of Mandaluyong', 'NCR, Second District', 1550, 'SDE', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(69, 307, 'BALLON_Veronica', 'Ballon', 'Veronica', 'Vec', 'mendoza-kdt', 'IT', '', 'IT-SV', '1989-12-10', 'F', 'Married', '2012-05-07', 'mendoza-kdt/P/KHI', 'pic_307.jpg', 0.0, '06:30', 'ownCar', '', '', 'B10, L117', 'Sandpiper St.', 'Westwood 1, Lancaster', 'Pasong Camachile II', 'City of General Trias', 'Cavite', 4107, 'IT-SV', 'IT', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 1),
(70, 310, 'TUMAOB_FERDINAND', 'Tumaob', 'Ferdinand', 'Tommy', 'tommy', 'MIL', '', 'SDE', '1984-12-18', 'M', 'Married', '2012-05-16', 'tumaob-kdt/P/KHI', 'pic_310.jpg', 4.0, '06:30', 'motorCycle', '', '', '', '', 'Gumamela 2 Phase 4', 'Cupang', 'City of Antipolo', 'Rizal', 1870, 'SDE', 'MIL', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(71, 311, 'PENETRANTE JR._JORGE', 'Penetrante Jr.', 'Jorge', 'JR', 'jorge', 'BOI', '', 'SV', '1986-10-28', 'M', 'Single', '2012-05-16', 'penetrante-kdt/P/KHI', 'pic_311.jpg', 2.0, '08:00', 'publicTransportation', '', '28Q Pioneer Woodlands Tower 5', '', 'Pioneer St., cor. EDSA', '', 'Barangka Ilaya', 'City of Mandaluyong', 'NCR, Second District', 1550, 'SV', 'BOI', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(72, 312, 'LUCAS_ADELBERT', 'Lucas', 'Adelbert', 'Adel', 'adel', 'BOI', '', 'SDE', '1988-08-18', 'M', 'Single', '2012-05-16', 'lucas-kdt/P/KHI', 'pic_312.jpg', 0.0, '08:00', 'publicTransportation', '', '', '934', 'Remedios', '', 'Barangay 691', 'Malate, City of Manila', 'NCR, First District', 1004, 'SDE', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(73, 313, 'AGUSTINES_ALBERT', 'Agustines', 'Albert', 'Albert', 'albert', 'EE', 'EE/DXT', 'SDE', '1987-07-24', 'M', 'Single', '2012-05-16', 'agustines-kdt/P/KHI', 'pic_313.jpg', 0.0, '07:00', 'publicTransportation', '', '', '7', 'erlnda drv.', 'vermont  royale', 'Mayamot', 'City of Antipolo', 'Rizal', 1870, 'SDE', 'EE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(74, 314, 'SANGALANG_DICKENSON', 'Sangalang', 'Dickenson', 'Dick', 'dickenson', 'EE', '', 'SDE', '1983-11-17', 'M', 'Married', '2012-05-16', 'sangalang_d-kdt/P/KHI', 'pic_314.jpg', 6.7, '06:20', 'ownCar', '', '', 'PH4 B4 L13', 'SANGGIL', 'SPRINGVILLE HEIGHTS', 'Molino VII', 'City of Bacoor', 'Cavite', 4102, 'SDE', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(75, 316, 'BAUTISTA JR._CELSO', 'Bautista Jr.', 'Celso', 'Ceejay', 'cj', 'CEM', '', 'SDE', '1991-05-23', 'M', 'Single', '2013-02-16', 'bautista-kdt/P/KHI', 'pic_316.jpg', 0.0, '06:00', 'motorCycle', '', 'N/A', '1565E', 'Valentina', 'N/A', 'Barangay 814', 'Paco, City of Manila', 'NCR, First District', 1007, 'DE3', 'CEM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(76, 320, 'ESCUETA JR._JUANITO', 'Escueta Jr.', 'Juanito', 'Jeck', 'jeckzay', 'EE', '', 'DE3', '1984-03-23', 'M', 'Married', '2013-02-16', 'escueta_j-kdt/P/KHI', 'pic_320.jpg', 1.6, '06:00', 'carpool', 'Al Shariff Gallardo', '', '1376', 'Macopa St.', 'Garcia Subdivision San Antonio', 'Biñan', 'City of Biñan', 'Laguna', 4024, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(77, 321, 'BIGTAS_KEITH CHARM', 'Bigtas', 'Keith Charm', 'Charm', 'charm', 'EE', '', 'DE3', '1985-03-26', 'F', 'Single', '2013-02-16', 'bigtas-kdt/P/KHI', 'pic_321.jpg', 2.2, '07:00', 'carpool', 'Marie Eleonor Bio', '', '48', 'MRT Avenue', '', 'New Lower Bicutan', 'City of Taguig', 'NCR, Fourth District', 1630, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(78, 322, 'DELA ROSA_ESTER', 'Dela Rosa', 'Ester', 'Tets', 'ester', 'EE', '', 'SDE', '1987-02-28', 'F', 'Single', '2013-02-16', 'delarosa-kdt/P/KHI', 'pic_322.jpg', 0.0, '07:00', 'publicTransportation', '', '', '61C', 'C. JOSE ST.,', '', 'Barangay 160', 'Pasay City', 'NCR, Fourth District', 1300, 'SDE', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(79, 323, 'BORLAGON_ALVIN JAN', 'Borlagon', 'Alvin Jan', 'Vin', 'vhin', 'BOI', '', 'SDE', '1990-01-29', 'M', 'Married', '2013-02-16', 'borlagon-kdt/P/KHI', 'pic_323.jpg', 0.0, '06:10', 'publicTransportation', '', '', 'L-10, BLk 53', '10-29th St.', 'Villamor', 'Barangay 183', 'Pasay City', 'NCR, Fourth District', 1309, 'SDE', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(80, 328, 'CALLEJA_NOMER', 'Calleja', 'Nomer', 'PIPOY', 'nomer', 'BOI', '', 'SDE', '1989-04-11', 'M', 'Married', '2013-05-02', 'calleja-kdt/P/KHI', 'pic_328.jpg', 1.4, '06:00', 'publicTransportation', '', 'N/A', 'Blk 62 Lot.18', 'N/A', 'Birmingham Subd.Phase 3', 'Pulo', 'City of Cabuyao', 'Laguna', 4025, 'SDE', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(81, 329, 'MARQUESES_JEFF EDWARD', 'Marqueses', 'Jeff Edward', 'JEFF', 'je', 'BOI', '', 'SDE', '1988-11-01', 'M', 'Married', '2013-05-02', 'marqueses_j-kdt/P/KHI', 'pic_329.jpg', 2.2, '08:00', 'publicTransportation', '', '', '1710', 'Sandejas', '', 'Barangay 103', 'Pasay City', 'NCR, Fourth District', 1300, 'SDE', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(82, 330, 'OMIZ_GILBERT JASON', 'Omiz', 'Gilbert Jason', 'GILBERT', 'bert', 'PIP', '', 'SDE', '1991-04-03', 'M', 'Single', '2013-08-01', 'omiz-kdt/P/KHI', 'pic_330.jpg', 0.4, '07:00', 'publicTransportation', '', '', '15264', 'St. Francis St.', '', 'Moonwalk', 'City of Parañaque', 'NCR, Fourth District', 1709, 'SDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(83, 332, 'DE GUZMAN_CHRISTOPHER', 'De Guzman', 'Christopher', 'CHRIS', 'chrisdegz', 'ENV', '', 'SDE', '1990-09-22', 'M', 'Single', '2013-08-01', 'deguzman-kdt/P/KHI', 'pic_332.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'SDE', 'ENV', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(84, 333, 'MATAUM_MICHAEL', 'Mataum', 'Michael', 'KEL', 'kel', 'PIP', 'PIP/DXT', 'SDE', '1989-06-30', 'M', 'Single', '2013-08-01', 'mataum-kdt/P/KHI', 'pic_333.jpg', 0.7, '08:00', 'publicTransportation', '', '4A', '2971', 'Apolinario St', '', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'SDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(85, 334, 'MIRANDA_Julemir', 'Miranda', 'Julemir', 'JUN JUN', 'miranda_j-kdt', 'ENV', '', 'SDE', '1987-08-26', 'M', 'Single', '2013-08-01', 'miranda_j-kdt/P/KHI', 'pic_334.jpg', 2.1, '07:00', 'publicTransportation', '', '043', '043', 'Santol', 'santo nino', 'Santo Niño', 'Quezon City', 'NCR, Second District', 1008, 'SDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(86, 335, 'BALLON_AL JOHN', 'Ballon', 'Al John', 'AL JOHN', 'aljohn', 'MHAH', '', 'SDE', '1989-07-09', 'M', 'Married', '2013-08-01', 'ballon-kdt/P/KHI', 'pic_335.jpg', 0.0, '06:30', 'ownCar', '', '', 'B10, L117', 'Sandpiper Street', 'Westwood 1, Lancaster Estates', 'Pasong Camachile II', 'City of General Trias', 'Cavite', 4107, 'SDE', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(87, 338, 'BULAN JR._ROSBELT', 'Bulan Jr.', 'Rosbelt', 'ROS', 'ross', 'ENV', 'ENV/DXT', 'SDE', '1990-03-14', 'M', 'Single', '2013-10-01', 'bulan-kdt/P/KHI', 'pic_338.jpg', 0.0, '07:00', 'motorCycle', '', '', '32', 'Galaxy Road', 'Cielito Homes II', 'San Isidro', 'Taytay', 'Rizal', 1920, 'SDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(88, 344, 'PATRON_EDILAINE MAROSE', 'Patron', 'Edilaine Marose', 'EM', 'em', 'CHE', '', 'DE3', '1992-01-24', 'F', 'Single', '2014-01-02', 'patron-kdt/P/KHI', 'pic_344.jpg', 0.0, '06:30', 'carpool', 'Juanito Escueta Jr.', '', 'B18 L7', '', 'St Joseph Village 2', 'Santo Tomas', 'City of Biñan', 'Laguna', 4024, 'DE3', 'CHE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(89, 345, 'CAUNGA_RUSTUM OLIVER', 'Caunga', 'Rustum Oliver', 'RUSTUM', 'rocaunga', 'CRY', '', 'DE3', '1990-06-29', 'M', 'Single', '2014-01-02', 'caunga-kdt/P/KHI', 'pic_345.jpg', 0.9, '06:00', 'carpool', 'Rustum Oliver Caunga', '', '17', 'Abu Bakr St.', 'Kingsville Executive Village', 'Mayamot', 'City of Antipolo', 'Rizal', 1870, 'DE3', 'CRY', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(90, 346, 'BIO_MARIE ELEONOR', 'Bio', 'Marie Eleonor', 'MARIE', 'yhelle', 'EE', '', 'DE3', '1991-04-15', 'F', 'Married', '2014-01-02', 'mirabel-kdt/P/KHI', 'pic_346.jpg', 1.2, '07:00', 'publicTransportation', '', '', '4', 'Maestrang Pinang', '', 'Ligid-Tipas', 'City of Taguig', 'NCR, Fourth District', 1638, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(91, 348, 'TOBIAS_JEOFFER', 'Tobias', 'Jeoffer', 'JEOFF', 'jltobias', 'ENV', '', 'DE3', '1990-07-24', 'M', 'Single', '2014-04-01', 'tobias-kdt/P/KHI', 'pic_348.jpg', 0.0, '07:00', 'motorCycle', '', '', 'Blk 77 Lot 7', '12-23rd', 'Villamor', 'Barangay 183', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'ENV', '1', '2022-03-31', '', 0, '2023-02-13', 0, 0, 0, 0),
(92, 350, 'CAJES_JOSEPH', 'Cajes', 'Joseph', 'DODONG', 'josephcc', 'CRY', '', 'DE3', '1990-03-22', 'M', 'Married', '2014-04-01', 'cajes-kdt/P/KHI', 'pic_350.jpg', 1.0, '06:00', 'bicycle', '', '', '310A', 'Eusebio', '', 'Barangay 42', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'CRY', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(93, 352, 'DUCAY_JOHN DAVID', 'Ducay', 'John David', 'DAVID', 'johndavid', 'ENV', '', 'DE3', '1989-08-28', 'M', 'Married', '2014-04-01', 'ducay-kdt/P/KHI', 'pic_352.jpg', 0.9, '07:00', 'carpool', 'John David Ducay', 'Crestly Bldg', '2L10', 'Perla Street', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(94, 353, 'TORIO_RAFFY', 'Torio', 'Raffy', 'RAFFY', 'raffy', 'SYS', 'SYS/SHI', 'SSE', '1989-02-02', 'M', 'Single', '2014-04-01', 'torio-kdt/P/KHI', 'pic_353.jpg', 1.2, '09:00', 'ownCar', '', '', '1952', 'RADIAL ROAD 10', '', 'Barangay 110', 'Tondo I/II, City of Manila', 'NCR, First District', 1012, 'SSE', 'SYS', '0', '2022-07-27', 'Erwin Tan', 0, '2022-07-18', 0, 4, 1, 1),
(95, 355, 'DE JESUS_JOMMUEL', 'De Jesus', 'Jommuel', 'JOM', 'jommuel', 'SYS', 'SYS', 'SE3', '1992-01-29', 'M', 'Single', '2014-04-01', 'dejesus_j-kdt/P/KHI', 'pic_355.jpg', 0.0, '07:00', 'motorCycle', '', '', '3064', 'Don Simeon St.', '', 'Mapulang Lupa', 'City of Valenzuela', 'NCR, Third District', 1448, 'SE3', 'SYS', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 4, 0, 1),
(96, 356, 'SUMAYOP_LIAN MARIE', 'Sumayop', 'Lian Marie', 'LIAN', 'lian', 'EE', '', 'DE3', '1991-02-07', 'F', 'Married', '2014-04-01', 'cabradilla-kdt/P/KHI', 'pic_356.jpg', 0.7, '07:00', 'publicTransportation', '', '', 'Blk 3 Lot 4', 'Sampaguita St.', 'Salanap Compound, Sitio Mendez', 'Baesa', 'Quezon City', 'NCR, Second District', 1106, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(97, 357, 'SANAO_JOMARI', 'Sanao', 'Jomari', 'JOM', 'jomari', 'PIP', '', 'DE3', '1992-11-19', 'M', 'Married', '2014-06-02', 'sanao-kdt/P/KHI', 'pic_357.jpg', 0.9, '06:15', 'carpool', 'Jomari Sanao', '', 'B15 L16 P8', 'GS Taad', 'Garden Villas 3', 'Malusak (Pob.)', 'City of Santa Rosa', 'Laguna', 4026, 'DE3', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(98, 358, 'SANAO_ROXANNE MAY', 'Sanao', 'Roxanne May', 'XANXAN', 'xanxane', 'PIP', '', 'DE3', '1991-03-11', 'F', 'Married', '2014-06-02', 'velez-kdt/P/KHI', 'pic_358.jpg', 0.0, '06:15', 'carpool', 'Jomari Sanao', '', 'blk15 lot 16', 'GS Taad Street', 'Garden Villas 3', 'Malusak (Pob.)', 'City of Santa Rosa', 'Laguna', 4026, 'DE3', 'PIP', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(99, 364, 'BITANG_KIM BRIAN', 'Bitang', 'Kim Brian', 'Kim', 'Kimbrian', 'ENV', '', 'DE3', '1992-02-15', 'F', 'Single', '2014-09-01', 'bitang-kdt/P/KHI', 'pic_364.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'ENV', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(100, 365, 'MAGNAYE_LARA JOY', 'Magnaye', 'Lara Joy', 'LARA', 'lara', 'ENV', '', 'DE3', '1991-09-17', 'F', 'Married', '2014-09-01', 'dimaculangan-kdt/P/KHI', 'pic_365.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'ENV', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(101, 367, 'MENDOZA_MARCIAL', 'Mendoza', 'Marcial', 'MARCY', 'marci', 'ENV', '', 'DE3', '1990-05-24', 'M', 'Married', '2014-09-01', 'mendoza_m-kdt/P/KHI', 'pic_367.jpg', 0.4, '07:30', 'publicTransportation', '', '173F', '', 'M. Santos', '', 'Barangay 25', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(102, 370, 'NOPRA_CHARIS CANDY', 'Nopra', 'Charis Candy', 'CANDY', 'candy', 'IT', '', 'IT-SE', '1992-04-14', 'F', 'Single', '2014-09-01', 'nopra-kdt/P/KHI', 'pic_370.jpg', 0.0, '06:00', 'Arnold', '04:45/15:00', '', 'B18 L17 ', '', 'Camachile Subd.', 'Pasong Camachile I', 'City of General Trias', 'Cavite', 4107, 'IT-E3', 'IT', '1', '2022-03-31', '', 1, NULL, 0, 4, 0, 1),
(103, 371, 'CORDOVA_YSABEL', 'Cordova', 'Ysabel', 'Ysay', 'ysay', 'MHAH', '', 'DE3', '1991-01-19', 'F', 'Single', '2015-02-02', 'cordova-kdt/P/KHI', 'pic_371.jpg', 0.0, '07:30', 'publicTransportation', '', '2607 Tower 1, Avida Prime Taft ', '', 'Taft Avenue', '', 'Barangay 36', 'Pasay City', 'NCR, Fourth District', 1709, 'DE3', 'MHAH', '1', '2022-04-19', 'Ernesto Veloso', 1, NULL, 0, 0, 0, 0),
(104, 372, 'FRANE_GERALD CHRISTOPHER', 'Frane', 'Gerald Christopher', 'Gerald', 'gerald', 'EE', '', 'DE3', '1991-12-01', 'M', 'Single', '2015-02-02', 'frane-kdt/P/KHI', 'pic_372.jpg', 0.0, '07:00', 'publicTransportation', '', '', '001', 'Bravo Street', '', 'Central Signal Village', 'City of Taguig', 'NCR, Fourth District', 1630, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(105, 373, 'SABARILLO_NELMAR BONG', 'Sabarillo', 'Nelmar Bong', 'Bong', 'bong', 'CRY', '', 'DE3', '1993-04-22', 'M', 'Single', '2015-02-02', 'sabarillo-kdt/P/KHI', 'pic_373.jpg', 0.0, '07:00', 'motorCycle', '', '', '97-8', 'Manuel L. Quezon', '', 'Cupang', 'City of Muntinlupa', 'NCR, Fourth District', 1771, 'DE3', 'CRY', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(106, 374, 'Fortus_Domini', 'Fortus', 'Domini', 'Domini', 'domini_resign', 'TEG', '', 'DE3', '1993-07-12', 'M', 'Single', '2015-02-02', 'fortus-kdt/P/KHI', 'pic_374.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'TEG', '0', '2022-03-31', '', 0, '2022-03-15', 0, 0, 0, 0),
(107, 376, 'MANAOG_KAREN LORRAINE', 'Manaog', 'Karen Lorraine', 'Karen', 'karenv', 'EE', '', 'DE3', '1990-10-19', 'F', 'Married', '2015-02-02', 'vallestero-kdt/P/KHI', 'pic_376.jpg', 1.5, '06:00', 'carpool', 'Francis Martee Gulapa', '', '70', 'Naval St.', '', 'Dolores (Pob.)', 'Taytay', 'Rizal', 1920, 'DE3', 'EE', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(108, 377, 'GUICO_ALDRIN', 'Guico', 'Aldrin', 'Gibo', 'gibo', 'MHAH', '', 'DE3', '1991-08-11', 'M', 'Single', '2015-02-02', 'guico-kdt/P/KHI', 'pic_377.jpg', 0.6, '06:15', 'publicTransportation', '', 'Crestly Building', '', 'Perla Street', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1305, 'DE3', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(109, 378, 'MONTALBO_JENNELYN', 'Montalbo', 'Jennelyn', 'Jen', 'jhen', 'MHAH', '', 'DE3', '1989-12-04', 'F', 'Married', '2015-02-02', 'reyes_j-kdt/P/KHI', 'pic_378.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'MHAH', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(110, 381, 'FLORES_ANGELO', 'Flores', 'Angelo', 'Angelo', 'gelo', 'MHAH', '', 'DE3', '1990-06-19', 'M', 'Single', '2015-02-02', 'flores_a-kdt/P/KHI', 'pic_381.jpg', 0.0, '07:00', 'publicTransportation', '', '', '06C', 'Robin St', 'Francisville', 'Mambugan', 'City of Antipolo', 'Rizal', 1870, 'DE3', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(111, 382, 'MARQUEZ_ARVIN DAVID', 'Marquez', 'Arvin David', 'Arvin', 'arvin', 'CIV', '', 'DE3', '1991-11-19', 'M', 'Married', '2015-05-11', 'marquez-kdt/P/KHI', 'pic_382.jpg', 0.0, '06:05', 'ownCar', '', '', '242', 'Natividad', '', 'San Pedro (Pob.)', 'Morong', 'Rizal', 1960, 'DE3', 'CIV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(112, 383, 'BELLEN_ABEGAIL', 'Bellen', 'Abegail', 'Abby', 'bellenabi', 'CIV', '', 'DE3', '1990-05-16', 'F', 'Single', '2015-05-11', 'bellen-kdt/P/KHI', 'pic_383.jpg', 0.0, '08:30', 'publicTransportation', '', '117 Purok 5,', 'n/a', 'Road 6', 'n/a', 'Bagong Silangan', 'Quezon City', 'NCR, Second District', 1119, 'DE3', 'CIV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(113, 384, 'GALLARDO_AL SHARIFF', 'Gallardo', 'Al Shariff', 'Al', 'al', 'ANA', '', 'DE3', '1993-06-14', 'M', 'Single', '2015-05-11', 'gallardo-kdt/P/KHI', 'pic_384.jpg', 0.0, '06:00', 'carpool', 'Al Shariff Gallardo', 'No 2B', 'No2B', 'Bonus Street', 'Chrysanthemum', 'Chrysanthemum', 'City of San Pedro', 'Laguna', 4023, 'DE3', 'ANA', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(114, 385, 'PEREZ_JEREMIA', 'Perez', 'Jeremia', 'Mia', 'mia', 'CIV', '', 'DE3', '1990-09-18', 'F', 'Single', '2015-05-11', 'perez_j-kdt/P/KHI', 'pic_385.jpg', 0.0, '09:00', 'publicTransportation', '', '', '1386-K', 'Burgos', '', 'Barangay 826', 'Paco, City of Manila', 'NCR, First District', 1007, 'DE3', 'CIV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(115, 386, 'TAN_DENNIS', 'Tan', 'Dennis', 'Dennis', 'dennistan', 'MPM', '', 'DE3', '1990-07-26', 'M', 'Single', '2015-06-01', 'tan_d-kdt/P/KHI', 'pic_386.jpg', 2.0, '06:00', 'carpool', 'Dennis Tan', '', 'Block 7, Lot 31', '', 'Villa Arcadia', 'Carsadang Bago I', 'City of Imus', 'Cavite', 4103, 'DE3', 'MPM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(116, 387, 'BALGOMA_RAMIL', 'Balgoma', 'Ramil', 'Ram', 'rbalgoma', 'MHAH', '', 'DE3', '1992-11-17', 'M', 'Single', '2015-06-01', 'balgoma-kdt/P/KHI', 'pic_387.jpg', 0.0, '06:15', 'publicTransportation', '', 'Sophia\'s Place', '98 B', 'Vizcarra St', '', 'Malibay', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(117, 388, 'GUPIT_BERNICO', 'Gupit', 'Bernico', 'Bernie', 'bernico', 'MHAH', '', 'DE3', '1992-03-16', 'M', 'Single', '2015-06-01', 'gupit-kdt/P/KHI', 'pic_388.jpg', 0.4, '07:00', 'bicycle', '', '', '347', 'Damka', '', 'Barangay 598', 'Sampaloc, City of Manila', 'NCR, First District', 1016, 'DE3', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(118, 389, 'MIRANDA_NIKKO', 'Miranda', 'Nikko', 'Nikko', 'nikkomiranda', 'MPM', '', 'DE3', '1992-03-16', 'M', 'Single', '2015-06-01', 'miranda_n-kdt/P/KHI', 'pic_389.jpg', 0.4, '06:00', 'motorCycle', '', '', '987', 'Sunnyvale St.', 'Parkplace', 'San Isidro', 'Cainta', 'Rizal', 1900, 'DE3', 'MPM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(119, 390, 'GARCIA_CHRISTIAN JOSEPH', 'Garcia', 'Christian Joseph', 'Anjo', 'cmgarcia', 'ENV', '', 'DE3', '1991-02-10', 'M', 'Married', '2015-06-01', 'garcia_c-kdt/P/KHI', 'pic_390.jpg', 1.0, '07:30', 'publicTransportation', '', 'Dominga Dorm', 'NA', 'Dominga Street', 'NA', 'Barangay 45', 'Pasay City', 'NCR, Fourth District', 1306, 'DE3', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(120, 391, 'DALISAY_CATHERINE', 'Dalisay', 'Catherine', 'Cathy', 'catherine', 'ACT', '', 'AA', '1984-09-30', 'F', 'Married', '2015-08-06', 'austria-kdt/P/KHI', 'pic_391.jpg', 0.0, '07:00', 'carpool', 'Christopher Abuan', 'Unit 2L ', '10 Goldendale ave', '', 'Goldendale subd', 'Tinajeros', 'City of Malabon', 'NCR, Third District', 1470, 'AA', 'ACT', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(121, 393, 'DE SOTTO_FRANCIS JOHN', 'De Sotto', 'Francis John', 'Kiko', 'francis', 'MHAH', '', 'DE3', '1990-11-05', 'M', 'Single', '2015-10-01', 'desotto-kdt/P/KHI', 'pic_393.jpg', 0.0, '06:00', 'motorCycle', '', '223', '', '', '', 'Sapang Putik', 'San Ildefonso', 'Bulacan', 3010, 'DE2', 'MHAH', '1', '2022-03-31', '', 0, '2022-08-01', 0, 0, 0, 0),
(122, 394, 'BANTA_LEAH MARIEL', 'Banta', 'Leah Mariel', 'Leah', 'leah', 'MHAH', '', 'DE2', '1992-10-15', 'F', 'Single', '2015-10-01', 'banta-kdt/P/KHI', 'pic_394.jpg', 0.0, '07:00', 'publicTransportation', '', '7234', '', 'J.Victor', '', 'Pio Del Pilar', 'City of Makati', 'NCR, Fourth District', 1230, 'DE2', 'MHAH', '0', '2022-07-27', 'Erwin Tan', 0, '2022-05-08', 0, 0, 0, 0),
(123, 395, 'VILLANUEVA_GLADYS ', 'Villanueva', 'Gladys ', 'Gladys', 'Gladys', 'ENV', '', 'DE2', '1993-02-26', 'F', 'Single', '2015-10-01', 'villanueva-kdt/P/KHI', 'pic_395.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE2', 'ENV', '0', '2022-03-31', '', 0, '2021-11-01', 0, 0, 0, 0),
(124, 396, 'LACSA_JOHN', 'Lacsa', 'John', 'John', 'lacsa', 'MHAH', '', 'DE3', '1993-01-16', 'M', 'Single', '2015-10-01', 'lacsa-kdt/P/KHI', 'pic_396.jpg', 0.2, '06:00', 'Tony', '05:45/15:00', '3504', '', 'Gen. V. Lucban', '', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'DE3', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(125, 397, 'CANTOS_RENIEL', 'Cantos', 'Reniel', 'Reniel', 'ren', 'BOI', '', 'DE2', '1993-03-11', 'M', 'Single', '2015-10-01', 'cantos-kdt/P/KHI', 'pic_397.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE2', 'BOI', '0', '2022-03-31', '', 0, '2022-02-18', 0, 0, 0, 0),
(126, 398, 'STA. ANA_Arnulfo', 'Sta. Ana', 'Arnulfo', 'Arnold', 'kuyaarnold', 'ADM', '', 'DRM', '1965-03-02', 'M', 'Married', '2016-04-01', '', 'pic_398.jpg', 0.0, '06:00', 'publicTransportation', '', '', '3-A, Lot 63', '', '', 'Francisco Reyes', 'Gen. Mariano Alvarez', 'Cavite', 4117, 'DRM', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(127, 401, 'LAUREANO_MIKI ANTONIO', 'Laureano', 'Miki Antonio', 'Miki', 'mikilaureano', 'ENV', '', 'DE3', '1993-05-06', 'M', 'Married', '2016-07-01', 'laureano_m-kdt/P/KHI', 'pic_401.jpg', 0.0, '07:00', 'motorCycle', '', '', '167B', 'Gov. Pascual St.', '', 'San Jose (Pob.)', 'City of Navotas', 'NCR, Third District', 1485, 'DE3', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(128, 402, 'ORNIDO_MARVIN JOHN', 'Ornido', 'Marvin John', 'Marvz', 'marvz', 'BOI', '', 'DE3', '1992-09-17', 'M', 'Single', '2016-07-01', 'ornido-kdt/P/KHI', 'pic_402.jpg', 1.3, '08:00', 'motorCycle', '', '', 'Block 8 Lot 3', 'Franc Lane', 'Ecotrend Villas', 'Zapote', 'City of Las Piñas', 'NCR, Fourth District', 1742, 'DE3', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(129, 403, 'MANGALIMAN_LAARNI', 'Mangaliman', 'Laarni', 'Lani', 'laarni', 'CEM', '', 'DE3', '1993-09-04', 'F', 'Married', '2016-07-01', 'tumamao-kdt/P/KHI', 'pic_403.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DE3', 'CEM', '1', '2022-07-27', 'Erwin Tan', 0, '2022-11-05', 0, 0, 0, 0),
(130, 404, 'ARGENTE_GENE OWEN', 'Argente', 'Gene Owen', 'Owen', 'geneowen', 'ENV', '', 'DE3', '1991-08-17', 'M', 'Single', '2016-07-01', 'argente-kdt/P/KHI', 'pic_404.jpg', 1.4, '07:10', 'publicTransportation', '', '', '173F', 'M. Santos', '', 'Barangay 25', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(131, 406, 'TUMBAGA_Jefferson', 'Tumbaga', 'Jefferson', 'Jep', 'tumbaga-kdt', 'CEM', '', 'DE3', '1993-07-22', 'M', 'Married', '2016-07-01', 'tumbaga-kdt/P/KHI', 'pic_406.jpg', 1.5, '07:00', 'publicTransportation', '', 'Sophias Place', '509', 'B Vizcarra St.', 'Malibay', 'Barangay 169', 'Pasay City', 'NCR, Fourth District', 1300, 'DE3', 'CEM', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(132, 407, 'VILLATUYA_RUSSEL', 'Villatuya', 'Russel', 'Russel', 'rcvillatuya', 'EE', '', 'DE3', '1992-08-07', 'M', 'Single', '2016-07-01', 'villatuya-kdt/P/KHI', 'pic_407.jpg', 0.0, '07:00', 'publicTransportation', '', '', '30-5C ', 'Dalandan St.', 'San Isidro Subd.', 'Pamplona Uno', 'City of Las Piñas', 'NCR, Fourth District', 1742, 'DE3', 'EE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(133, 409, 'DELA CRUZ_EARVIN JAMES', 'Dela Cruz', 'Earvin James', 'EJ', 'earvinjames', 'SYS', '', 'SE3', '1993-04-03', 'M', 'Single', '2016-07-01', 'delacruz-kdt/P/KHI', 'pic_409.jpg', 0.0, '06:15', 'motorCycle', '', '', '45', 'M Fernando St', 'Wawa', 'Tangos South', 'City of Navotas', 'NCR, Third District', 1489, 'SE3', 'SYS', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 4, 0, 1),
(134, 410, 'PARRA_ELY', 'Parra', 'Ely', 'Ely', 'elyparra', 'BOI', '', 'DE2', '1994-07-11', 'M', 'Single', '2017-03-01', 'parra-kdt/P/KHI', 'pic_410.jpg', 0.0, '08:00', 'publicTransportation', '', 'Unit 8 Raniola Apt', '45', 'Perla Street', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1306, 'DE2', 'BOI', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(135, 411, 'ILAO_MARYLOU', 'Ilao', 'Marylou', 'Malou', 'malou', 'ENV', '', 'DE2', '1991-10-13', 'F', 'Single', '2017-03-01', 'manalo-kdt/P/KHI', 'pic_411.jpg', 1.7, '07:30', 'publicTransportation', '', '1FL', '1742', 'F. Guizon Street', '', 'Kasilawan', 'City of Makati', 'NCR, Fourth District', 1206, 'DE2', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(136, 412, 'RIVERA_REENAN', 'Rivera', 'Reenan', 'Reenan', 'reenan', 'ENV', '', 'DE2', '1992-10-01', 'M', 'Single', '2017-03-01', 'rivera-kdt/P/KHI', 'pic_412.jpg', 0.0, '06:30', 'publicTransportation', '', '', '173F', 'M. Santos', '', 'Barangay 25', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0);
INSERT INTO `emp_prof` (`fldID`, `fldEmployeeNum`, `fldName`, `fldSurname`, `fldFirstname`, `fldNick`, `fldUser`, `fldGroup`, `fldGroups`, `fldDesig`, `fldBirthDate`, `fldGender`, `fldStatus`, `fldDateHired`, `fldLotus`, `fldPic`, `fldOthers`, `fldStartTime`, `fldMOT`, `fldRemarks`, `fldUnit`, `fldHouse`, `fldStreet`, `fldSub`, `fldBrgy`, `fldCity`, `fldProv`, `fldZip`, `fldDesigStamp`, `fldGroupStamp`, `fldActiveStamp`, `fldStampDate`, `fldChecker`, `fldActive`, `fldResignDate`, `fldUpload`, `fldAccess`, `fldAccessCommute`, `fldMRRSReserve`) VALUES
(137, 413, 'BUZETA_WENDY', 'Buzeta', 'Wendy', 'Wendy', 'wendz', 'MHAH', '', 'DE2', '1991-01-22', 'F', 'Single', '2017-03-01', 'anorico-kdt/P/KHI', 'pic_413.jpg', 3.2, '07:30', 'publicTransportation', '', '', '173F', 'M. Santos', 'Leveriza', 'Barangay 25', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(138, 414, 'ANTONIO_WILHELM DENNIS', 'Antonio', 'Wilhelm Dennis', 'Lem', 'wilhelm', 'ENV', '', 'DE2', '1994-08-05', 'M', 'Single', '2017-03-01', 'antonio-kdt/P/KHI', 'pic_414.jpg', 0.0, '06:30', 'publicTransportation', '', '', 'Block 15 Lot 6B', 'Chico', 'Doña Josefa Village', 'Almanza Uno', 'City of Las Piñas', 'NCR, Fourth District', 1750, 'DE2', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(139, 415, 'ASTRERA_PHILIP JHON', 'Astrera', 'Philip Jhon', 'Philip', 'philipj', 'ENV', '', 'DE2', '1995-11-23', 'M', 'Single', '2017-03-01', 'astrera-kdt/P/KHI', 'pic_415.jpg', 0.0, '07:30', 'publicTransportation', '', 'Unit 12', '1045A', 'Quintos Sr. St.', '', 'Barangay 505', 'Sampaloc, City of Manila', 'NCR, First District', 1008, 'DE2', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(140, 416, 'FLORESCA_GENE PHILIP', 'Floresca', 'Gene Philip', 'Gene', 'gene', 'ETCL', '', 'DE2', '1992-11-20', 'M', 'Single', '2017-03-01', 'floresca-kdt/P/KHI', 'pic_416.jpg', 0.0, '06:30', 'publicTransportation', '', '', '', 'Santander St.', 'Villa Roma 6', 'Lias', 'Marilao', 'Bulacan', 3019, 'DE2', 'CEM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(141, 417, 'BINAY-AN_DARYL', 'Binay-an', 'Daryl', 'Daryl', 'darylb', 'MHAH', 'MHAH', 'DE2', '1994-10-24', 'M', 'Single', '2017-03-01', 'binayan-kdt/P/KHI', 'pic_417.jpg', 0.0, '07:30', 'publicTransportation', '', '77L', '', 'C. Jose', '', 'Barangay 162', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'MHAH', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(142, 419, 'MESIAS_MERIAM', 'Mesias', 'Meriam', 'Yamie', 'meriam', 'ADM', '', 'AAR', '1985-08-15', 'F', 'Single', '2017-09-04', 'mesias-kdt/P/KHI', 'pic_419.jpg', 0.0, '07:00', 'carpool', 'Christopher Abuan', '', '21L', 'Esguerra St.', '', 'Flores', 'City of Malabon', 'NCR, Third District', 1400, 'AAR', 'ADM', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(143, 420, 'BENEDICTO_ALVIN', 'Benedicto', 'Alvin', 'Vin', 'vin', 'ENV', '', 'DE2', '1994-10-20', 'M', 'Single', '2018-07-02', 'benedicto-kdt/P/KHI', 'pic_420.jpg', 1.0, '06:30', 'publicTransportation', '', '', '335', 'Taylo', '', 'Barangay 55', 'Pasay City', 'NCR, Fourth District', 1800, 'DE1', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(144, 421, 'NAZAR_JOHN JACOB', 'Nazar', 'John Jacob', 'Jacob', 'jjnazar', 'MHAH', '', 'DE2', '1996-01-28', 'M', 'Single', '2018-07-02', 'nazar-kdt/P/KHI', 'pic_421.jpg', 0.4, '07:00', 'motorCycle', '', '201', '3615', 'Magistrado Arellano', 'Bacood', 'Barangay 612', 'Sampaloc, City of Manila', 'NCR, First District', 1016, 'DE2', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(145, 422, 'PIMENTEL_LUCKY BOY', 'Pimentel', 'Lucky Boy', 'Lux', 'lux', 'ENV', '', 'DE2', '1996-10-20', 'M', 'Single', '2018-07-02', 'pimentel-kdt/P/KHI', 'pic_422.jpg', 0.5, '06:30', 'carpool', 'John David Ducay', 'Rm. 8 Ranola Apartment', '45', 'Perla St.', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1305, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(146, 423, 'CARO_RENSON', 'Caro', 'Renson', 'Renson', 'rensonc', 'ENV', '', 'DE2', '1995-01-15', 'M', 'Single', '2018-07-02', 'caro-kdt/P/KHI', 'pic_423.jpg', 1.0, '06:00', 'publicTransportation', '', '', '728', 'P Santos', 'Malibay', 'Barangay 169', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(147, 424, 'PEREZ_RENZEL', 'Perez', 'Renzel', 'Renzel', 'renzel', 'MHAH', '', 'DE2', '1994-09-09', 'M', 'Single', '2018-07-02', 'perez_r-kdt/P/KHI', 'pic_424.jpg', 0.8, '08:30', 'motorCycle', '', '', '11', 'Urrutia Avenue', '', 'Gen. T. De Leon', 'City of Valenzuela', 'NCR, Third District', 1442, 'DE2', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(148, 425, 'BELEN_MARVIN', 'Belen', 'Marvin', 'Marvin', 'mbelen', 'ENV', '', 'DE2', '1994-09-22', 'M', 'Single', '2018-07-02', 'belen_m-kdt/P/KHI', 'pic_425.jpg', 1.5, '06:30', 'publicTransportation', '', '', '', 'S. De Guzman St.', '', 'Barangay 165', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(149, 426, 'TUAZON_KING LOUIS', 'Tuazon', 'King Louis', 'King', 'kdtuazon', 'BOI', '', 'DE2', '1992-04-14', 'M', 'Single', '2018-07-02', 'tuazon-kdt/P/KHI', 'pic_426.jpg', 3.8, '06:45', 'publicTransportation', '', '', '173F', 'M.Santos Leveriza', '', 'Barangay 25', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(150, 427, 'FERNANDEZ_JULIUS', 'Fernandez', 'Julius', 'Julius', 'julius', 'MHAH', '', 'DE2', '1994-01-02', 'M', 'Single', '2018-07-02', 'fernandez-kdt/P/KHI', 'pic_427.jpg', 1.7, '08:15', 'bicycle', '', '77L', '77', 'C.Jose', '', 'Barangay 166', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(151, 428, 'VELASCO_VRYAN', 'Velasco', 'Vryan', 'Vryan', 'vryan', 'ENV', '', 'DE2', '1993-10-05', 'M', 'Single', '2018-07-02', 'velasco-kdt/P/KHI', 'pic_428.jpg', 1.3, '08:00', 'ownCar', '', 'EJ & Levi Bldg.', '2996', 'H. Santos', '', 'Carmona', 'City of Makati', 'NCR, Fourth District', 1207, 'DE1', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(152, 429, 'MORALITA_DENMARK', 'Moralita', 'Denmark', 'Denmark', 'dmoralita', 'ENV', '', 'DE2', '1994-09-10', 'M', 'Single', '2018-07-02', 'moralita-kdt/P/KHI', 'pic_429.jpg', 0.5, '06:30', 'publicTransportation', '', 'Unit 4B Eva\'s Apartment', '', '', '', 'Barangay 165', 'Pasay City', 'NCR, Fourth District', 1709, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(153, 430, 'UCOL_ZENDY GRACE', 'Ucol', 'Zendy Grace', 'Zendy', 'zendy', 'ENV', '', 'DE2', '1995-08-13', 'F', 'Single', '2018-07-02', 'ucol-kdt/P/KHI', 'pic_430.jpg', 0.3, '08:30', 'publicTransportation', '', '3FL, Veloso Building', '#30', 'Magnolia St.', 'Maricaban', 'Barangay 184', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(154, 432, 'MACARAAN_CHRISTIAN', 'Macaraan', 'Christian', 'Christian', 'cmacaraan', 'ENV', '', 'DE2', '1993-12-24', 'M', 'Single', '2018-07-02', 'macaraan-kdt/P/KHI', 'pic_432.jpg', 2.0, '08:30', 'motorCycle', '', 'N/A', 'BLOCK 10 LOT 6', 'N/A', 'Amaia Scape General Trias', 'Santiago', 'City of General Trias', 'Cavite', 4107, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(155, 433, 'RAMOS_ALYSSA', 'Ramos', 'Alyssa', 'Alyssa', 'alyssa', 'MHAH', '', 'DE2', '1995-09-04', 'F', 'Single', '2018-07-02', 'ramos-kdt/P/KHI', 'pic_433.jpg', 0.0, '07:00', 'publicTransportation', '', '', '1677A', 'Dian Street', '', 'San Isidro', 'City of Makati', 'NCR, Fourth District', 1234, 'DE2', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(156, 434, 'PILIS_VILMER', 'Pilis', 'Vilmer', 'Vilmer', 'vilmer', 'ENV', '', 'DE2', '1993-09-12', 'M', 'Single', '2018-07-02', 'pilis-kdt/P/KHI', 'pic_434.jpg', 1.6, '07:00', 'carpool', 'Vryan Velasco', '1278 Residences', '1278', 'Batangas ', '', 'San Isidro', 'City of Makati', 'NCR, Fourth District', 1234, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(157, 435, 'BASIBAS_KERSTIN PAULA', 'Basibas', 'Kerstin Paula', 'Kerstin', 'kbasibas', 'ENV', '', 'DE2', '1995-02-03', 'F', 'Single', '2018-07-02', 'basibas-kdt/P/KHI', 'pic_435.jpg', 0.8, '06:00', 'carpool', 'Aldrin Guico', '', '37', 'Perla Street', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1300, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(158, 436, 'VIÑAS_EUGENE', 'Viñas', 'Eugene', 'Eugene', 'eugene', 'ENV', '', 'DE2', '1994-03-15', 'M', 'Single', '2018-07-02', 'vinas-kdt/P/KHI', 'pic_436.jpg', 1.4, '06:30', 'bicycle', '', '53H', '', 'J.Ruiz Street', '', 'Salapan', 'City of San Juan', 'NCR, Second District', 1500, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(159, 437, 'CALLORES_DICK FRANCIS', 'Callores', 'Dick Francis', 'Dick', 'dickfrancis', 'ENV', '', 'DE2', '1993-10-27', 'M', 'Single', '2018-07-02', 'callores-kdt/P/KHI', 'pic_437.jpg', 1.7, '08:30', 'bicycle', '', 'Cruz Appartment', '77L', 'Clemante Jose', 'Malibay', 'Barangay 166', 'Pasay City', 'NCR, Fourth District', 1300, 'DE1', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(160, 438, 'REYES_JUAN CARLOS', 'Reyes', 'Juan Carlos', 'JC', 'jc', 'ENV', '', 'DE2', '1994-09-19', 'M', 'Single', '2018-07-02', 'reyes_jc-kdt/P/KHI', 'pic_438.jpg', 1.7, '06:00', 'carpool', 'Jasper Dimaapi', '', '93', '', '', 'Malagasang I-B', 'City of Imus', 'Cavite', 4103, 'DE2', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(161, 439, 'ARROYO_Micah Camille', 'Arroyo', 'Micah Camille', 'Micah', 'arroyo-kdt', 'IT', '', 'IT-E2', '1997-09-13', 'F', 'Single', '2018-07-02', 'arroyo-kdt/P/KHI', 'pic_439.jpg', 0.0, '07:00', 'publicTransportation', '', 'Bldg. 3', 'Sapari Condo.', 'Osmeña Highway', '', 'Barangay 769', 'Santa Ana, City of Manila', 'NCR, First District', 1017, 'IT-E1', 'IT', '1', '2022-03-31', '', 1, NULL, 0, 4, 0, 1),
(162, 440, 'PANGINBAYAN_Rochelle', 'Panginbayan', 'Rochelle', 'Chelle', 'panginbayan-kdt', 'IT', '', 'IT-E2', '1997-07-20', 'F', 'Single', '2018-07-02', 'panginbayan-kdt/P/KHI', 'pic_440.jpg', 0.0, '06:30', 'carpool', 'John David Ducay', 'Unit C3', '179', 'Porvenir St.', 'N/A', 'Barangay 20', 'Pasay City', 'NCR, Fourth District', 1302, 'IT-E1', 'IT', '1', '2022-03-31', '', 1, NULL, 0, 4, 0, 1),
(163, 444, 'TOBIAS_KENNETH', 'Tobias', 'Kenneth', 'Ken', 'ken', 'CIV', '', 'DE2', '1996-01-26', 'M', 'Single', '2018-10-01', 'tobias_k-kdt/P/KHI', 'pic_444.jpg', 0.0, '07:20', 'publicTransportation', '', '', '54', 'k6', '', 'West Kamias', 'Quezon City', 'NCR, Second District', 1102, 'DE2', 'CIV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(164, 445, 'HONRADO_RUTH ANNE', 'Honrado', 'Ruth Anne', 'Ruth', 'ruth', 'ANA', 'ANA', 'DE2', '1992-04-09', 'F', 'Single', '2018-10-01', 'honrado-kdt/P/KHI', 'pic_445.jpg', 0.0, '06:00', 'carpool', 'Jasper Dimaapi', '317', '', 'CBI SITE', '', 'Anabu I-B', 'City of Imus', 'Cavite', 4103, 'DE2', 'ANA', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(165, 446, 'TAKENAKA_YUKIHIRO', 'Takenaka', 'Yukihiro', '', 'takenaka_yu', 'ADM', '', 'KDTP', '1965-11-25', 'M', '', '2016-11-25', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 0.0, '07:30', 'Tony', '07:15/16:30', 'SixSenses Residence', '6H, Tower 2', 'Diosdado Macapagal Blvd', '-', 'Barangay 76', 'Pasay City', 'NCR, Fourth District', 1300, 'KDTP', 'ADM', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(166, 447, 'MEDRANO_MARCO', 'Medrano', 'Marco', 'Marco', 'maco', 'PIP', '', 'DE1', '1997-10-04', 'M', 'Single', '2019-07-01', 'medrano-kdt/P/KHI', 'pic_447.jpg', 0.0, '06:30', 'publicTransportation', '', '', '79', 'J. Marzan ', '', 'Barangay 422', 'Sampaloc, City of Manila', 'NCR, First District', 1013, 'DE1', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(167, 448, 'BUSTON_CHERRY MAE ', 'Buston', 'Cherry Mae ', 'Che', 'che', 'PIP', '', 'DE1', '1996-03-08', 'F', 'Single', '2019-07-01', 'soliven-kdt/P/KHI', 'pic_448.jpg', 0.0, '07:00', 'publicTransportation', '', '', 'LOT 18 BLOCK 152', 'ARAGO STREET', '', 'Central Bicutan', 'City of Taguig', 'NCR, Fourth District', 1630, 'DE1', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(168, 449, 'VIADO_MEYRVIN', 'Viado', 'Meyrvin', 'Meyrvin', 'meyrvin', 'PIP', 'PIP/DXT', 'DE1', '1996-05-11', 'M', 'Single', '2019-07-01', 'viado-kdt/P/KHI', 'pic_449.jpg', 0.0, '08:00', 'publicTransportation', '', 'Aina\'s Space Condominium', '1226', 'J. Barlin Street', '', 'Barangay 465', 'Sampaloc, City of Manila', 'NCR, First District', 1015, 'DE1', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(169, 450, 'CASEM_KIMBERLY', 'Casem', 'Kimberly', 'Kim', 'kimmy', 'PIP', '', 'DE1', '1995-04-19', 'F', 'Single', '2019-07-01', 'casem-kdt/P/KHI', 'pic_450.jpg', 0.0, '06:30', 'publicTransportation', '', 'Crestly Bldg.', '37', 'Perla St.', '', 'Barangay 8', 'Pasay City', 'NCR, Fourth District', 1300, 'DE1', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(170, 451, 'GUIAO _NEIL STEPHEN ', 'Guiao ', 'Neil Stephen ', 'Neil', 'guiao', 'PIP', '', 'ADE', '1995-10-22', 'M', 'Single', '2019-07-01', 'guiao-kdt/P/KHI', 'pic_451.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'ADE', 'PIP', '0', '2022-03-31', '', 0, '2022-03-23', 0, 0, 0, 0),
(171, 452, 'NIGOS_SCOTTEE JAIRUS', 'Nigos', 'Scottee Jairus', 'Scottee', 'scotty', 'ANA', 'ANA/DXT', 'DE1', '1997-10-28', 'M', 'Single', '2019-07-01', 'nigos-kdt/P/KHI', 'pic_452.jpg', 0.0, '07:30', 'publicTransportation', '', '14E San Lorenzo Place', 'Tower 3', 'Chino Roces Ave., EDSA Cor.', 'NA', 'Bangkal', 'City of Makati', 'NCR, Fourth District', 1233, 'DE1', 'ANA', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(172, 454, 'ARMAS_KENN JOHN', 'Armas', 'Kenn John', 'Ken', 'armas', 'BOI', '', 'DE1', '1994-06-01', 'M', 'Single', '2019-07-01', 'armas-kdt/P/KHI', 'pic_454.jpg', 0.0, '08:00', 'publicTransportation', '', 'PNR Dorm', '-', 'Gen San Miguel St.', 'Sangandaan', 'Barangay 5', 'City of Caloocan', 'NCR, Third District', 1408, 'DE1', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(173, 455, 'MANALO_VINCEN', 'Manalo', 'Vincen', 'Vincen', 'vincen', 'ENV', '', 'DE1', '1996-06-01', 'M', 'Single', '2019-07-01', 'manalo_v-kdt/P/KHI', 'pic_455.jpg', 0.9, '06:30', 'publicTransportation', '', '308 Studio A Residences', '', 'Mariveles Street', '', 'Highway Hills', 'City of Mandaluyong', 'NCR, Second District', 1550, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(174, 456, 'RIVERA_MAX VINCENT', 'Rivera', 'Max Vincent', 'Max', 'maxxs', 'ENV', '', 'DE1', '1995-05-14', 'M', 'Single', '2019-07-01', 'rivera_m-kdt/P/KHI', 'pic_456.jpg', 0.0, '08:00', 'motorCycle', '', '', '214', 'Santan St.', '', 'Wawa', 'City of Taguig', 'NCR, Fourth District', 1636, 'DE1', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(175, 459, 'CUTARAN_RENNEL MAE', 'Cutaran', 'Rennel Mae', 'Rennel', 'rennel', 'ENV', '', 'ADE', '1997-12-11', 'F', 'Single', '2021-07-12', 'cutaran-kdt/P/KHI', 'pic_459.jpg', 0.0, '07:00', 'carpool', 'Joseph Michael Macalalad', 'Bautista Pad', 'Lot 28 Blk 13', 'Cordillera St.', '', 'Pinagsama', 'City of Taguig', 'NCR, Fourth District', 1630, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(176, 460, 'BERONGOY_EURJHON', 'Berongoy', 'Eurjhon', 'Eur', 'eurjhon', 'ENV', '', 'ADE', '1998-08-19', 'M', 'Single', '2021-07-12', 'berongoy-kdt/P/KHI', 'pic_460.jpg', 0.0, '06:00', 'carpool', 'Lorenzo Diaz', '481', '', 'F. Legaspi', '', 'Maybunga', 'City of Pasig', 'NCR, Second District', 1607, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(177, 461, 'BAYQUEN_Hannah Millace', 'Bayquen', 'Hannah Millace', 'Hannah', 'bayquen-kdt', 'ENV', '', 'ADE', '1997-05-20', 'F', 'Single', '2021-07-12', 'bayquen-kdt/P/KHI', 'pic_461.jpg', 0.0, '07:00', 'publicTransportation', '', '', 'Solano Hills', 'Villonco St.', '', 'Sucat', 'City of Muntinlupa', 'NCR, Fourth District', 1770, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(178, 462, 'SANTOS_LUIZE NICOLE', 'Santos', 'Luize Nicole', 'Lui', 'luize', 'ENV', '', 'ADE', '1998-10-08', 'M', 'Single', '2021-07-12', 'santos-kdt/P/KHI', 'pic_462.jpg', 0.0, '06:00', 'publicTransportation', '', '', 'A-55', 'Ramos Village', '', 'Manggahan', 'City of Pasig', 'NCR, Second District', 1611, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(179, 463, 'REYES_RIZCHELLE', 'Reyes', 'Rizchelle', 'Riz', 'riz', 'ENV', '', 'ADE', '1999-11-14', 'F', 'Single', '2021-07-12', 'reyes_r-kdt/P/KHI', 'pic_463.jpg', 0.0, '06:00', 'publicTransportation', '', 'NA', '519', 'Vergel St.', 'NA', 'Barangay 113', 'Pasay City', 'NCR, Fourth District', 1300, 'ADE', 'ENV', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(180, 464, 'COQUIA_Joshua Mari', 'Coquia', 'Joshua Mari', 'Joshua', 'coquia-kdt', 'SYS', 'SYS/ENV/EE/IT', 'ASE', '1999-08-15', 'M', 'Single', '2021-07-12', 'coquia-kdt/P/KHI', 'pic_464.jpg', 0.0, '06:00', 'publicTransportation', '', '', '79-G', '15th Avenue', '', 'Socorro', 'Quezon City', 'NCR, Second District', 1109, 'ASE', 'SYS', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 1),
(181, 465, 'PETATE_Felix Edwin', 'Petate', 'Felix Edwin', 'Felix', 'petate-kdt', 'SYS', 'SYS/ENV/EE/IT', 'SE1', '1992-03-14', 'M', 'Single', '2021-07-12', 'petate-kdt/P/KHI', 'pic_465.jpg', 5.7, '06:00', 'publicTransportation', '', '', '1840 J', 'Champaca St.', 'Kahilum 1', 'Barangay 870', 'Pandacan, City of Manila', 'NCR, First District', 1011, 'SE1', 'SYS', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 1, 4, 1, 1),
(182, 466, 'AGANAN_Alvin John', 'Aganan', 'Alvin John', 'Alvin', 'aganan-kdt', 'SYS', '', 'ASE', '1998-07-28', 'M', 'Single', '2021-07-12', 'aganan-kdt/P/KHI', 'pic_466.jpg', 0.4, '08:00', 'motorCycle', '', 'Unit P', '43', 'Mindanao Avenue', 'N/A', 'Bagong Pag-asa', 'Quezon City', 'NCR, Second District', 1128, 'ASE', 'SYS', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(183, 467, 'CAMUNGGOL_ALDRIN JERICK', 'Camunggol', 'Aldrin Jerick', 'Aldrin', 'aldrin', 'BOI', '', 'ADE', '1999-04-01', 'M', 'Single', '2021-07-12', 'camunggol-kdt/P/KHI', 'pic_467.jpg', 0.3, '06:00', 'publicTransportation', '', '', '620', 'Gamban', '', 'Barangay 138', 'Pasay City', 'NCR, Fourth District', 1300, 'ADE', 'BOI', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(184, 468, 'GAMEZ_AARON GODFREY', 'Gamez', 'Aaron Godfrey', 'Ron', 'aarongamez', 'MIL', '', 'ADE', '1998-08-08', 'M', 'Single', '2021-07-12', 'gamez-kdt/P/KHI', 'pic_468.jpg', 0.0, '07:30', 'publicTransportation', '', '', '2086', 'Capt. M. Reyes', '', 'Pio Del Pilar', 'City of Makati', 'NCR, Fourth District', 1230, 'ADE', 'MIL', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(185, 10008, 'CHIBA_TATSUROU', 'Chiba', 'Tatsurou', '', 'chiba_ta', '-', '', 'ADE', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10008.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'ADE', '-', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(186, 10018, 'UENO_RYOSUKE', 'Ueno', 'Ryosuke', '', 'ueno_r', '-', '', 'DM', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10018.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'DM', '-', '1', '2022-03-31', '', 1, NULL, 0, 4, 1, 0),
(187, 10035, 'IWAMURA_MUNECHIYO', 'Iwamura', 'Munechiyo', '', 'iwamura_m', '-', '', 'SV', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10035.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'SV', '-', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(188, 446, 'PRESIDENT_KDT', 'President', 'Kdt', '', 'president', 'ADM', '', 'KDTP', '1965-11-25', 'M', 'Single', '0000-00-00', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 0.0, '07:30', 'Tony', '07:15/16:30', 'SixSenses Residence', '6H, Tower 2', 'Diosdado Macapagal Blvd', '-', 'Barangay 76', 'Pasay City', 'NCR, Fourth District', 1300, 'KDTP', 'ADM', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(189, 446, 'PRESIDENT_KDT', 'President', 'Kdt', '', 'kdtpresident', 'ADM', '', 'KDTP', '1965-11-25', 'M', 'Single', '0000-00-00', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 0.0, '07:30', 'Tony', '07:15/16:30', 'SixSenses Residence', '6H, Tower 2', 'Diosdado Macapagal Blvd', '-', 'Barangay 76', 'Pasay City', 'NCR, Fourth District', 1300, 'KDTP', 'ADM', '1', '2022-03-31', '', 1, NULL, 1, 4, 1, 0),
(190, 30001, 'Yonezawa_', 'Yonezawa', '', '', 'yonezawa-bnc', 'KHI-ITS', '', '-', '0000-00-00', 'M', '-', '0000-00-00', '-', '-', 0.0, '', '', '', '', '', '', '', '', '', '', 0, '-', 'KHI-ITS', '1', '2022-03-31', '', 1, NULL, 0, 0, 0, 0),
(192, 20002, 'AMPIG_Rommel', 'Ampig', 'Rommel', 'Rommel', 'rommel', 'MIL', 'MIL/CEM/MPM/ETCL', 'CTE', '1972-01-15', 'M', 'Married', '2022-04-01', 'ampig-kdt/P/KHI', 'pic_2002.jpg', 24.2, '08:00', 'publicTransportation', '', '', 'Blk 21 Lot 5', '', 'Crystal East Valley', 'Mambog', 'Binangonan', 'Rizal', 1940, 'CTE', 'MIL', '1', '2022-04-19', 'Ernesto Veloso', 1, NULL, 1, 3, 0, 0),
(193, 20001, 'LAUREANO_Antonio', 'Laureano', 'Antonio', 'Toni', 'toni', 'ADM', '', 'CSAD', '1956-07-05', 'M', 'Married', '2021-07-01', 'laureano-kdt/P/KHI', 'pic_2001.jpg', 32.2, '07:00', 'Rick', '06:00/16:00', '-', '13 ', 'P. GABRIEL', '-', 'San Jose (Pob.)', 'City of Navotas', 'NCR, Third District', 1409, 'CSAD', 'ADM', '1', '2022-04-19', 'Ernesto Veloso', 1, NULL, 1, 4, 1, 0),
(194, 469, 'Arabilla Jr._Joel', 'Arabilla Jr.', 'Joel', 'joel', 'joelarabilla', 'MIL', '', 'ADE', '1999-08-12', 'M', 'Single', '2022-07-01', 'arabilla-kdt/P/KHI', 'pic_469.jpg', 0.0, '07:00', 'publicTransportation', '', '', '840', 'Oroquieta', '', 'Barangay 310', 'Santa Cruz, City of Manila', 'NCR, First District', 1014, 'PDE', 'MIL', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(195, 470, 'Leguin_Aries', 'Leguin', 'Aries', 'Aries', 'ariesleguin', 'MHAH', '', 'ADE', '1999-05-11', 'M', 'Single', '2022-07-01', 'leguin-kdt/P/KHI', 'pic_470.jpg', 1.0, '07:00', 'publicTransportation', '', '2647-B', 'N/A', 'Cabrera', 'N/A', 'Barangay 1117', 'Pasay City', 'NCR, Fourth District', 0, 'PDE', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(196, 471, 'Chavez_Mark Rian', 'Chavez', 'Mark Rian', 'Mark Rian', 'markrian', 'PIP', '', 'ADE', '1997-09-15', 'M', 'Single', '2022-07-01', 'chavez-kdt/P/KHI', 'pic_471.jpg', 0.0, '07:00', 'publicTransportation', '', '810 & Lindonburg Residences', '691', 'M.V. Delos Santos', '', 'Barangay 400', 'Sampaloc, City of Manila', 'NCR, First District', 1008, 'PDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(197, 472, 'Lazaro_Nelson', 'Lazaro', 'Nelson', 'nelson', 'nelson', 'CEM', '', 'ADE', '1993-07-14', 'M', 'Single', '2022-07-01', 'lazaro_n-kdt/P/KHI', 'pic_472.jpg', 0.0, '07:00', 'publicTransportation', '', 'N/A', '27', 'BUENAVENTURA', 'N/A', 'Tangos North', 'City of Navotas', 'NCR, Third District', 1489, 'PDE', 'CEM', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(198, 473, 'Domaoal_Kenneth', 'Domaoal', 'Kenneth', 'Kenneth', 'kennethdomaoal', 'ENV', '', 'ADE', '1998-07-28', 'M', 'Single', '2022-07-01', 'domaoal-kdt/P/KHI', 'pic_473.jpg', 0.7, '07:00', 'publicTransportation', '', '', '1901 K Interior 29', 'Zamora St', '', 'Barangay 842', 'Pandacan, City of Manila', 'NCR, First District', 1011, 'PDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(199, 474, 'Segovia_Nicole Alysson', 'Segovia', 'Nicole Alysson', 'Nicole ', 'nicole', 'ENV', '', 'ADE', '1996-01-23', 'F', 'Single', '2022-07-01', 'segovia-kdt/P/KHI', 'pic_474.jpg', 2.3, '07:00', 'publicTransportation', '', '1821 Cityland MET II', '', 'Cor. Dela Rosa St.', '', 'Pio Del Pilar', 'City of Makati', 'NCR, Fourth District', 1230, 'PDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(200, 475, 'Del Rosario_Jay-R', 'Del Rosario', 'Jay-R', 'Jay-R', 'jayr', 'PIP', '', 'ADE', '1999-04-27', 'M', 'Single', '2022-07-01', 'delrosario-kdt/P/KHI', 'pic_475.jpg', 0.0, '07:00', 'motorCycle', '', '617', '', ' FLEXIHOMES', 'BLISS', 'Rosario', 'City of Pasig', 'NCR, Second District', 1609, 'PDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(201, 486, 'Maximo_Carl Rey', 'Maximo', 'Carl Rey', 'Carl Rey', 'carlrey', 'CHE', '', 'ADE', '1994-11-16', 'M', 'Single', '2022-07-01', 'maximo-kdt/P/KHI', 'pic_486.jpg', 0.0, '06:30', 'publicTransportation', '', '', 'Blk-139 Lot12', 'Rajah Sumakwel', '', 'Upper Bicutan', 'City of Taguig', 'NCR, Fourth District', 1633, 'PDE', 'CHE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(202, 477, 'Callanta_Von Joemar', 'Callanta', 'Von Joemar', 'Von Joemar', 'vonjoemar', 'PIP', '', 'ADE', '1997-07-12', 'M', 'Single', '2022-07-01', 'callanta-kdt/P/KHI', 'pic_477.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', 0, 'PDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(203, 478, 'Bamba_Angelo Justin', 'Bamba', 'Angelo Justin', 'Angelo Justin', 'angelobamba', 'MHAH', '', 'ADE', '1996-09-27', 'M', 'Single', '2022-07-01', 'bamba-kdt/P/KHI', 'pic_478.jpg', 0.2, '07:00', 'publicTransportation', '', '', '46', 'Senegal', 'Greenheights Phase 3', 'Nangka', 'City of Marikina', 'NCR, Second District', 1808, 'PDE', 'MHAH', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(204, 479, 'Abella_Sean Vinze', 'Abella', 'Sean Vinze', 'Sean Vinze', 'seanvinze', 'ENV', '', 'ADE', '1998-12-03', 'M', 'Single', '2022-07-01', 'abella-kdt/P/KHI', 'pic_479.jpg', 0.0, '07:00', 'publicTransportation', '', '', '', '', '', 'Malibay', 'Pasay City', 'NCR, Fourth District', 1300, 'PDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(205, 480, 'Tamayo_Christian Mari', 'Tamayo', 'Christian Mari', 'Christian Mari', 'christianmari', 'BOI', '', 'ADE', '1998-12-29', 'M', 'Single', '2022-07-01', 'tamayo-kdt/P/KHI', 'pic_480.jpg', 0.0, '06:30', 'publicTransportation', '', '', '18', 'Sampaguita A', 'Sun Valley', 'Barangay 197', 'Pasay City', 'NCR, Fourth District', 1301, 'PDE', 'BOI', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(206, 481, 'Tan Pian_John Meynard', 'Tan Pian', 'John Meynard', 'John Meynard', 'johnmeynard', 'ENV', '', 'ADE', '1998-10-05', 'M', 'Single', '2022-07-01', 'tanpian-kdt/P/KHI', 'pic_481.jpg', 0.0, '07:00', 'publicTransportation', '', '105b', 'zone 7', 'samson road', 'na', 'Barangay 73', 'City of Caloocan', 'NCR, Third District', 1421, 'PDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(207, 482, 'Ramirez_Xavier Dwight', 'Ramirez', 'Xavier Dwight', 'Xavier Dwight', 'xavierdwight', 'PIP', '', 'ADE', '1998-12-17', 'M', 'Single', '2022-07-01', 'ramirez-kdt/P/KHI', 'pic_482.jpg', 0.0, '06:00', 'publicTransportation', '', '1754', 'B.', 'Perfecto', '', 'Barangay 53', 'Tondo I/II, City of Manila', 'NCR, First District', 1012, 'PDE', 'PIP', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(208, 483, 'Bautista_Anne Wilyn', 'Bautista', 'Anne Wilyn', 'Anne Wilyn', 'annewilyn', 'ENV', '', 'ADE', '1998-12-17', 'F', 'Single', '2022-07-01', 'bautista_anne-kdt/P/KHI', 'pic_483.jpg', 0.0, '07:00', 'publicTransportation', '', '', '2647-B', 'Cabrera Street', '', 'Barangay 117', 'Pasay City', 'NCR, Fourth District', 1300, 'PDE', 'ENV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(209, 484, 'Jonson_Edgar Joseph', 'Jonson', 'Edgar Joseph', 'Edgar', 'edgar', 'EE', '', 'ADE', '1997-08-31', 'M', 'Single', '2022-07-01', 'jonson-kdt/P/KHI', 'pic_484.jpg', 0.0, '07:00', 'publicTransportation', '', '', '137', '3RD STREET', '', 'Barangay 111', 'City of Caloocan', 'NCR, Third District', 1400, 'PDE', 'EE', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(210, 485, 'Pangilinan_Seanne Kyle', 'Pangilinan', 'Seanne Kyle', 'Seanne Kyle', 'seannekyle', 'CIV', '', 'ADE', '1999-09-09', 'M', 'Single', '2022-07-01', 'pangilinan-kdt/P/KHI', 'pic_485.jpg', 0.0, '07:00', 'publicTransportation', '', '559A', '559A', 'Vicente Cruz', '', 'Barangay 448', 'Sampaloc, City of Manila', 'NCR, First District', 1008, 'PDE', 'CIV', '1', '2022-07-27', 'Erwin Tan', 1, NULL, 0, 0, 0, 0),
(211, 487, 'MEDRANO_Collene Keith', 'Medrano', 'Collene Keith', 'Collene', 'medrano_c-kdt', 'SYS', 'SYS/ENV/EE/IT', 'ASE', '1999-01-13', 'F', 'Single', '2022-08-15', 'medrano_c-kdt/P/KHI', 'pic_487.jpg', 0.0, '06:00', 'publicTransportation', '', '', '14', 'San Juan', '', 'Gulod', 'Quezon City', 'NCR, Second District', 1117, '', '', '', NULL, '', 1, NULL, 1, 4, 1, 1),
(212, 488, 'Gulam_Glenda Ann', 'Gulam', 'Glenda Ann', 'Glenda', 'Glenda', 'SYS', '', 'PSE', '2000-03-27', 'F', 'Single', '2022-08-15', 'gulam-kdt/P/KHI', 'pic_488.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, '', 0, '2023-01-31', 0, 0, 0, 0),
(213, 489, 'Fortus_Domini', 'Fortus', 'Domini', 'domini', 'domini', 'MHAH', '', 'DE2', '1993-07-12', 'M', 'Single', '2023-01-16', 'fortus_d-kdt/P/KHI', 'pic_489.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(214, 490, 'Usal_Ryan Christopher', 'Usal', 'Ryan Christopher', 'Ryan', 'usal-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'usal-kdt/P/KHI', 'pic_490.jpg', 0.0, '07:00', 'publicTransportation', '', '', '121 Int 1', 'Loreto St.', '', 'Barangay 419', 'Sampaloc, City of Manila', 'NCR, First District', 1008, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(215, 491, 'Villamil_Ronald Louie', 'Villamil', 'Ronald Louie', 'Ronal', 'villamil-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'villamil-kdt/P/KHI', 'pic_491.jpg', 0.0, '07:00', 'publicTransportation', '', '', '7567', 'J. de leon ', '', 'San Dionisio', 'City of Parañaque', 'NCR, Fourth District', 1700, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(216, 492, 'Villaruel_Jayron', 'Villaruel', 'Jayron', 'Jayron', 'villaruel-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'villaruel-kdt/P/KHI', 'pic_492.jpg', 0.0, '07:00', 'publicTransportation', '', '', 'Lot 1 block 11', '', 'Dreamland', 'Hagonoy', 'City of Taguig', 'NCR, Fourth District', 1630, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(217, 493, 'Bedonia_Bryan James', 'Bedonia', 'Bryan James', 'Bryan', 'bedonia-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'bedonia-kdt/P/KHI', 'pic_493.jpg', 0.0, '07:00', 'publicTransportation', '', '', 'Block 3 Lot 31', '', 'ACM Phase 9', 'Alapan I-A', 'City of Imus', 'Cavite', 4103, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(218, 494, 'Montaniel_John Carlos', 'Montaniel', 'John Carlos', 'John ', 'montaniel-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'montaniel-kdt/P/KHI', 'pic_494.jpg', 0.0, '07:00', 'publicTransportation', '', '', '2126', 'San Andres Ext.', '', 'Barangay 780', 'Santa Ana, City of Manila', 'NCR, First District', 1009, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(219, 495, 'RODRIGUEZ_Nicole', 'Rodriguez', 'Nicole', 'Nicole', 'rodriguez-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'F', 'Single', '2023-03-01', 'rodriguez-kdt/P/KHI', 'pic_495.jpg', 0.0, '07:00', 'publicTransportation', '', '', '1744', 'E.Jorge ', '', 'Barangay 898', 'Santa Ana, City of Manila', 'NCR, First District', 1009, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(220, 496, 'Tana_Marc Jullian', 'Tana', 'Marc Jullian', 'Marc', 'tana-kdt', 'MHAH', '', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'tana-kdt/P/KHI', 'pic_496.jpg', 0.0, '07:00', 'motorCycle', '', '', '118-A', '13TH AVENUE', '', 'Socorro', 'Quezon City', 'NCR, Second District', 1109, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0),
(223, 20003, 'CAVEIRO_Vincent', 'Caveiro', 'Vincent', 'Vince', 'caveiro-kdt', 'PIP', '', 'CSE', '1986-01-02', 'M', 'Married', '2023-04-01', 'caveiro-kdt/P/KHI', 'pic_20003.jpg', 0.0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, '', 1, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `ID` int(11) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `CategoryType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`ID`, `CategoryName`, `CategoryType`) VALUES
(1, 'Cement Plant', 'Plant'),
(2, 'Chemical Plant', 'Plant'),
(3, 'FGD Plant', 'Plant'),
(4, 'Oil and Gas', 'Plant'),
(5, 'Power Plant', 'Plant'),
(6, 'ANSHUN POWER PLANT', 'Project'),
(7, 'ANTAM LINE 4', 'Project'),
(8, 'ANTAM Fe-Ni Smelting Project', 'Project'),
(9, 'Butson Cement Plant', 'Project'),
(10, 'CAM PH', 'Project'),
(11, 'Dingzhou Power Plant FGD', 'Project'),
(12, 'Fatima (MFC)', 'Project'),
(13, 'FATIMA 327B62T1', 'Project'),
(14, 'Fe-Ni Smelting Plant', 'Project'),
(15, 'FGD-NEDO ORIGINAL', 'Project'),
(16, 'HALMAHERA', 'Project'),
(17, 'HPA-AN Coal Conversion', 'Project'),
(18, 'Ichthys LNG', 'Project'),
(19, 'KOBE 11', 'Project'),
(20, 'KOMATSU', 'Project'),
(21, 'MCFPP Mindanao Project', 'Project'),
(22, 'MeOH Feed', 'Project'),
(23, 'NIttetsu-Sumikin Cement', 'Project'),
(24, 'NZ UREA', 'Project'),
(25, 'P-11 CEMENT PLANT', 'Project'),
(26, 'SAUDI FGD PLANT(MHI)', 'Project'),
(27, 'SNNC II', 'Project'),
(28, 'SNNC Fe-Ni Smelting Plant (2007)', 'Project'),
(29, 'SNNC Smelting Plant (2006)', 'Project'),
(30, 'Souryu Cement', 'Project'),
(31, 'Sukagawa Project', 'Project'),
(32, 'Taiheiyo', 'Project'),
(33, 'TETOUAN Extension Plant', 'Project'),
(34, 'Thai Binh FGD', 'Project'),
(35, 'Turkmenistan GTG', 'Project'),
(36, 'Turkmenistan in Mary', 'Project'),
(37, 'TURKMENISTAN CEMENT PLANT', 'Project'),
(38, 'Uong Bi FGD Plant', 'Project');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_groups`
--

CREATE TABLE `tbl_groups` (
  `ID` int(11) NOT NULL,
  `GroupCode` varchar(15) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_groups`
--

INSERT INTO `tbl_groups` (`ID`, `GroupCode`, `GroupName`, `Status`) VALUES
(1, 'ACT', 'Accounting Group', 'Active'),
(2, 'ADM', 'Admin Group', 'Active'),
(3, 'ANA', 'Analysis Group', 'Active'),
(4, 'ASH', 'Ash Handling Group', 'Active'),
(5, 'CHE', 'Chemical Group', 'Active'),
(6, 'CIV', 'Civil Group', 'Active'),
(7, 'CM', 'Cement Group', 'Active'),
(8, 'CRY', 'Cryogenic Group', 'Active'),
(9, 'ECS', 'Electrical Control System', 'Active'),
(10, 'EE1', 'Electrical Engineering 1 ', 'Active'),
(11, 'EE2', 'Electrical Engineering 2', 'Active'),
(12, 'ENE', 'Energy Group', 'Active'),
(13, 'ENV', 'Environmental Group', 'Active'),
(14, 'ETCL', 'EarthTechnica Co., Ltd. Group', 'Active'),
(15, 'IT', 'IT Group', 'Active'),
(16, 'MCH', 'Machinery Group', 'Active'),
(17, 'MH', 'Material Handling Group', 'Active'),
(18, 'MIL', 'Mill Group', 'Active'),
(19, 'MNG', 'Managerial Group', 'Active'),
(20, 'PIP', 'Piping Group', 'Active'),
(21, 'SYS', 'Systems Group', 'Active'),
(22, 'TEG', 'Tunneling Equipment Group', 'Active'),
(23, 'SHI', 'Ship Group', 'Active'),
(24, 'EE', 'Electrical Engineering Group', 'Active'),
(25, 'INT', 'Inventor Team', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tags`
--

CREATE TABLE `tbl_tags` (
  `ID` int(11) NOT NULL,
  `TagName` varchar(255) DEFAULT NULL,
  `TagType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tags`
--

INSERT INTO `tbl_tags` (`ID`, `TagName`, `TagType`) VALUES
(1, 'Coriolis Flowmeter', NULL),
(2, 'Diff. Press.Transmitter  (Capilary tube)', NULL),
(3, 'Differential Pressure Transmitter', NULL),
(4, 'Displacer Type Level Instrument (Servo Type)', NULL),
(5, 'Flow Nozzle', NULL),
(6, 'Gas Analyzer', NULL),
(7, 'Gas Analyzer Density Meter', NULL),
(8, 'Gas Analyzer Infrared and TCD', NULL),
(9, 'Gas Analyzer Paramagnetic Oxygen', NULL),
(10, 'Gas Chromatograph', NULL),
(11, 'Gas Detector (Diffusion Type)', NULL),
(12, 'Hydrastep Level Meter', NULL),
(13, 'Infrared Analyzer', NULL),
(14, 'Interface Level Meter Gauge', NULL),
(15, 'Interface Level Meter Transmitter', NULL),
(16, 'K Thermocouple & Transmitter (Head Mounted)', NULL),
(17, 'K Thermocouple & Transmitter (Multi Point)', NULL),
(18, 'K Thermocouple & Transmitter (Remote)', NULL),
(19, 'Level Gauge', NULL),
(20, 'Liquid Analyzer Conductivity meter', NULL),
(21, 'Liquid Analyzer pH meter', NULL),
(22, 'Local Elect Receiver Indicator', NULL),
(23, 'N Thermocouple & Transmitter (Head Mounted)', NULL),
(24, 'N Thermocouple & Transmitter (Remote)', NULL),
(25, 'Orifice', NULL),
(26, 'Pressure Gauge', NULL),
(27, 'Pressure Switch', NULL),
(28, 'Pressure Transmitter', NULL),
(29, 'Pressure Transmitter (Capilary tube)', NULL),
(30, 'Radar Type Level Instrument', NULL),
(31, 'Temperature Gauge', NULL),
(32, 'Temperature Sensor (Infrared Television System)', NULL),
(33, 'Ultrasonic Flowmeter (Gas)', NULL),
(34, 'Ultrasonic Flowmeter (Liquid)', NULL),
(35, 'Variable Area Flowmeter', NULL),
(36, 'Venturi Tube', NULL),
(37, 'Vortex Flowmeter', NULL),
(38, 'Zirconia Oxygen', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uploads`
--

CREATE TABLE `tbl_uploads` (
  `ID` int(11) NOT NULL,
  `FileName` varchar(100) DEFAULT NULL,
  `FileNameDB` varchar(50) DEFAULT NULL,
  `DateUploaded` date DEFAULT NULL,
  `DateCaptured` datetime DEFAULT NULL,
  `Uploader` varchar(20) DEFAULT NULL,
  `FileType` varchar(10) DEFAULT NULL,
  `FileSize` int(11) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `Tags` varchar(1000) DEFAULT NULL,
  `Categories` varchar(500) DEFAULT NULL,
  `PlantType` varchar(50) DEFAULT NULL,
  `ProjectName` varchar(200) DEFAULT NULL,
  `BusinessUnit` varchar(10) DEFAULT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  `forPhotoDB` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_uploads`
--

INSERT INTO `tbl_uploads` (`ID`, `FileName`, `FileNameDB`, `DateUploaded`, `DateCaptured`, `Uploader`, `FileType`, `FileSize`, `Status`, `Tags`, `Categories`, `PlantType`, `ProjectName`, `BusinessUnit`, `Notes`, `forPhotoDB`) VALUES
(1, '20190110_140525.jpg', '20230601_155523_5456_E466.jpg', '2023-06-01', '2019-01-10 14:05:25', 'alvinjohn', 'picture', 3535200, 'Approved', '[\"Coriolis Flowmeter\"]', NULL, 'not applicable', 'not applicable', 'ACT', '', 0),
(2, '20190110_141625.jpg', '20230601_155523_1848_E466.jpg', '2023-06-01', '2019-01-10 14:16:25', 'alvinjohn', 'picture', 4716455, 'Approved', '[\"Coriolis Flowmeter\"]', NULL, 'not applicable', 'not applicable', 'ACT', '', 0),
(3, '20190110_141702.jpg', '20230601_155523_1673_E466.jpg', '2023-06-01', '2019-01-10 14:17:02', 'alvinjohn', 'picture', 5144209, 'Approved', '[\"Coriolis Flowmeter\"]', NULL, 'not applicable', 'not applicable', 'ACT', '', 0),
(4, '20190111_103414.jpg', '20230601_155659_9064_E466.jpg', '2023-06-01', '2019-01-11 10:34:14', 'alvinjohn', 'picture', 3633868, 'Approved', '[\"Gas Analyzer Density Meter\",\"Liquid Analyzer Conductivity meter\"]', NULL, 'Oil and Gas', 'Dingzhou Power Plant FGD', 'ANA', '', 0),
(5, '20190111_104333.jpg', '20230601_155659_6197_E466.jpg', '2023-06-01', '2019-01-11 10:43:33', 'alvinjohn', 'picture', 3696047, 'Approved', '[\"Gas Analyzer Density Meter\"]', NULL, 'Oil and Gas', 'Dingzhou Power Plant FGD', 'ANA', '', 0),
(6, '20190111_104337.jpg', '20230601_155659_4515_E466.jpg', '2023-06-01', '2019-01-11 10:43:37', 'alvinjohn', 'picture', 3268760, 'Approved', '[\"N Thermocouple & Transmitter (Remote)\"]', NULL, 'Oil and Gas', 'Dingzhou Power Plant FGD', 'ANA', '', 0),
(7, '10_Photo Database with Translator Software(EE).pptx', '20230602_132001_8300_E466.pptx', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 5110060, 'Approved', '[\"Gas Analyzer Density Meter\"]', NULL, 'Chemical Plant', 'CAM PH', 'ADM', '', 0),
(8, 'aa.sql', '20230602_132001_6047_E466.sql', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'others', 1269657, 'Approved', '[\"Flow Nozzle\"]', NULL, 'Power Plant', 'Butson Cement Plant', 'CRY', '', 0),
(9, 'Cloud Nav.pdf', '20230602_132001_1311_E466.pdf', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 465737, 'Approved', '[\"Displacer Type Level Instrument (Servo Type)\"]', NULL, 'Chemical Plant', 'Fe-Ni Smelting Plant', 'CRY', '', 0),
(10, 'EDMon.gif', '20230602_132001_5396_E466.gif', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 598905, 'Approved', '[\"Displacer Type Level Instrument (Servo Type)\"]', NULL, 'FGD Plant', 'FATIMA 327B62T1', 'EE', '', 0),
(11, 'EDMon.mp4', '20230602_132001_6649_E466.mp4', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'video', 427694, 'Approved', '[\"Displacer Type Level Instrument (Servo Type)\"]', NULL, 'Power Plant', 'Butson Cement Plant', 'CIV', '', 0),
(12, 'flight group details.xlsx', '20230602_132001_2799_E466.xlsx', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 14686, 'Approved', '[\"Differential Pressure Transmitter\"]', NULL, 'FGD Plant', 'ANTAM LINE 4', 'ECS', '', 0),
(13, 'Data Privacy', '20230602_132001_9295_E466.pdf', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 1017112, 'Approved', '[\"Displacer Type Level Instrument (Servo Type)\"]', NULL, 'Cement Plant', 'Butson Cement Plant', 'CM', '', 0),
(14, 'sql.txt', '20230602_132001_7829_E466.txt', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 2079, 'Approved', '[\"Diff. Press.Transmitter  (Capilary tube)\"]', NULL, 'Chemical Plant', 'HALMAHERA', 'CRY', '', 0),
(15, 'SWIMS.docx', '20230602_132001_5947_E466.docx', '2023-06-02', '0000-00-00 00:00:00', 'alvinjohn', 'document', 11833, 'Approved', '[\"Displacer Type Level Instrument (Servo Type)\"]', NULL, 'FGD Plant', 'Fe-Ni Smelting Plant', 'ECS', '', 0),
(16, 'EDMon.mp4', '20230608_125143_7633_E466.mp4', '2023-06-08', '0000-00-00 00:00:00', 'alvinjohn', 'video', 427694, 'For Checking', '[\"Coriolis Flowmeter\"]', NULL, 'Chemical Plant', 'Dingzhou Power Plant FGD', 'CHE', '', 0),
(17, 'EDMon.mp4', '20230608_125156_4274_E466.mp4', '2023-06-08', '0000-00-00 00:00:00', 'alvinjohn', 'video', 427694, 'For Checking', '[\"Gas Analyzer Density Meter\"]', NULL, 'FGD Plant', 'FATIMA 327B62T1', 'ASH', '', 0),
(18, '10.png', '20230614_160506_7402_E466.png', '2023-06-14', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 37875, 'Approved', '[\"Flow Nozzle\"]', NULL, 'Cement Plant', 'Fatima (MFC)', 'CRY', '', 0),
(19, '12.jfif', '20230614_160604_5703_E466.jfif', '2023-06-14', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 13552, 'Approved', '[\"Gas Analyzer\"]', NULL, 'Power Plant', 'Fe-Ni Smelting Plant', 'ASH', '', 0),
(20, 'Number 10', '20230622_101015_7530_E466.png', '2023-06-22', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 37875, 'For Checking', '[\"Sample Tag\"]', NULL, 'Cement Plant', 'CAM PH', 'ACT', 'This is some notes', 0),
(21, '11.jfif', '20230622_101015_5395_E466.jfif', '2023-06-22', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 17144, 'Waiting to Tag', NULL, NULL, NULL, NULL, 'Group', NULL, 0),
(22, '12.jfif', '20230622_101015_3426_E466.jfif', '2023-06-22', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 13552, 'Waiting to Tag', NULL, NULL, NULL, NULL, 'Group', NULL, 0),
(23, '429131154_1074398667196067_3658350035400038295_n.jpg', '20240301_221332_8448_E466.jpg', '2024-03-01', '0000-00-00 00:00:00', 'alvinjohn', 'picture', 156479, 'Waiting to Tag', NULL, NULL, NULL, NULL, 'Group', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `ID` int(11) NOT NULL,
  `EmpID` int(11) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `NickName` varchar(20) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `KDTGroup` varchar(100) DEFAULT NULL,
  `Designation` varchar(20) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `MaritalStatus` varchar(15) DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  `EmailLotus` varchar(50) DEFAULT NULL,
  `Picture` varchar(50) DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Active',
  `DateResign` date DEFAULT NULL,
  `UserAccess` varchar(20) NOT NULL DEFAULT 'Tagger'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`ID`, `EmpID`, `LastName`, `FirstName`, `NickName`, `UserName`, `KDTGroup`, `Designation`, `BirthDate`, `Gender`, `MaritalStatus`, `DateHired`, `EmailLotus`, `Picture`, `Status`, `DateResign`, `UserAccess`) VALUES
(1, 7, 'Laureano', 'Antonio', 'Toni', 'toni1', 'ADM', 'CSAD', '1956-07-05', 'M', 'Married', '1989-05-11', 'laureano-kdt/P/KHI', 'pic_7.jpg', 'Resigned', '2021-07-01', 'Tagger'),
(2, 8, 'Panado', 'Evangeline', 'Van', 'van', 'ADM', 'DM', '1960-07-03', 'F', 'Married', '1990-06-11', 'panado-g1/P/KHI', 'pic_8.jpg', 'Active', NULL, 'Tagger'),
(3, 10, 'Tan', 'Erwin', 'TAN', 'khi', 'ANA/ADM/CIV/EE/PIP/IT/SYS/MNG/ETCL', 'SM', '1965-12-20', 'M', 'Married', '1989-05-11', 'tan-g1/P/KHI', 'pic_10.jpg', 'Active', NULL, 'Tagger'),
(4, 18, 'Matibag', 'Erwilson', 'Wilson', 'wilson', 'ANA/IT/SYS/MNG', 'DM', '1972-10-16', 'M', 'Married', '1995-06-01', 'matibag-kdt/P/KHI', 'pic_18.jpg', 'Active', NULL, 'Tagger'),
(5, 21, 'Santos', 'Roberto', 'Bert', 'kuyabert', 'ADM', 'MJ', '1962-10-14', 'M', 'Married', '1996-09-01', '', 'pic_21.jpg', 'Active', NULL, 'Tagger'),
(6, 25, 'Derigay', 'Oliver', 'Oliver', 'OLIVER', 'CHE/CRY/CEM/MIL/ETCL/MPM/MNG', 'DM', '1971-10-21', 'M', 'Married', '1997-01-06', 'derigay-g1/P/KHI', 'pic_25.jpg', 'Active', NULL, 'Tagger'),
(7, 30, 'Abuan', 'Christopher', 'Fher', 'fher', 'MHAH/MNG', 'DM', '1975-12-06', 'M', 'Married', '1997-01-09', 'abuan-kdt/P/KHI', 'pic_30.jpg', 'Active', NULL, 'Tagger'),
(8, 34, 'Corpuz', 'Antonio', 'Tony', 'bosstony', 'ADM', 'DR2', '1965-12-14', 'M', 'Married', '1997-02-01', '', 'pic_34.jpg', 'Active', NULL, 'Tagger'),
(9, 37, 'Llanes', 'Ferdinand', 'Ferdie', 'llanes', 'BOI/INT/MNG', 'DM', '1969-10-31', 'M', 'Married', '1997-08-15', 'llanes-kdt/P/KHI', 'pic_37.jpg', 'Active', NULL, 'Tagger'),
(10, 40, 'Cabello', 'Aristeo', 'Aris', 'aris', 'ENV/MNG', 'DM', '1976-01-24', 'M', 'Married', '1997-10-16', 'cabello-kdt/P/KHI', 'pic_40.jpg', 'Active', NULL, 'Tagger'),
(11, 43, 'Ampig', 'Rommel', 'Rommel', 'rommel1', 'MIL/CEM/MPM/ETCL', 'DM', '1972-01-15', 'M', 'Married', '1998-01-15', 'ampig-kdt/P/KHI', 'pic_43.jpg', 'Resigned', '2022-04-01', 'Tagger'),
(12, 55, 'Perez', 'April', 'April', 'april', 'ACT', 'SA', '1976-04-09', 'F', 'Single', '1998-03-23', 'perez-kdt/P/KHI', 'pic_55.jpg', 'Active', NULL, 'Tagger'),
(13, 61, 'Balisbis Jr.', 'Cezar', 'Czar', 'czar', 'ANA/SYS/IT', 'AM', '1974-09-18', 'M', 'Married', '1998-04-16', 'balisbis-kdt/P/KHI', 'pic_61.jpg', 'Active', NULL, 'Tagger'),
(14, 101, 'Soriano', 'Sharon Ann', 'Ann', 'soriano-kdt', 'ADM', 'ASS', '1976-12-12', 'F', 'Married', '2007-03-03', 'soriano-kdt/P/KHI', 'pic_101.jpg', 'Active', NULL, 'Tagger'),
(15, 104, 'Veloso', 'Ernesto', 'Lou', 'LOU', 'MNG/ENV/BOI', 'SM', '1967-03-24', 'M', 'Married', '2000-07-03', 'veloso-kdt/P/KHI', 'pic_104.jpg', 'Active', NULL, 'Tagger'),
(16, 107, 'Diaz', 'Lorenzo', 'Lorenz', 'etuc', 'CEM/ETCL/MPM/MIL', 'AM', '1974-11-06', 'M', 'Married', '2000-10-16', 'diaz-kdt/P/KHI', 'pic_107.jpg', 'Active', NULL, 'Tagger'),
(17, 117, 'Vitalicio', 'Mae Anne', 'Mae', 'vitalicio-kdt', 'ENV', 'AM', '1976-11-28', 'F', 'Single', '2002-07-01', 'vitalicio-kdt/P/KHI', 'pic_117.jpg', 'Active', NULL, 'Tagger'),
(18, 121, 'Derigay', 'Arlene', 'Arlene', 'arlene', 'ADM', 'AAR', '1977-11-20', 'F', 'Married', '2002-01-02', 'magno-kdt/P/KHI', 'pic_121.jpg', 'Active', NULL, 'Tagger'),
(19, 122, 'Fabia', 'Roderick', 'Rick', 'kuyarick', 'ADM', 'DR', '1970-03-08', 'M', 'Married', '2004-08-18', '', 'pic_122.jpg', 'Active', NULL, 'Tagger'),
(20, 134, 'Becina', 'Artemio Roel', 'Brix', 'brix', 'EE/CIV/PIP/DXT/MNG', 'DM', '1978-04-10', 'M', 'Married', '2002-09-02', 'becina-kdt/P/KHI', 'pic_134.jpg', 'Active', NULL, 'Tagger'),
(21, 145, 'Baradas', 'Ryan', 'Ryan', 'ryan', 'CRY', 'SSV', '1981-03-25', 'M', 'Married', '2005-04-18', 'baradas-kdt/P/KHI', 'pic_145.jpg', 'Active', NULL, 'Tagger'),
(22, 158, 'Valdez', 'Ramir', 'Ramir', 'ramir', 'EE/MNG', 'DM', '1965-11-25', 'M', 'Married', '2006-04-03', 'valdez-kdt/P/KHI', 'pic_158.jpg', 'Active', NULL, 'Tagger'),
(23, 172, 'Viray', 'Jermaine', 'Maine', 'maine', 'MHAH', 'SSV', '1982-09-20', 'F', 'Married', '2006-05-15', 'marasigan-kdt/P/KHI', 'pic_172.jpg', 'Resigned', '2022-12-31', 'Tagger'),
(24, 173, 'Aguilar', 'John Isaac', 'Ice', 'ice', 'EE', 'SSV', '1983-12-24', 'M', 'Married', '2006-05-22', 'aguilar-kdt/P/KHI', 'pic_173.jpg', 'Active', NULL, 'Tagger'),
(25, 174, 'Apostol', 'Roel Boy', 'Putol', 'roel', 'EE', 'SSV', '1983-06-20', 'M', 'Married', '2006-08-22', 'apostol-kdt/P/KHI', 'pic_174.jpg', 'Active', NULL, 'Tagger'),
(26, 185, 'De Jesus', 'Ryan', 'Ryan', 'ryanm', 'PIP', 'SSV', '1982-08-25', 'M', 'Married', '2006-11-16', 'dejesus-kdt/P/KHI', 'pic_185.jpg', 'Active', NULL, 'Tagger'),
(27, 194, 'Castuera', 'Maxwell', 'Max', 'max', 'MHAH', 'SSV', '1980-03-07', 'M', 'Single', '2007-01-02', 'castuera-kdt/P/KHI', 'pic_194.jpg', 'Active', NULL, 'Tagger'),
(28, 209, 'Leal Jr.', 'Ernesto', 'Leal', 'ernesto', 'CEM/ETCL/MPM', 'SSV', '1982-09-28', 'M', 'Married', '2007-03-01', 'leal-kdt/P/KHI', 'pic_209.jpg', 'Active', NULL, 'Tagger'),
(29, 212, 'Lazaro', 'Edmon', 'Mon', 'edmon', 'SYS', 'SSS', '1984-10-20', 'M', 'Married', '2007-03-21', 'lazaro-kdt/P/KHI', 'pic_212.jpg', 'Active', NULL, 'Tagger'),
(30, 215, 'Palmones', 'Michael', 'Mike', 'michaelp', 'CEM', 'SSV', '1979-12-12', 'M', 'Single', '2007-03-21', 'palmones-kdt/P/KHI', 'pic_215.jpg', 'Active', NULL, 'Tagger'),
(31, 221, 'Camato Jr.', 'Gerardo', 'Gerald', 'gerard', 'ENV', 'SSV', '1984-10-14', 'M', 'Married', '2007-05-16', 'camato-kdt/P/KHI', 'pic_221.jpg', 'Active', NULL, 'Tagger'),
(32, 222, 'Beltran', 'Jeffrey', 'Jeff', 'jeffrey', 'MIL', 'SSV', '1983-12-30', 'M', 'Single', '2007-05-16', 'beltran-kdt/P/KHI', 'pic_222.jpg', 'Active', NULL, 'Tagger'),
(33, 223, 'Pahel', 'Jobert', 'Jobs', 'jobert', 'MIL', 'SSV', '1982-08-21', 'M', 'Married', '2007-05-16', 'pahel-kdt/P/KHI', 'pic_223.jpg', 'Active', NULL, 'Tagger'),
(34, 224, 'Desoloc', 'Blessel', 'Bles', 'bles', 'ENV', 'SSV', '1985-03-29', 'F', 'Single', '2007-05-16', 'desoloc-kdt/P/KHI', 'pic_224.jpg', 'Active', NULL, 'Tagger'),
(35, 226, 'Gulapa', 'Francis Martee', 'Martee', 'martee', 'EE', 'SSV', '1985-01-23', 'M', 'Married', '2007-05-16', 'gulapa-kdt/P/KHI', 'pic_226.jpg', 'Active', NULL, 'Tagger'),
(36, 230, 'Oliveros', 'Mark Anthony', 'Mark', 'mark', 'MHAH', 'SV', '1983-04-16', 'M', 'Married', '2007-06-25', 'oliveros-kdt/P/KHI', 'pic_230.jpg', 'Active', NULL, 'Tagger'),
(37, 238, 'Sese', 'Joseph Ferdinand', 'Joseph', 'sese', 'ENV', 'SV', '1973-09-11', 'M', 'Married', '2007-08-16', 'sese-kdt/P/KHI', 'pic_238.jpg', 'Active', NULL, 'Tagger'),
(38, 240, 'Miranda', 'Christian Jay', 'Chris', 'christian', 'CEM', 'SV', '1983-08-25', 'M', 'Married', '2007-08-16', 'miranda-kdt/P/KHI', 'pic_240.jpg', 'Active', NULL, 'Tagger'),
(39, 243, 'Ramos', 'Sheena', 'Shin', 'sheena', 'ACT', 'SAA', '1985-09-03', 'F', 'Married', '2007-12-03', 'serdina-kdt/P/KHI', 'pic_243.jpg', 'Active', NULL, 'Tagger'),
(40, 252, 'Araneta', 'Rex', 'Rex', 'araneta-kdt', 'CIV', 'SSV', '1983-05-16', 'M', 'Married', '2008-05-19', 'araneta-kdt/P/KHI', 'pic_252.jpg', 'Active', NULL, 'Tagger'),
(41, 256, 'Sahagun', 'Michelle', 'Cheng', 'cheng', 'INT/CEM', 'SV', '1982-05-20', 'F', 'Married', '2010-03-01', 'canalda-kdt/P/KHI', 'pic_256.jpg', 'Resigned', '2022-12-31', 'Tagger'),
(42, 257, 'Onod', 'Abeel', 'Abel', 'abel', 'MIL', 'SV', '1986-07-07', 'M', 'Married', '2010-03-01', 'onod-kdt/P/KHI', 'pic_257.jpg', 'Resigned', '2023-03-15', 'Tagger'),
(43, 259, 'Lucena', 'Rey', 'Rey', 'rey', 'CEM', 'SV', '1987-05-04', 'M', 'Married', '2010-03-01', 'lucena-kdt/P/KHI', 'pic_259.jpg', 'Active', NULL, 'Tagger'),
(44, 260, 'Verano', 'Ronald', 'RV', 'rv', 'ETCL', 'SV', '1984-07-11', 'M', 'Married', '2010-03-01', 'verano-kdt/P/KHI', 'pic_260.jpg', 'Active', NULL, 'Tagger'),
(45, 261, 'Villamor', 'Amor', 'Amor', 'amor', 'CHE', 'SV', '1984-09-15', 'M', 'Married', '2010-03-01', 'villamor-kdt/P/KHI', 'pic_261.jpg', 'Active', NULL, 'Tagger'),
(46, 262, 'Cantara', 'Mark Joel', 'Joel', 'cantara', 'MHAH', 'SV', '1984-01-20', 'M', 'Single', '2010-03-01', 'cantara-kdt/P/KHI', 'pic_262.jpg', 'Active', NULL, 'Tagger'),
(47, 263, 'Pascua', 'Henry', 'Henry', 'henry', 'MHAH', 'SV', '1984-06-19', 'M', 'Married', '2010-03-01', 'pascua-kdt/P/KHI', 'pic_263.jpg', 'Active', NULL, 'Tagger'),
(48, 264, 'Cular', 'Giulian Louis', 'Louis', 'louis', 'CRY', 'SDE', '1986-06-21', 'M', 'Single', '2010-03-01', 'cular-kdt/P/KHI', 'pic_264.jpg', 'Active', NULL, 'Tagger'),
(49, 265, 'Onod', 'Amalia', 'Amie', 'amie', 'ENV', 'SDE', '1989-07-05', 'F', 'Married', '2010-03-01', 'nodalo-kdt/P/KHI', 'pic_265.jpg', 'Resigned', '2023-03-15', 'Tagger'),
(50, 268, 'Sandoval', 'Dan Christian', 'Dan', 'sandoval', 'PIP/DXT', 'SV', '1985-10-06', 'M', 'Single', '2010-06-01', 'sandoval-kdt/P/KHI', 'pic_268.jpg', 'Active', NULL, 'Tagger'),
(51, 270, 'Caringal', 'Gian Carlo', 'Carlo', 'carlo', 'PIP', 'SV', '1985-12-15', 'M', 'Married', '2010-06-01', 'caringal-kdt/P/KHI', 'pic_270.jpg', 'Active', NULL, 'Tagger'),
(52, 272, 'Caveiro', 'Vincent', 'Vince', 'vince_resigned', 'PIP', 'SV', '1986-01-02', 'M', 'Married', '2010-06-01', 'caveiro-resigned/P/KHI', 'pic_272.jpg', 'Resigned', '2023-03-31', 'Tagger'),
(53, 279, 'Panopio', 'Luisito', 'Louie', 'lpanopio', 'MHAH', 'SV', '1984-02-27', 'M', 'Single', '2010-06-16', 'panopio-kdt/P/KHI', 'pic_279.jpg', 'Active', NULL, 'Tagger'),
(54, 281, 'Cura', 'Leonard Ryan', 'Ryan', 'cura', 'CHE', 'SV', '1986-12-08', 'M', 'Married', '2010-06-16', 'cura-kdt/P/KHI', 'pic_281.jpg', 'Active', NULL, 'Tagger'),
(55, 283, 'Cenizal', 'Ma. Evangeline', 'Vangie', 'adami', 'EE', 'SV', '1986-10-22', 'F', 'Married', '2010-06-16', 'adami-kdt/P/KHI', 'pic_283.jpg', 'Active', NULL, 'Tagger'),
(56, 284, 'Cidro', 'James Eric', 'Jim', 'james', 'EE/DXT', 'SV', '1987-10-18', 'M', 'Married', '2010-06-16', 'cidro-kdt/P/KHI', 'pic_284.jpg', 'Active', NULL, 'Tagger'),
(57, 288, 'Godoy', 'Jhon Ray', 'Jhon', 'jhon', 'EE', 'SV', '1989-01-10', 'M', 'Married', '2011-01-03', 'godoy-kdt/P/KHI', 'pic_288.jpg', 'Active', NULL, 'Tagger'),
(58, 290, 'Ariap', 'Jomanil', 'Joma', 'joma', 'CRY', 'SDE', '1988-06-27', 'M', 'Single', '2011-01-03', 'ariap-kdt/P/KHI', 'pic_290.jpg', 'Active', NULL, 'Tagger'),
(59, 291, 'Llosala', 'Rowel', 'Wel', 'rowel', 'CHE', 'SV', '1988-02-26', 'M', 'Married', '2011-01-03', 'llosala-kdt/P/KHI', 'pic_291.jpg', 'Active', NULL, 'Tagger'),
(60, 293, 'Dimaapi', 'Jasper', 'Jasper', 'jasper', 'ETCL', 'SV', '1989-05-16', 'M', 'Single', '2011-01-03', 'dimaapi-kdt/P/KHI', 'pic_293.jpg', 'Active', NULL, 'Tagger'),
(61, 295, 'Moreno', 'Rex', 'Rex', 'moreno', 'MHAH', 'AM', '1981-03-27', 'M', 'Single', '2011-05-02', 'moreno-kdt/P/KHI', 'pic_295.jpg', 'Active', NULL, 'Tagger'),
(62, 296, 'Macalalad', 'Joseph Michael', 'Joseph', 'macalalad', 'ENV', 'AM', '1981-02-16', 'M', 'Married', '2011-05-02', 'macalalad-kdt/P/KHI', 'pic_296.jpg', 'Active', NULL, 'Tagger'),
(63, 299, 'Cano', 'Bryan Jay', 'Bryan', 'cano-kdt', 'BOI/INT', 'SV', '1988-08-12', 'M', 'Single', '2011-08-01', 'cano-kdt/P/KHI', 'pic_299.jpg', 'Active', NULL, 'Tagger'),
(64, 301, 'Lina', 'Dominador Joshua', 'Josh', 'lina-kdt', 'BOI/INT', 'SDE', '1989-07-03', 'M', 'Single', '2011-08-01', 'lina-kdt/P/KHI', 'pic_301.jpg', 'Active', NULL, 'Tagger'),
(65, 302, 'Sampaga', 'Louie', 'Louie', 'sampaga', 'EE/DXT', 'SDE', '1987-12-02', 'M', 'Married', '2012-01-16', 'sampaga-kdt/P/KHI', 'pic_302.jpg', 'Active', NULL, 'Tagger'),
(66, 304, 'Mundo', 'Daisy', 'Daisy', 'daisy', 'ENV/CHE', 'DE3', '1979-01-18', 'F', 'Single', '2012-01-16', 'mundo-kdt/P/KHI', 'pic_304.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(67, 305, 'Escueta', 'Roderick', 'Eric', 'roderick', 'PIP', 'SDE', '1981-02-09', 'M', 'Married', '2012-01-16', 'escueta-kdt/P/KHI', 'pic_305.jpg', 'Active', NULL, 'Tagger'),
(68, 306, 'Belen', 'Kervin', 'Kervin', 'kervin', 'PIP/DXT', 'SDE', '1988-07-23', 'M', 'Married', '2012-01-16', 'belen-kdt/P/KHI', 'pic_306.jpg', 'Active', NULL, 'Tagger'),
(69, 307, 'Ballon', 'Veronica', 'Vec', 'mendoza-kdt', 'IT', 'IT-SV', '1989-12-10', 'F', 'Married', '2012-05-07', 'mendoza-kdt/P/KHI', 'pic_307.jpg', 'Active', NULL, 'Tagger'),
(70, 310, 'Tumaob', 'Ferdinand', 'Tommy', 'tommy', 'MIL', 'SDE', '1984-12-18', 'M', 'Married', '2012-05-16', 'tumaob-kdt/P/KHI', 'pic_310.jpg', 'Active', NULL, 'Tagger'),
(71, 311, 'Penetrante Jr.', 'Jorge', 'JR', 'jorge', 'BOI', 'SV', '1986-10-28', 'M', 'Single', '2012-05-16', 'penetrante-kdt/P/KHI', 'pic_311.jpg', 'Active', NULL, 'Tagger'),
(72, 312, 'Lucas', 'Adelbert', 'Adel', 'adel', 'BOI', 'SDE', '1988-08-18', 'M', 'Single', '2012-05-16', 'lucas-kdt/P/KHI', 'pic_312.jpg', 'Active', NULL, 'Tagger'),
(73, 313, 'Agustines', 'Albert', 'Albert', 'albert', 'EE/DXT', 'SDE', '1987-07-24', 'M', 'Single', '2012-05-16', 'agustines-kdt/P/KHI', 'pic_313.jpg', 'Active', NULL, 'Tagger'),
(74, 314, 'Sangalang', 'Dickenson', 'Dick', 'dickenson', 'EE', 'SDE', '1983-11-17', 'M', 'Married', '2012-05-16', 'sangalang_d-kdt/P/KHI', 'pic_314.jpg', 'Active', NULL, 'Tagger'),
(75, 316, 'Bautista Jr.', 'Celso', 'Ceejay', 'cj', 'CEM', 'SDE', '1991-05-23', 'M', 'Single', '2013-02-16', 'bautista-kdt/P/KHI', 'pic_316.jpg', 'Active', NULL, 'Tagger'),
(76, 320, 'Escueta Jr.', 'Juanito', 'Jeck', 'jeckzay', 'EE', 'DE3', '1984-03-23', 'M', 'Married', '2013-02-16', 'escueta_j-kdt/P/KHI', 'pic_320.jpg', 'Active', NULL, 'Tagger'),
(77, 321, 'Bigtas', 'Keith Charm', 'Charm', 'charm', 'EE', 'DE3', '1985-03-26', 'F', 'Single', '2013-02-16', 'bigtas-kdt/P/KHI', 'pic_321.jpg', 'Active', NULL, 'Tagger'),
(78, 322, 'Dela Rosa', 'Ester', 'Tets', 'ester', 'EE', 'SDE', '1987-02-28', 'F', 'Single', '2013-02-16', 'delarosa-kdt/P/KHI', 'pic_322.jpg', 'Active', NULL, 'Tagger'),
(79, 323, 'Borlagon', 'Alvin Jan', 'Vin', 'vhin', 'BOI', 'SDE', '1990-01-29', 'M', 'Married', '2013-02-16', 'borlagon-kdt/P/KHI', 'pic_323.jpg', 'Active', NULL, 'Tagger'),
(80, 328, 'Calleja', 'Nomer', 'PIPOY', 'nomer', 'BOI', 'SDE', '1989-04-11', 'M', 'Married', '2013-05-02', 'calleja-kdt/P/KHI', 'pic_328.jpg', 'Active', NULL, 'Tagger'),
(81, 329, 'Marqueses', 'Jeff Edward', 'JEFF', 'je', 'BOI', 'SDE', '1988-11-01', 'M', 'Married', '2013-05-02', 'marqueses_j-kdt/P/KHI', 'pic_329.jpg', 'Active', NULL, 'Tagger'),
(82, 330, 'Omiz', 'Gilbert Jason', 'GILBERT', 'bert', 'PIP', 'SDE', '1991-04-03', 'M', 'Single', '2013-08-01', 'omiz-kdt/P/KHI', 'pic_330.jpg', 'Active', NULL, 'Tagger'),
(83, 332, 'De Guzman', 'Christopher', 'CHRIS', 'chrisdegz', 'ENV', 'SDE', '1990-09-22', 'M', 'Single', '2013-08-01', 'deguzman-kdt/P/KHI', 'pic_332.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(84, 333, 'Mataum', 'Michael', 'KEL', 'kel', 'PIP/DXT', 'SDE', '1989-06-30', 'M', 'Single', '2013-08-01', 'mataum-kdt/P/KHI', 'pic_333.jpg', 'Active', NULL, 'Tagger'),
(85, 334, 'Miranda', 'Julemir', 'JUN JUN', 'miranda_j-kdt', 'ENV', 'SDE', '1987-08-26', 'M', 'Single', '2013-08-01', 'miranda_j-kdt/P/KHI', 'pic_334.jpg', 'Active', NULL, 'Tagger'),
(86, 335, 'Ballon', 'Al John', 'AL JOHN', 'aljohn', 'MHAH', 'SDE', '1989-07-09', 'M', 'Married', '2013-08-01', 'ballon-kdt/P/KHI', 'pic_335.jpg', 'Active', NULL, 'Tagger'),
(87, 338, 'Bulan Jr.', 'Rosbelt', 'ROS', 'ross', 'ENV/DXT', 'SDE', '1990-03-14', 'M', 'Single', '2013-10-01', 'bulan-kdt/P/KHI', 'pic_338.jpg', 'Active', NULL, 'Tagger'),
(88, 344, 'Patron', 'Edilaine Marose', 'EM', 'em', 'CHE', 'DE3', '1992-01-24', 'F', 'Single', '2014-01-02', 'patron-kdt/P/KHI', 'pic_344.jpg', 'Active', NULL, 'Tagger'),
(89, 345, 'Caunga', 'Rustum Oliver', 'RUSTUM', 'rocaunga', 'CRY', 'DE3', '1990-06-29', 'M', 'Single', '2014-01-02', 'caunga-kdt/P/KHI', 'pic_345.jpg', 'Active', NULL, 'Tagger'),
(90, 346, 'Bio', 'Marie Eleonor', 'MARIE', 'yhelle', 'EE', 'DE3', '1991-04-15', 'F', 'Married', '2014-01-02', 'mirabel-kdt/P/KHI', 'pic_346.jpg', 'Active', NULL, 'Tagger'),
(91, 348, 'Tobias', 'Jeoffer', 'JEOFF', 'jltobias', 'ENV', 'DE3', '1990-07-24', 'M', 'Single', '2014-04-01', 'tobias-kdt/P/KHI', 'pic_348.jpg', 'Resigned', '2023-02-13', 'Tagger'),
(92, 350, 'Cajes', 'Joseph', 'DODONG', 'josephcc', 'CRY', 'DE3', '1990-03-22', 'M', 'Married', '2014-04-01', 'cajes-kdt/P/KHI', 'pic_350.jpg', 'Active', NULL, 'Tagger'),
(93, 352, 'Ducay', 'John David', 'DAVID', 'johndavid', 'ENV', 'DE3', '1989-08-28', 'M', 'Married', '2014-04-01', 'ducay-kdt/P/KHI', 'pic_352.jpg', 'Active', NULL, 'Tagger'),
(94, 353, 'Torio', 'Raffy', 'RAFFY', 'raffy', 'SYS/SHI', 'SSE', '1989-02-02', 'M', 'Single', '2014-04-01', 'torio-kdt/P/KHI', 'pic_353.jpg', 'Resigned', '2022-07-18', 'Tagger'),
(95, 355, 'De Jesus', 'Jommuel', 'JOM', 'jommuel', 'SYS', 'SE3', '1992-01-29', 'M', 'Single', '2014-04-01', 'dejesus_j-kdt/P/KHI', 'pic_355.jpg', 'Active', NULL, 'Tagger'),
(96, 356, 'Sumayop', 'Lian Marie', 'LIAN', 'lian', 'EE', 'DE3', '1991-02-07', 'F', 'Married', '2014-04-01', 'cabradilla-kdt/P/KHI', 'pic_356.jpg', 'Active', NULL, 'Tagger'),
(97, 357, 'Sanao', 'Jomari', 'JOM', 'jomari', 'PIP', 'DE3', '1992-11-19', 'M', 'Married', '2014-06-02', 'sanao-kdt/P/KHI', 'pic_357.jpg', 'Active', NULL, 'Tagger'),
(98, 358, 'Sanao', 'Roxanne May', 'XANXAN', 'xanxane', 'PIP', 'DE3', '1991-03-11', 'F', 'Married', '2014-06-02', 'velez-kdt/P/KHI', 'pic_358.jpg', 'Active', NULL, 'Tagger'),
(99, 364, 'Bitang', 'Kim Brian', 'Kim', 'Kimbrian', 'ENV', 'DE3', '1992-02-15', 'F', 'Single', '2014-09-01', 'bitang-kdt/P/KHI', 'pic_364.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(100, 365, 'Magnaye', 'Lara Joy', 'LARA', 'lara', 'ENV', 'DE3', '1991-09-17', 'F', 'Married', '2014-09-01', 'dimaculangan-kdt/P/KHI', 'pic_365.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(101, 367, 'Mendoza', 'Marcial', 'MARCY', 'marci', 'ENV', 'DE3', '1990-05-24', 'M', 'Married', '2014-09-01', 'mendoza_m-kdt/P/KHI', 'pic_367.jpg', 'Active', NULL, 'Tagger'),
(102, 370, 'Nopra', 'Charis Candy', 'CANDY', 'candy', 'IT', 'IT-SE', '1992-04-14', 'F', 'Single', '2014-09-01', 'nopra-kdt/P/KHI', 'pic_370.jpg', 'Active', NULL, 'Tagger'),
(103, 371, 'Cordova', 'Ysabel', 'Ysay', 'ysay', 'MHAH', 'DE3', '1991-01-19', 'F', 'Single', '2015-02-02', 'cordova-kdt/P/KHI', 'pic_371.jpg', 'Active', NULL, 'Tagger'),
(104, 372, 'Frane', 'Gerald Christopher', 'Gerald', 'gerald', 'EE', 'DE3', '1991-12-01', 'M', 'Single', '2015-02-02', 'frane-kdt/P/KHI', 'pic_372.jpg', 'Active', NULL, 'Tagger'),
(105, 373, 'Sabarillo', 'Nelmar Bong', 'Bong', 'bong', 'CRY', 'DE3', '1993-04-22', 'M', 'Single', '2015-02-02', 'sabarillo-kdt/P/KHI', 'pic_373.jpg', 'Active', NULL, 'Tagger'),
(106, 374, 'Fortus', 'Domini', 'Domini', 'domini_resign', 'TEG', 'DE3', '1993-07-12', 'M', 'Single', '2015-02-02', 'fortus-kdt/P/KHI', 'pic_374.jpg', 'Resigned', '2022-03-15', 'Tagger'),
(107, 376, 'Manaog', 'Karen Lorraine', 'Karen', 'karenv', 'EE', 'DE3', '1990-10-19', 'F', 'Married', '2015-02-02', 'vallestero-kdt/P/KHI', 'pic_376.jpg', 'Active', NULL, 'Tagger'),
(108, 377, 'Guico', 'Aldrin', 'Gibo', 'gibo', 'MHAH', 'DE3', '1991-08-11', 'M', 'Single', '2015-02-02', 'guico-kdt/P/KHI', 'pic_377.jpg', 'Active', NULL, 'Tagger'),
(109, 378, 'Montalbo', 'Jennelyn', 'Jen', 'jhen', 'MHAH', 'DE3', '1989-12-04', 'F', 'Married', '2015-02-02', 'reyes_j-kdt/P/KHI', 'pic_378.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(110, 381, 'Flores', 'Angelo', 'Angelo', 'gelo', 'MHAH', 'DE3', '1990-06-19', 'M', 'Single', '2015-02-02', 'flores_a-kdt/P/KHI', 'pic_381.jpg', 'Active', NULL, 'Tagger'),
(111, 382, 'Marquez', 'Arvin David', 'Arvin', 'arvin', 'CIV', 'DE3', '1991-11-19', 'M', 'Married', '2015-05-11', 'marquez-kdt/P/KHI', 'pic_382.jpg', 'Active', NULL, 'Tagger'),
(112, 383, 'Bellen', 'Abegail', 'Abby', 'bellenabi', 'CIV', 'DE3', '1990-05-16', 'F', 'Single', '2015-05-11', 'bellen-kdt/P/KHI', 'pic_383.jpg', 'Active', NULL, 'Tagger'),
(113, 384, 'Gallardo', 'Al Shariff', 'Al', 'al', 'ANA', 'DE3', '1993-06-14', 'M', 'Single', '2015-05-11', 'gallardo-kdt/P/KHI', 'pic_384.jpg', 'Active', NULL, 'Tagger'),
(114, 385, 'Perez', 'Jeremia', 'Mia', 'mia', 'CIV', 'DE3', '1990-09-18', 'F', 'Single', '2015-05-11', 'perez_j-kdt/P/KHI', 'pic_385.jpg', 'Active', NULL, 'Tagger'),
(115, 386, 'Tan', 'Dennis', 'Dennis', 'dennistan', 'MPM', 'DE3', '1990-07-26', 'M', 'Single', '2015-06-01', 'tan_d-kdt/P/KHI', 'pic_386.jpg', 'Active', NULL, 'Tagger'),
(116, 387, 'Balgoma', 'Ramil', 'Ram', 'rbalgoma', 'MHAH', 'DE3', '1992-11-17', 'M', 'Single', '2015-06-01', 'balgoma-kdt/P/KHI', 'pic_387.jpg', 'Active', NULL, 'Tagger'),
(117, 388, 'Gupit', 'Bernico', 'Bernie', 'bernico', 'MHAH', 'DE3', '1992-03-16', 'M', 'Single', '2015-06-01', 'gupit-kdt/P/KHI', 'pic_388.jpg', 'Active', NULL, 'Tagger'),
(118, 389, 'Miranda', 'Nikko', 'Nikko', 'nikkomiranda', 'MPM', 'DE3', '1992-03-16', 'M', 'Single', '2015-06-01', 'miranda_n-kdt/P/KHI', 'pic_389.jpg', 'Active', NULL, 'Tagger'),
(119, 390, 'Garcia', 'Christian Joseph', 'Anjo', 'cmgarcia', 'ENV', 'DE3', '1991-02-10', 'M', 'Married', '2015-06-01', 'garcia_c-kdt/P/KHI', 'pic_390.jpg', 'Active', NULL, 'Tagger'),
(120, 391, 'Dalisay', 'Catherine', 'Cathy', 'catherine', 'ACT', 'AA', '1984-09-30', 'F', 'Married', '2015-08-06', 'austria-kdt/P/KHI', 'pic_391.jpg', 'Active', NULL, 'Tagger'),
(121, 393, 'De Sotto', 'Francis John', 'Kiko', 'francis', 'MHAH', 'DE3', '1990-11-05', 'M', 'Single', '2015-10-01', 'desotto-kdt/P/KHI', 'pic_393.jpg', 'Resigned', '2022-08-01', 'Tagger'),
(122, 394, 'Banta', 'Leah Mariel', 'Leah', 'leah', 'MHAH', 'DE2', '1992-10-15', 'F', 'Single', '2015-10-01', 'banta-kdt/P/KHI', 'pic_394.jpg', 'Resigned', '2022-05-08', 'Tagger'),
(123, 395, 'Villanueva', 'Gladys ', 'Gladys', 'Gladys', 'ENV', 'DE2', '1993-02-26', 'F', 'Single', '2015-10-01', 'villanueva-kdt/P/KHI', 'pic_395.jpg', 'Resigned', '2021-11-01', 'Tagger'),
(124, 396, 'Lacsa', 'John', 'John', 'lacsa', 'MHAH', 'DE3', '1993-01-16', 'M', 'Single', '2015-10-01', 'lacsa-kdt/P/KHI', 'pic_396.jpg', 'Active', NULL, 'Tagger'),
(125, 397, 'Cantos', 'Reniel', 'Reniel', 'ren', 'BOI', 'DE2', '1993-03-11', 'M', 'Single', '2015-10-01', 'cantos-kdt/P/KHI', 'pic_397.jpg', 'Resigned', '2022-02-18', 'Tagger'),
(126, 398, 'Sta. Ana', 'Arnulfo', 'Arnold', 'kuyaarnold', 'ADM', 'DRM', '1965-03-02', 'M', 'Married', '2016-04-01', '', 'pic_398.jpg', 'Active', NULL, 'Tagger'),
(127, 401, 'Laureano', 'Miki Antonio', 'Miki', 'mikilaureano', 'ENV', 'DE3', '1993-05-06', 'M', 'Married', '2016-07-01', 'laureano_m-kdt/P/KHI', 'pic_401.jpg', 'Active', NULL, 'Tagger'),
(128, 402, 'Ornido', 'Marvin John', 'Marvz', 'marvz', 'BOI', 'DE3', '1992-09-17', 'M', 'Single', '2016-07-01', 'ornido-kdt/P/KHI', 'pic_402.jpg', 'Active', NULL, 'Tagger'),
(129, 403, 'Mangaliman', 'Laarni', 'Lani', 'laarni', 'CEM', 'DE3', '1993-09-04', 'F', 'Married', '2016-07-01', 'tumamao-kdt/P/KHI', 'pic_403.jpg', 'Resigned', '2022-11-05', 'Tagger'),
(130, 404, 'Argente', 'Gene Owen', 'Owen', 'geneowen', 'ENV', 'DE3', '1991-08-17', 'M', 'Single', '2016-07-01', 'argente-kdt/P/KHI', 'pic_404.jpg', 'Active', NULL, 'Tagger'),
(131, 406, 'Tumbaga', 'Jefferson', 'Jep', 'tumbaga-kdt', 'CEM', 'DE3', '1993-07-22', 'M', 'Married', '2016-07-01', 'tumbaga-kdt/P/KHI', 'pic_406.jpg', 'Active', NULL, 'Tagger'),
(132, 407, 'Villatuya', 'Russel', 'Russel', 'rcvillatuya', 'EE', 'DE3', '1992-08-07', 'M', 'Single', '2016-07-01', 'villatuya-kdt/P/KHI', 'pic_407.jpg', 'Active', NULL, 'Tagger'),
(133, 409, 'Dela Cruz', 'Earvin James', 'EJ', 'earvinjames', 'SYS', 'SE3', '1993-04-03', 'M', 'Single', '2016-07-01', 'delacruz-kdt/P/KHI', 'pic_409.jpg', 'Active', NULL, 'Tagger'),
(134, 410, 'Parra', 'Ely', 'Ely', 'elyparra', 'BOI', 'DE2', '1994-07-11', 'M', 'Single', '2017-03-01', 'parra-kdt/P/KHI', 'pic_410.jpg', 'Active', NULL, 'Tagger'),
(135, 411, 'Ilao', 'Marylou', 'Malou', 'malou', 'ENV', 'DE2', '1991-10-13', 'F', 'Single', '2017-03-01', 'manalo-kdt/P/KHI', 'pic_411.jpg', 'Active', NULL, 'Tagger'),
(136, 412, 'Rivera', 'Reenan', 'Reenan', 'reenan', 'ENV', 'DE2', '1992-10-01', 'M', 'Single', '2017-03-01', 'rivera-kdt/P/KHI', 'pic_412.jpg', 'Active', NULL, 'Tagger'),
(137, 413, 'Buzeta', 'Wendy', 'Wendy', 'wendz', 'MHAH', 'DE2', '1991-01-22', 'F', 'Single', '2017-03-01', 'anorico-kdt/P/KHI', 'pic_413.jpg', 'Active', NULL, 'Tagger'),
(138, 414, 'Antonio', 'Wilhelm Dennis', 'Lem', 'wilhelm', 'ENV', 'DE2', '1994-08-05', 'M', 'Single', '2017-03-01', 'antonio-kdt/P/KHI', 'pic_414.jpg', 'Active', NULL, 'Tagger'),
(139, 415, 'Astrera', 'Philip Jhon', 'Philip', 'philipj', 'ENV', 'DE2', '1995-11-23', 'M', 'Single', '2017-03-01', 'astrera-kdt/P/KHI', 'pic_415.jpg', 'Active', NULL, 'Tagger'),
(140, 416, 'Floresca', 'Gene Philip', 'Gene', 'gene', 'ETCL', 'DE2', '1992-11-20', 'M', 'Single', '2017-03-01', 'floresca-kdt/P/KHI', 'pic_416.jpg', 'Active', NULL, 'Tagger'),
(141, 417, 'Binay-an', 'Daryl', 'Daryl', 'darylb', 'MHAH', 'DE2', '1994-10-24', 'M', 'Single', '2017-03-01', 'binayan-kdt/P/KHI', 'pic_417.jpg', 'Active', NULL, 'Tagger'),
(142, 419, 'Mesias', 'Meriam', 'Yamie', 'meriam', 'ADM', 'AAR', '1985-08-15', 'F', 'Single', '2017-09-04', 'mesias-kdt/P/KHI', 'pic_419.jpg', 'Active', NULL, 'Tagger'),
(143, 420, 'Benedicto', 'Alvin', 'Vin', 'vin', 'ENV', 'DE2', '1994-10-20', 'M', 'Single', '2018-07-02', 'benedicto-kdt/P/KHI', 'pic_420.jpg', 'Active', NULL, 'Tagger'),
(144, 421, 'Nazar', 'John Jacob', 'Jacob', 'jjnazar', 'MHAH', 'DE2', '1996-01-28', 'M', 'Single', '2018-07-02', 'nazar-kdt/P/KHI', 'pic_421.jpg', 'Active', NULL, 'Tagger'),
(145, 422, 'Pimentel', 'Lucky Boy', 'Lux', 'lux', 'ENV', 'DE2', '1996-10-20', 'M', 'Single', '2018-07-02', 'pimentel-kdt/P/KHI', 'pic_422.jpg', 'Active', NULL, 'Tagger'),
(146, 423, 'Caro', 'Renson', 'Renson', 'rensonc', 'ENV', 'DE2', '1995-01-15', 'M', 'Single', '2018-07-02', 'caro-kdt/P/KHI', 'pic_423.jpg', 'Active', NULL, 'Tagger'),
(147, 424, 'Perez', 'Renzel', 'Renzel', 'renzel', 'MHAH', 'DE2', '1994-09-09', 'M', 'Single', '2018-07-02', 'perez_r-kdt/P/KHI', 'pic_424.jpg', 'Active', NULL, 'Tagger'),
(148, 425, 'Belen', 'Marvin', 'Marvin', 'mbelen', 'ENV', 'DE2', '1994-09-22', 'M', 'Single', '2018-07-02', 'belen_m-kdt/P/KHI', 'pic_425.jpg', 'Active', NULL, 'Tagger'),
(149, 426, 'Tuazon', 'King Louis', 'King', 'kdtuazon', 'BOI', 'DE2', '1992-04-14', 'M', 'Single', '2018-07-02', 'tuazon-kdt/P/KHI', 'pic_426.jpg', 'Active', NULL, 'Tagger'),
(150, 427, 'Fernandez', 'Julius', 'Julius', 'julius', 'MHAH', 'DE2', '1994-01-02', 'M', 'Single', '2018-07-02', 'fernandez-kdt/P/KHI', 'pic_427.jpg', 'Active', NULL, 'Tagger'),
(151, 428, 'Velasco', 'Vryan', 'Vryan', 'vryan', 'ENV', 'DE2', '1993-10-05', 'M', 'Single', '2018-07-02', 'velasco-kdt/P/KHI', 'pic_428.jpg', 'Active', NULL, 'Tagger'),
(152, 429, 'Moralita', 'Denmark', 'Denmark', 'dmoralita', 'ENV', 'DE2', '1994-09-10', 'M', 'Single', '2018-07-02', 'moralita-kdt/P/KHI', 'pic_429.jpg', 'Active', NULL, 'Tagger'),
(153, 430, 'Ucol', 'Zendy Grace', 'Zendy', 'zendy', 'ENV', 'DE2', '1995-08-13', 'F', 'Single', '2018-07-02', 'ucol-kdt/P/KHI', 'pic_430.jpg', 'Active', NULL, 'Tagger'),
(154, 432, 'Macaraan', 'Christian', 'Christian', 'cmacaraan', 'ENV', 'DE2', '1993-12-24', 'M', 'Single', '2018-07-02', 'macaraan-kdt/P/KHI', 'pic_432.jpg', 'Active', NULL, 'Tagger'),
(155, 433, 'Ramos', 'Alyssa', 'Alyssa', 'alyssa', 'MHAH', 'DE2', '1995-09-04', 'F', 'Single', '2018-07-02', 'ramos-kdt/P/KHI', 'pic_433.jpg', 'Active', NULL, 'Tagger'),
(156, 434, 'Pilis', 'Vilmer', 'Vilmer', 'vilmer', 'ENV', 'DE2', '1993-09-12', 'M', 'Single', '2018-07-02', 'pilis-kdt/P/KHI', 'pic_434.jpg', 'Active', NULL, 'Tagger'),
(157, 435, 'Basibas', 'Kerstin Paula', 'Kerstin', 'kbasibas', 'ENV', 'DE2', '1995-02-03', 'F', 'Single', '2018-07-02', 'basibas-kdt/P/KHI', 'pic_435.jpg', 'Active', NULL, 'Tagger'),
(158, 436, 'Viñas', 'Eugene', 'Eugene', 'eugene', 'ENV', 'DE2', '1994-03-15', 'M', 'Single', '2018-07-02', 'vinas-kdt/P/KHI', 'pic_436.jpg', 'Active', NULL, 'Tagger'),
(159, 437, 'Callores', 'Dick Francis', 'Dick', 'dickfrancis', 'ENV', 'DE2', '1993-10-27', 'M', 'Single', '2018-07-02', 'callores-kdt/P/KHI', 'pic_437.jpg', 'Active', NULL, 'Tagger'),
(160, 438, 'Reyes', 'Juan Carlos', 'JC', 'jc', 'ENV', 'DE2', '1994-09-19', 'M', 'Single', '2018-07-02', 'reyes_jc-kdt/P/KHI', 'pic_438.jpg', 'Active', NULL, 'Tagger'),
(161, 439, 'Arroyo', 'Micah Camille', 'Micah', 'arroyo-kdt', 'IT', 'IT-E2', '1997-09-13', 'F', 'Single', '2018-07-02', 'arroyo-kdt/P/KHI', 'pic_439.jpg', 'Active', NULL, 'Tagger'),
(162, 440, 'Panginbayan', 'Rochelle', 'Chelle', 'panginbayan-kdt', 'IT', 'IT-E2', '1997-07-20', 'F', 'Single', '2018-07-02', 'panginbayan-kdt/P/KHI', 'pic_440.jpg', 'Active', NULL, 'Tagger'),
(163, 444, 'Tobias', 'Kenneth', 'Ken', 'ken', 'CIV', 'DE2', '1996-01-26', 'M', 'Single', '2018-10-01', 'tobias_k-kdt/P/KHI', 'pic_444.jpg', 'Active', NULL, 'Tagger'),
(164, 445, 'Honrado', 'Ruth Anne', 'Ruth', 'ruth', 'ANA', 'DE2', '1992-04-09', 'F', 'Single', '2018-10-01', 'honrado-kdt/P/KHI', 'pic_445.jpg', 'Active', NULL, 'Tagger'),
(165, 446, 'Takenaka', 'Yukihiro', '', 'takenaka_yu', 'ADM', 'KDTP', '1965-11-25', 'M', '', '2016-11-25', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 'Active', NULL, 'Tagger'),
(166, 447, 'Medrano', 'Marco', 'Marco', 'maco', 'PIP', 'DE1', '1997-10-04', 'M', 'Single', '2019-07-01', 'medrano-kdt/P/KHI', 'pic_447.jpg', 'Active', NULL, 'Tagger'),
(167, 448, 'Buston', 'Cherry Mae ', 'Che', 'che', 'PIP', 'DE1', '1996-03-08', 'F', 'Single', '2019-07-01', 'soliven-kdt/P/KHI', 'pic_448.jpg', 'Active', NULL, 'Tagger'),
(168, 449, 'Viado', 'Meyrvin', 'Meyrvin', 'meyrvin', 'PIP/DXT', 'DE1', '1996-05-11', 'M', 'Single', '2019-07-01', 'viado-kdt/P/KHI', 'pic_449.jpg', 'Active', NULL, 'Tagger'),
(169, 450, 'Casem', 'Kimberly', 'Kim', 'kimmy', 'PIP', 'DE1', '1995-04-19', 'F', 'Single', '2019-07-01', 'casem-kdt/P/KHI', 'pic_450.jpg', 'Active', NULL, 'Tagger'),
(170, 451, 'Guiao ', 'Neil Stephen ', 'Neil', 'guiao', 'PIP', 'ADE', '1995-10-22', 'M', 'Single', '2019-07-01', 'guiao-kdt/P/KHI', 'pic_451.jpg', 'Resigned', '2022-03-23', 'Tagger'),
(171, 452, 'Nigos', 'Scottee Jairus', 'Scottee', 'scotty', 'ANA/DXT', 'DE1', '1997-10-28', 'M', 'Single', '2019-07-01', 'nigos-kdt/P/KHI', 'pic_452.jpg', 'Active', NULL, 'Tagger'),
(172, 454, 'Armas', 'Kenn John', 'Ken', 'armas', 'BOI', 'DE1', '1994-06-01', 'M', 'Single', '2019-07-01', 'armas-kdt/P/KHI', 'pic_454.jpg', 'Active', NULL, 'Tagger'),
(173, 455, 'Manalo', 'Vincen', 'Vincen', 'vincen', 'ENV', 'DE1', '1996-06-01', 'M', 'Single', '2019-07-01', 'manalo_v-kdt/P/KHI', 'pic_455.jpg', 'Active', NULL, 'Tagger'),
(174, 456, 'Rivera', 'Max Vincent', 'Max', 'maxxs', 'ENV', 'DE1', '1995-05-14', 'M', 'Single', '2019-07-01', 'rivera_m-kdt/P/KHI', 'pic_456.jpg', 'Active', NULL, 'Tagger'),
(175, 459, 'Cutaran', 'Rennel Mae', 'Rennel', 'rennel', 'ENV', 'ADE', '1997-12-11', 'F', 'Single', '2021-07-12', 'cutaran-kdt/P/KHI', 'pic_459.jpg', 'Active', NULL, 'Tagger'),
(176, 460, 'Berongoy', 'Eurjhon', 'Eur', 'eurjhon', 'ENV', 'ADE', '1998-08-19', 'M', 'Single', '2021-07-12', 'berongoy-kdt/P/KHI', 'pic_460.jpg', 'Active', NULL, 'Tagger'),
(177, 461, 'Bayquen', 'Hannah Millace', 'Hannah', 'bayquen-kdt', 'ENV', 'ADE', '1997-05-20', 'F', 'Single', '2021-07-12', 'bayquen-kdt/P/KHI', 'pic_461.jpg', 'Active', NULL, 'Tagger'),
(178, 462, 'Santos', 'Luize Nicole', 'Lui', 'luize', 'ENV', 'ADE', '1998-10-08', 'M', 'Single', '2021-07-12', 'santos-kdt/P/KHI', 'pic_462.jpg', 'Active', NULL, 'Tagger'),
(179, 463, 'Reyes', 'Rizchelle', 'Riz', 'riz', 'ENV', 'ADE', '1999-11-14', 'F', 'Single', '2021-07-12', 'reyes_r-kdt/P/KHI', 'pic_463.jpg', 'Active', NULL, 'Tagger'),
(180, 464, 'Coquia', 'Joshua Mari', 'Joshua', 'coquia-kdt', 'SYS/ENV/EE/IT', 'ASE', '1999-08-15', 'M', 'Single', '2021-07-12', 'coquia-kdt/P/KHI', 'pic_464.jpg', 'Active', NULL, 'Tagger'),
(181, 465, 'Petate', 'Felix Edwin', 'Felix', 'petate-kdt', 'SYS/ENV/EE/IT', 'SE1', '1992-03-14', 'M', 'Single', '2021-07-12', 'petate-kdt/P/KHI', 'pic_465.jpg', 'Active', NULL, 'Tagger'),
(182, 466, 'Aganan', 'Alvin John', 'Alvin', 'aganan-kdt', 'SYS', 'ASE', '1998-07-28', 'M', 'Single', '2021-07-12', 'aganan-kdt/P/KHI', 'pic_466.jpg', 'Active', NULL, 'Tagger'),
(183, 467, 'Camunggol', 'Aldrin Jerick', 'Aldrin', 'aldrin', 'BOI', 'ADE', '1999-04-01', 'M', 'Single', '2021-07-12', 'camunggol-kdt/P/KHI', 'pic_467.jpg', 'Active', NULL, 'Tagger'),
(184, 468, 'Gamez', 'Aaron Godfrey', 'Ron', 'aarongamez', 'MIL', 'ADE', '1998-08-08', 'M', 'Single', '2021-07-12', 'gamez-kdt/P/KHI', 'pic_468.jpg', 'Active', NULL, 'Tagger'),
(185, 10008, 'Chiba', 'Tatsurou', '', 'chiba_ta', '-', 'ADE', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10008.jpg', 'Active', NULL, 'Tagger'),
(186, 10018, 'Ueno', 'Ryosuke', '', 'ueno_r', '-', 'DM', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10018.jpg', 'Active', NULL, 'Tagger'),
(187, 10035, 'Iwamura', 'Munechiyo', '', 'iwamura_m', '-', 'SV', '0000-00-00', 'M', '', '0000-00-00', '', 'pic_10035.jpg', 'Active', NULL, 'Tagger'),
(188, 446, 'President', 'Kdt', '', 'president', 'ADM', 'KDTP', '1965-11-25', 'M', 'Single', '0000-00-00', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 'Active', NULL, 'Tagger'),
(189, 446, 'President', 'Kdt', '', 'kdtpresident', 'ADM', 'KDTP', '1965-11-25', 'M', 'Single', '0000-00-00', 'takenaka_yu-kdt/P/KHI', 'pic_446.jpg', 'Active', NULL, 'Tagger'),
(190, 30001, 'Yonezawa', '', '', 'yonezawa-bnc', 'KHI-ITS', '-', '0000-00-00', 'M', '-', '0000-00-00', '-', '-', 'Active', NULL, 'Tagger'),
(192, 20002, 'Ampig', 'Rommel', 'Rommel', 'rommel', 'MIL/CEM/MPM/ETCL', 'CTE', '1972-01-15', 'M', 'Married', '2022-04-01', 'ampig-kdt/P/KHI', 'pic_2002.jpg', 'Active', NULL, 'Tagger'),
(193, 20001, 'Laureano', 'Antonio', 'Toni', 'toni', 'ADM', 'CSAD', '1956-07-05', 'M', 'Married', '2021-07-01', 'laureano-kdt/P/KHI', 'pic_2001.jpg', 'Active', NULL, 'Tagger'),
(194, 469, 'Arabilla Jr.', 'Joel', 'joel', 'joelarabilla', 'MIL', 'ADE', '1999-08-12', 'M', 'Single', '2022-07-01', 'arabilla-kdt/P/KHI', 'pic_469.jpg', 'Active', NULL, 'Tagger'),
(195, 470, 'Leguin', 'Aries', 'Aries', 'ariesleguin', 'MHAH', 'ADE', '1999-05-11', 'M', 'Single', '2022-07-01', 'leguin-kdt/P/KHI', 'pic_470.jpg', 'Active', NULL, 'Tagger'),
(196, 471, 'Chavez', 'Mark Rian', 'Mark Rian', 'markrian', 'PIP', 'ADE', '1997-09-15', 'M', 'Single', '2022-07-01', 'chavez-kdt/P/KHI', 'pic_471.jpg', 'Active', NULL, 'Tagger'),
(197, 472, 'Lazaro', 'Nelson', 'nelson', 'nelson', 'CEM', 'ADE', '1993-07-14', 'M', 'Single', '2022-07-01', 'lazaro_n-kdt/P/KHI', 'pic_472.jpg', 'Active', NULL, 'Tagger'),
(198, 473, 'Domaoal', 'Kenneth', 'Kenneth', 'kennethdomaoal', 'ENV', 'ADE', '1998-07-28', 'M', 'Single', '2022-07-01', 'domaoal-kdt/P/KHI', 'pic_473.jpg', 'Active', NULL, 'Tagger'),
(199, 474, 'Segovia', 'Nicole Alysson', 'Nicole ', 'nicole', 'ENV', 'ADE', '1996-01-23', 'F', 'Single', '2022-07-01', 'segovia-kdt/P/KHI', 'pic_474.jpg', 'Active', NULL, 'Tagger'),
(200, 475, 'Del Rosario', 'Jay-R', 'Jay-R', 'jayr', 'PIP', 'ADE', '1999-04-27', 'M', 'Single', '2022-07-01', 'delrosario-kdt/P/KHI', 'pic_475.jpg', 'Active', NULL, 'Tagger'),
(201, 486, 'Maximo', 'Carl Rey', 'Carl Rey', 'carlrey', 'CHE', 'ADE', '1994-11-16', 'M', 'Single', '2022-07-01', 'maximo-kdt/P/KHI', 'pic_486.jpg', 'Active', NULL, 'Tagger'),
(202, 477, 'Callanta', 'Von Joemar', 'Von Joemar', 'vonjoemar', 'PIP', 'ADE', '1997-07-12', 'M', 'Single', '2022-07-01', 'callanta-kdt/P/KHI', 'pic_477.jpg', 'Active', NULL, 'Tagger'),
(203, 478, 'Bamba', 'Angelo Justin', 'Angelo Justin', 'angelobamba', 'MHAH', 'ADE', '1996-09-27', 'M', 'Single', '2022-07-01', 'bamba-kdt/P/KHI', 'pic_478.jpg', 'Active', NULL, 'Tagger'),
(204, 479, 'Abella', 'Sean Vinze', 'Sean Vinze', 'seanvinze', 'ENV', 'ADE', '1998-12-03', 'M', 'Single', '2022-07-01', 'abella-kdt/P/KHI', 'pic_479.jpg', 'Active', NULL, 'Tagger'),
(205, 480, 'Tamayo', 'Christian Mari', 'Christian Mari', 'christianmari', 'BOI', 'ADE', '1998-12-29', 'M', 'Single', '2022-07-01', 'tamayo-kdt/P/KHI', 'pic_480.jpg', 'Active', NULL, 'Tagger'),
(206, 481, 'Tan Pian', 'John Meynard', 'John Meynard', 'johnmeynard', 'ENV', 'ADE', '1998-10-05', 'M', 'Single', '2022-07-01', 'tanpian-kdt/P/KHI', 'pic_481.jpg', 'Active', NULL, 'Tagger'),
(207, 482, 'Ramirez', 'Xavier Dwight', 'Xavier Dwight', 'xavierdwight', 'PIP', 'ADE', '1998-12-17', 'M', 'Single', '2022-07-01', 'ramirez-kdt/P/KHI', 'pic_482.jpg', 'Active', NULL, 'Tagger'),
(208, 483, 'Bautista', 'Anne Wilyn', 'Anne Wilyn', 'annewilyn', 'ENV', 'ADE', '1998-12-17', 'F', 'Single', '2022-07-01', 'bautista_anne-kdt/P/KHI', 'pic_483.jpg', 'Active', NULL, 'Tagger'),
(209, 484, 'Jonson', 'Edgar Joseph', 'Edgar', 'edgar', 'EE', 'ADE', '1997-08-31', 'M', 'Single', '2022-07-01', 'jonson-kdt/P/KHI', 'pic_484.jpg', 'Active', NULL, 'Tagger'),
(210, 485, 'Pangilinan', 'Seanne Kyle', 'Seanne Kyle', 'seannekyle', 'CIV', 'ADE', '1999-09-09', 'M', 'Single', '2022-07-01', 'pangilinan-kdt/P/KHI', 'pic_485.jpg', 'Active', NULL, 'Tagger'),
(211, 487, 'Medrano', 'Collene Keith', 'Collene', 'medrano_c-kdt', 'SYS/ENV/EE/IT', 'ASE', '1999-01-13', 'F', 'Single', '2022-08-15', 'medrano_c-kdt/P/KHI', 'pic_487.jpg', 'Active', NULL, 'Tagger'),
(212, 488, 'Gulam', 'Glenda Ann', 'Glenda', 'Glenda', 'SYS', 'PSE', '2000-03-27', 'F', 'Single', '2022-08-15', 'gulam-kdt/P/KHI', 'pic_488.jpg', 'Resigned', '2023-01-31', 'Tagger'),
(213, 489, 'Fortus', 'Domini', 'domini', 'domini', 'MHAH', 'DE2', '1993-07-12', 'M', 'Single', '2023-01-16', 'fortus_d-kdt/P/KHI', 'pic_489.jpg', 'Active', NULL, 'Tagger'),
(214, 490, 'Usal', 'Ryan Christopher', 'Ryan', 'usal-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'usal-kdt/P/KHI', 'pic_490.jpg', 'Active', NULL, 'Tagger'),
(215, 491, 'Villamil', 'Ronald Louie', 'Ronal', 'villamil-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'villamil-kdt/P/KHI', 'pic_491.jpg', 'Active', NULL, 'Tagger'),
(216, 492, 'Villaruel', 'Jayron', 'Jayron', 'villaruel-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'villaruel-kdt/P/KHI', 'pic_492.jpg', 'Active', NULL, 'Tagger'),
(217, 493, 'Bedonia', 'Bryan James', 'Bryan', 'bedonia-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'bedonia-kdt/P/KHI', 'pic_493.jpg', 'Active', NULL, 'Tagger'),
(218, 494, 'Montaniel', 'John Carlos', 'John ', 'montaniel-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'montaniel-kdt/P/KHI', 'pic_494.jpg', 'Active', NULL, 'Tagger'),
(219, 495, 'Rodriguez', 'Nicole', 'Nicole', 'rodriguez-kdt', 'MHAH', 'PDE', '2023-02-06', 'F', 'Single', '2023-03-01', 'rodriguez-kdt/P/KHI', 'pic_495.jpg', 'Active', NULL, 'Tagger'),
(220, 496, 'Tana', 'Marc Jullian', 'Marc', 'tana-kdt', 'MHAH', 'PDE', '2023-02-06', 'M', 'Single', '2023-03-01', 'tana-kdt/P/KHI', 'pic_496.jpg', 'Active', NULL, 'Tagger'),
(223, 20003, 'Caveiro', 'Vincent', 'Vince', 'caveiro-kdt', 'PIP', 'CSE', '1986-01-02', 'M', 'Married', '2023-04-01', 'caveiro-kdt/P/KHI', 'pic_20003.jpg', 'Active', NULL, 'Tagger');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp_prof`
--
ALTER TABLE `emp_prof`
  ADD PRIMARY KEY (`fldID`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_uploads`
--
ALTER TABLE `tbl_uploads`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emp_prof`
--
ALTER TABLE `emp_prof`
  MODIFY `fldID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_tags`
--
ALTER TABLE `tbl_tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_uploads`
--
ALTER TABLE `tbl_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('astra_db', 2, 'Astra_Relationship');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"astra_db\",\"table\":\"user_tbl\"},{\"db\":\"astra_db\",\"table\":\"user_access_tbl\"},{\"db\":\"astra_db\",\"table\":\"access_control_tbl\"},{\"db\":\"astra_db\",\"table\":\"inventory_tbl\"},{\"db\":\"astra_db\",\"table\":\"delivery_tbl\"},{\"db\":\"astra_db\",\"table\":\"purchase_req_tbl\"},{\"db\":\"astra_db\",\"table\":\"stock_level_tbl\"},{\"db\":\"astra_db\",\"table\":\"material_req_tbl\"},{\"db\":\"information_schema\",\"table\":\"TABLE_CONSTRAINTS\"},{\"db\":\"navigatordb\",\"table\":\"tbl_uploads\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('astra_db', 'access_control_tbl', 2, 89, 305),
('astra_db', 'inventory_tbl', 2, 1014, 493),
('astra_db', 'material_req_tbl', 2, 384, 171),
('astra_db', 'purchase_req_tbl', 2, 715, 500),
('astra_db', 'stock_level_tbl', 2, 1316, 493),
('astra_db', 'user_tbl', 2, 721, 101);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-04-10 16:58:24', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `webrequestdb`
--
CREATE DATABASE IF NOT EXISTS `webrequestdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webrequestdb`;

-- --------------------------------------------------------

--
-- Table structure for table `business_units`
--

CREATE TABLE `business_units` (
  `ID` int(11) NOT NULL,
  `BUCode` varchar(15) NOT NULL,
  `BUName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_units`
--

INSERT INTO `business_units` (`ID`, `BUCode`, `BUName`) VALUES
(1, 'ACT', 'Accounting Group'),
(2, 'ADM', 'Admin'),
(3, 'ANA', 'Analysis Group'),
(4, 'ASH', 'Ash Handling Group'),
(5, 'CHE', 'Chemical Group'),
(6, 'CIV', 'Civil Group'),
(7, 'CM', 'Cement Group'),
(8, 'CRY', 'Cryogenic Group'),
(9, 'ECS', 'Electrical Control System'),
(10, 'EE1', 'Electrical Engineering 1 '),
(11, 'EE2', 'Electrical Engineering 2'),
(12, 'ENE', 'Energy Group'),
(13, 'ENV', 'Environmental Group'),
(14, 'ETCL', 'EarthTechnica Co., Ltd. Group'),
(15, 'IT', 'IT Group'),
(16, 'MCH', 'Machinery Group'),
(17, 'MH', 'Material Handling Group'),
(18, 'MIL', 'Mill Group'),
(19, 'MNG', 'Managerial Group'),
(20, 'PIP', 'Piping Group'),
(21, 'SYS', 'System Group'),
(22, 'TEG', 'Tunneling Equipment Group'),
(23, 'SHI', 'Ship Group'),
(24, 'EE', 'Electrical Engineering Group'),
(25, 'INT', 'Inventor Team');

-- --------------------------------------------------------

--
-- Table structure for table `control_locationpath`
--

CREATE TABLE `control_locationpath` (
  `ID` int(11) NOT NULL,
  `PathName` varchar(50) NOT NULL,
  `LocationPath` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `control_locationpath`
--

INSERT INTO `control_locationpath` (`ID`, `PathName`, `LocationPath`) VALUES
(1, 'Initial Path', '//kdt-ph/c/WRS/UPLOADS'),
(2, 'Finish Public Path', '-'),
(3, 'Finish System Path', '//kdt-ph/c/WRS/PROJECTS'),
(4, 'Finish BU Path', '-'),
(5, '01 Application', '//157.116.72.26/WebRequest/WRS/PROJECTS/01 Application'),
(6, '02 CATIA', '//157.116.72.26/WebRequest/WRS/PROJECTS/02 CATIA'),
(7, '03 Microsoft Excel', '//157.116.72.26/WebRequest/WRS/PROJECTS/03 Microsoft Excel'),
(8, '04 AVEVA Marine', '//157.116.72.26/WebRequest/WRS/PROJECTS/04 AVEVA Marine'),
(9, '05 Autocad', '//157.116.72.26/WebRequest/WRS/PROJECTS/05 Autocad'),
(10, '06 Arduino', '//157.116.72.26/WebRequest/WRS/PROJECTS/06 Arduino'),
(11, '07 PDMS', '//157.116.72.26/WebRequest/WRS/PROJECTS/07 PDMS'),
(12, '08 Mobile Development', '//157.116.72.26/WebRequest/WRS/PROJECTS/08 Mobile Development'),
(13, '09 Web Development', '//157.116.72.26/WebRequest/WRS/PROJECTS/09 Web Development');

-- --------------------------------------------------------

--
-- Table structure for table `employee_list`
--

CREATE TABLE `employee_list` (
  `ID` int(11) NOT NULL,
  `EmployeeID` int(10) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `UserName` varchar(30) NOT NULL,
  `PC` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `BusinessUnit` varchar(50) NOT NULL,
  `Designation` varchar(20) NOT NULL,
  `AccessType` int(3) NOT NULL,
  `Access` varchar(15) NOT NULL DEFAULT 'Viewer',
  `UploadControl` text NOT NULL DEFAULT 'OFF',
  `ExportControl` text NOT NULL DEFAULT 'OFF',
  `RefreshStatus` varchar(10) NOT NULL DEFAULT '-',
  `RefreshStatusAdmin` varchar(10) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_list`
--

INSERT INTO `employee_list` (`ID`, `EmployeeID`, `FullName`, `FirstName`, `LastName`, `Gender`, `UserName`, `PC`, `Email`, `BusinessUnit`, `Designation`, `AccessType`, `Access`, `UploadControl`, `ExportControl`, `RefreshStatus`, `RefreshStatusAdmin`) VALUES
(1, 7, 'LAUREANO_TONI', 'TONI', 'LAUREANO', 'Male', 'toni', 'KDTW242', 'laureano-kdt@corp.khi.co.jp', 'ADM', 'SM', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(2, 8, 'PANADO_VAN', 'VAN', 'PANADO', 'Female', 'van', 'KDTW241', 'panado-g1@hg.khi.co.jp', 'ADM/DRIVER', 'DM', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(3, 10, 'TAN_ERWIN', 'ERWIN', 'TAN', 'Male', 'khi', 'KDTW280', 'tan-g1@hg.khi.co.jp', 'ANA/ADM/CIV/ECS/PIP/IT/SYS', 'SM', 4, 'Requestor', 'OFF', 'OFF', 'DONE', 'DONE'),
(4, 18, 'MATIBAG_WILSON', 'WILSON', 'MATIBAG', 'Male', 'wilson', 'KDTW281', 'matibag-kdt@corp.khi.co.jp', 'ANA/CIV/PIP/IT/SYS', 'DM', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(5, 25, 'DERIGAY_OLIVER', 'OLIVER', 'DERIGAY', 'Male', 'OLIVER', 'KDTW292', 'derigay-g1@hg.khi.co.jp', 'CHE/CRY', 'DM', 3, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(6, 30, 'ABUAN_FHER', 'FHER', 'ABUAN', 'Male', 'fher', 'KDTW363', 'abuan-kdt@corp.khi.co.jp', 'TEG/ASH/MH', 'DM', 3, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(7, 37, 'LLANES_FERDINAND', 'FERDINAND', 'LLANES', 'Male', 'llanes', 'KDTW283', 'llanes-kdt@corp.khi.co.jp', 'ENE', 'AM', 2, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(8, 40, 'CABELLO_ARISTEO', 'ARISTEO', 'CABELLO', 'Male', 'aris', 'KDTW313', 'cabello-kdt@corp.khi.co.jp', 'CHE/ENV', 'AM', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(9, 43, 'AMPIG_ROMMEL', 'ROMMEL', 'AMPIG', 'Male', 'rommel', 'KDTW328', 'ampig-kdt@corp.khi.co.jp', 'MIL', 'AM', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(10, 55, 'PEREZ_APRIL', 'APRIL', 'PEREZ', 'Female', 'april', '', 'perez-kdt@corp.khi.co.jp', 'ACT', '', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(11, 61, 'BALISBIS JR._CEZAR', 'CEZAR', 'BALISBIS JR.', 'Male', 'czar', 'KDTW298', 'balisbis-kdt@corp.khi.co.jp', 'ANA/SYS/IT', 'AM', 2, 'Admin', 'ON', 'OFF', 'DONE', 'DONE'),
(12, 101, 'SORIANO_SHARON ANN', 'SHARON ANN', 'SORIANO', 'Female', 'anne', 'KDTN009', 'soriano-kdt@corp.khi.co.jp', 'ADM', '', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(13, 104, 'VELOSO_ERNESTO LOU', 'ERNESTO LOU', 'VELOSO', 'Male', 'LOU', 'KDTW220', 'veloso-kdt@corp.khi.co.jp', 'MNG/ENV/ENE', 'SM', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(14, 107, 'DIAZ_LORENZO', 'LORENZO', 'DIAZ', 'Male', 'etuc', 'KDTW314', 'diaz-kdt@corp.khi.co.jp', 'CM/ETCL/MCH', 'AM', 4, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(15, 117, 'VITALICIO_MAE ANNE', 'MAE ANNE', 'VITALICIO', 'Female', 'mae', 'KDTW309', 'vitalicio-kdt@corp.khi.co.jp', 'TEG', 'SSV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(16, 122, 'MAGNO_ARLENE', 'ARLENE', 'MAGNO', 'Female', 'arlene', 'KDTW239', 'magno-kdt@corp.khi.co.jp', 'ADM', 'ADE', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(17, 134, 'BECINA_ARTEMIO ROEL', 'ARTEMIO ROEL', 'BECINA', 'Male', 'brix', 'KDTW222', 'becina-kdt@corp.khi.co.jp', 'ECS/EE', 'AM', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(18, 145, 'BARADAS_RYAN', 'RYAN', 'BARADAS', 'Male', 'ryan', 'KDTW271', 'baradas-kdt@corp.khi.co.jp', 'CRY', 'SSV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(19, 158, 'VALDEZ_RAMIR', 'RAMIR', 'VALDEZ', 'Male', 'ramir', 'KDTW326', 'valdez-kdt@corp.khi.co.jp', 'ECS/EE', 'DM', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(20, 172, 'VIRAY_JERMAINE', 'JERMAINE', 'VIRAY', 'Female', 'maine', 'KDTW316', 'marasigan-kdt@corp.khi.co.jp', 'MH/ASH', 'SV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(21, 173, 'AGUILAR_JOHN ISAAC', 'JOHN ISAAC', 'AGUILAR', 'Male', 'ice', 'KDTW340', 'aguilar-kdt@corp.khi.co.jp', 'ECS/EE', 'SSV', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(22, 174, 'APOSTOL_ROEL BOY', 'ROEL BOY', 'APOSTOL', 'Male', 'roel', 'KDTW359', 'apostol-kdt@corp.khi.co.jp', 'ECS/EE', 'SSV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(23, 185, 'DE JESUS_RYAN', 'RYAN', 'DE JESUS', 'Male', 'ryanm', 'KDTW265', 'dejesus-kdt@corp.khi.co.jp', 'PIP', 'SV', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(24, 194, 'CASTUERA_MAXWELL', 'MAXWELL', 'CASTUERA', 'Male', 'max', 'KDTW295', 'castuera-kdt@corp.khi.co.jp', 'ASH/MH', 'SV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(25, 209, 'LEAL JR._ERNESTO', 'ERNESTO', 'LEAL JR.', 'Male', 'ernesto', 'KDTW356', 'leal-kdt@corp.khi.co.jp', 'CM/ETCL/MCH', 'SV', 1, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(26, 212, 'LAZARO_EDMON', 'EDMON', 'LAZARO', 'Male', 'edmon', 'KDTW226', 'lazaro-kdt@corp.khi.co.jp', 'SYS', 'SV', 4, 'Developer', 'OFF', 'ON', 'DONE', 'DONE'),
(27, 215, 'PALMONES_MICHAEL', 'MICHAEL', 'PALMONES', 'Male', 'michaelp', 'KDTW293', 'palmones-kdt@corp.khi.co.jp', 'CM', 'SV', 1, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(28, 221, 'CAMATO JR._GERARDO', 'GERARDO', 'CAMATO JR.', 'Male', 'gerard', 'KDTW276', 'camato-kdt@corp.khi.co.jp', 'ENV', 'SV', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(29, 222, 'BELTRAN_JEFFREY', 'JEFFREY', 'BELTRAN', 'Male', 'jeffrey', 'KDTW365', 'beltran-kdt@corp.khi.co.jp', 'MIL', 'SV', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(30, 223, 'PAHEL_JOBERT', 'JOBERT', 'PAHEL', 'Male', 'jobert', 'KDTW245', 'pahel-kdt@corp.khi.co.jp', 'MIL', 'SV', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(31, 224, 'DESOLOC_BLESSEL', 'BLESSEL', 'DESOLOC', 'Female', 'bles', 'KDTW282', 'desoloc-kdt@corp.khi.co.jp', 'ENV', 'SV', 1, 'Requestor', 'OFF', 'OFF', '-', '-'),
(32, 226, 'GULAPA_FRANCIS MARTEE', 'FRANCIS MARTEE', 'GULAPA', 'Male', 'martee', 'KDTW339', 'gulapa-kdt@corp.khi.co.jp', 'ECS', 'SV', 2, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(33, 230, 'OLIVEROS_MARK ANTHONY', 'MARK ANTHONY', 'OLIVEROS', 'Male', 'mark', 'KDTW297', 'oliveros-kdt@corp.khi.co.jp', 'ASH/MH', 'SDE', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(34, 238, 'SESE_JOSEPH FERDINAND', 'JOSEPH FERDINAND', 'SESE', 'Male', 'sese', 'KDTW325', 'sese-kdt@corp.khi.co.jp', 'ENV', 'SV', 1, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(35, 243, 'MIRANDA_CHRISTIAN JAY', 'CHRISTIAN JAY', 'MIRANDA', 'Male', 'christian', 'KDTW258', 'miranda-kdt@corp.khi.co.jp', 'CM', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(36, 252, 'ARANETA_REX', 'REX', 'ARANETA', 'Male', 'rex-al', 'KDTW333', 'araneta-kdt@corp.khi.co.jp', 'CIV', 'SDE', 2, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(37, 256, 'SAHAGUN_MICHELLE', 'MICHELLE', 'SAHAGUN', 'Female', 'cheng', 'KDTW355', 'canalda-kdt@corp.khi.co.jp', 'CM', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(38, 257, 'ONOD_ABEEL', 'ABEEL', 'ONOD', 'Male', 'abel', 'KDTW252', 'onod-kdt@corp.khi.co.jp', 'MIL', 'DE3', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(39, 259, 'LUCENA_REY', 'REY', 'LUCENA', 'Male', 'rey', 'KDTW213', 'lucena-kdt@corp.khi.co.jp', 'CM', 'DE3', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(40, 260, 'VERANO_RONALD', 'RONALD', 'VERANO', 'Male', 'rv', 'KDTW233', 'verano-kdt@corp.khi.co.jp', 'ETCL', 'DE3', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(41, 261, 'VILLAMOR_AMOR', 'AMOR', 'VILLAMOR', 'Male', 'amor', 'KDTW235', 'villamor-kdt@corp.khi.co.jp', 'CHE', 'SV', 2, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(42, 262, 'CANTARA_MARK JOEL', 'MARK JOEL', 'CANTARA', 'Male', 'cantara', 'KDTW310', 'cantara-kdt@corp.khi.co.jp', 'TEG', 'DE3', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(43, 263, 'PASCUA_HENRY', 'HENRY', 'PASCUA', 'Male', 'henry', 'KDTW231', 'pascua-kdt@corp.khi.co.jp', 'MH/ASH', 'DE3', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(44, 264, 'CULAR_GIULIAN LOUIS', 'GIULIAN LOUIS', 'CULAR', 'Male', 'louis', 'KDTW219', 'cular-kdt@corp.khi.co.jp', 'CRY', 'DE2', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(45, 265, 'ONOD_AMALIA', 'AMALIA', 'ONOD', 'Female', 'amie', 'KDTW263', 'nodalo-kdt@corp.khi.co.jp', 'ENV', 'DE2', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(46, 268, 'SANDOVAL_DAN CHRISTIAN', 'DAN CHRISTIAN', 'SANDOVAL', 'Male', 'sandoval', 'KDTW278', 'sandoval-kdt@corp.khi.co.jp', 'PIP', 'SV', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(47, 270, 'CARINGAL_CARLO', 'CARLO', 'CARINGAL', 'Male', 'carlo', 'KDTW277', 'caringal-kdt@corp.khi.co.jp', 'PIP', 'SV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(48, 272, 'CAVEIRO_VINCENT', 'VINCENT', 'CAVEIRO', 'Male', 'vince', 'KDTW279', 'caveiro-kdt@corp.khi.co.jp', 'PIP', 'DE3', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(49, 279, 'PANOPIO_LUISITO', 'LUISITO', 'PANOPIO', 'Male', 'lpanopio', 'KDTW232', 'panopio-kdt@corp.khi.co.jp', 'ASH/MH', 'DE3', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(50, 281, 'CURA_LEONARD RYAN', 'LEONARD RYAN', 'CURA', 'Male', 'cura', 'KDTW254', 'cura-kdt@corp.khi.co.jp', 'CHE', 'SV', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(51, 283, 'CENIZAL_MARIA VANGIE', 'MARIA VANGIE', 'CENIZAL', 'Female', 'adami', 'KDTW291', 'adami-kdt@corp.khi.co.jp', 'EE', 'DE2', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(52, 284, 'CIDRO_JAMES ERIC', 'JAMES ERIC', 'CIDRO', 'Male', 'james', 'KDTW380', 'cidro-kdt@corp.khi.co.jp', 'ECS/EE', 'DE2', 1, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(53, 288, 'GODOY_JHON RAY', 'JHON RAY', 'GODOY', 'Male', 'jhon', 'KDTW268', 'godoy-kdt@corp.khi.co.jp', 'EE', 'DE2', 0, 'Viewer', 'ON', 'OFF', '-', '-'),
(54, 290, 'ARIAP_JOMANIL', 'JOMANIL', 'ARIAP', 'Male', 'joma', 'KDTW366', 'ariap-kdt@corp.khi.co.jp', 'CRY', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(55, 291, 'LLOSALA_ROWEL', 'ROWEL', 'LLOSALA', 'Male', 'rowel', 'KDTW257', 'llosala-kdt@corp.khi.co.jp', 'CHE', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(56, 293, 'DIMAAPI_JASPER', 'JASPER', 'DIMAAPI', 'Male', 'jasper', 'KDTW256', 'dimaapi-kdt@corp.khi.co.jp', 'ETCL', 'DE2', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(57, 296, 'MACALALAD_JOSEPH MICHAEL', 'JOSEPH MICHAEL', 'MACALALAD', 'Male', 'macalalad', 'KDTW324', 'macalalad-kdt@corp.khi.co.jp', 'ENV', 'SSV', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(58, 295, 'MORENO_REX', 'REX', 'MORENO', 'Male', 'moreno', 'KDTW317', 'moreno-kdt@corp.khi.co.jp', 'MH/ASH', 'SV', 2, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(59, 299, 'CANO_BRYAN JAY', 'BRYAN JAY', 'CANO', 'Male', 'bryan', 'KDTW284', 'cano-kdt@corp.khi.co.jp', 'ENE', 'DE2', 2, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(60, 301, 'LINA_DOMINADOR JOSHUA', 'DOMINADOR JOSHUA', 'LINA', 'Male', 'joshua', 'KDTW214', 'lina-kdt@corp.khi.co.jp', 'ENE', 'DE2', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(61, 302, 'SAMPAGA_LOUIE', 'LOUIE', 'SAMPAGA', 'Male', 'sampaga', 'KDTW269', 'sampaga-kdt@corp.khi.co.jp', 'EE', 'DE2', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(62, 304, 'MUNDO_DAISY', 'DAISY', 'MUNDO', 'Female', 'daisy', 'KDTW357', 'mundo-kdt@corp.khi.co.jp', 'ENV/CHE', 'DE1', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(63, 305, 'ESCUETA_RODERICK', 'RODERICK', 'ESCUETA', 'Male', 'roderick', 'KDTW305', 'escueta-kdt@corp.khi.co.jp', 'PIP', 'DE2', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(64, 306, 'BELEN_KERVIN', 'KERVIN', 'BELEN', 'Male', 'kervin', 'KDTW304', 'belen-kdt@corp.khi.co.jp', 'PIP', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(65, 307, 'MENDOZA_VERONICA', 'VERONICA', 'MENDOZA', 'Female', 'vec', 'KDTW382', 'mendoza-kdt@corp.khi.co.jp', 'IT', 'SV', 4, 'Admin', 'ON', 'ON', 'DONE', 'DONE'),
(66, 310, 'TUMAOB_FERDINAND', 'FERDINAND', 'TUMAOB', 'Male', 'tommy', 'KDTW315', 'tumaob-kdt@corp.khi.co.jp', 'MIL', 'DE2', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(67, 311, 'PENETRANTE JR._JORGE', 'JORGE', 'PENETRANTE JR.', 'Male', 'jorge', 'KDTW244', 'penetrante-kdt@corp.khi.co.jp', 'ENE', 'DE2', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(68, 312, 'LUCAS_ADEL', 'ADEL', 'LUCAS', 'Male', 'adel', 'KDTW372', 'lucas-kdt@corp.khi.co.jp', 'ENE', 'DE2', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(69, 313, 'AGUSTINES_ALBERT', 'ALBERT', 'AGUSTINES', 'Male', 'albert', 'KDTW358', 'agustines-kdt@corp.khi.co.jp', 'EE', 'DE2', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(70, 314, 'SANGALANG_DICKENSON', 'DICKENSON', 'SANGALANG', 'Male', 'dickenson', 'KDTW208', 'sangalang_d-kdt@corp.khi.co.jp', 'EE', 'DE2', 0, 'Requestor', 'OFF', 'OFF', 'DONE', '-'),
(71, 316, 'BAUTISTA JR._CELSO', 'CELSO', 'BAUTISTA JR.', 'Male', 'cj', 'KDTW296', 'bautista-kdt@corp.khi.co.jp', 'TEG', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(72, 320, 'ESCUETA JR._JUANITO', 'JUANITO', 'ESCUETA JR.', 'Male', 'jeckzay', 'KDTW299', 'escueta_j-kdt@corp.khi.co.jp', 'EE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(73, 321, 'BIGTAS_KEITH CHARM', 'KEITH CHARM', 'BIGTAS', 'Female', 'charm', 'KDTW300', 'bigtas-kdt@corp.khi.co.jp', 'EE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(74, 322, 'DELAROSA_ESTER', 'ESTER', 'DELAROSA', 'Female', 'ester', 'KDTW327', 'delarosa-kdt@corp.khi.co.jp', 'ECS/EE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(75, 323, 'BORLAGON_ALVIN JAN', 'ALVIN JAN', 'BORLAGON', 'Male', 'vhin', 'KDTW371', 'borlagon-kdt@corp.khi.co.jp', 'ENE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(76, 328, 'CALLEJA_NOMER', 'NOMER', 'CALLEJA', 'Male', 'nomer', 'KDTW370', 'calleja-kdt@corp.khi.co.jp', 'ENE', 'DE1', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(77, 329, 'MARQUESES_JEFF EDWARD', 'JEFF EDWARD', 'MARQUESES', 'Male', 'je', 'KDTW285', 'marqueses_j-kdt@corp.khi.co.jp', 'ENE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(78, 330, 'OMIZ_GILBERT JASON', 'GILBERT JASON', 'OMIZ', 'Male', 'bert', 'KDTW323', 'omiz-kdt@corp.khi.co.jp', 'PIP', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(79, 332, 'DE GUZMAN_CHRISTOPHER', 'CHRISTOPHER', 'DE GUZMAN', 'Male', 'chrisdegz', 'KDTW290', 'deguzman-kdt@corp.khi.co.jp', 'ENV', 'DE1', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(80, 333, 'MATAUM_MICHAEL', 'MICHAEL', 'MATAUM', 'Male', 'kel', 'KDTW322', 'mataum-kdt@corp.khi.co.jp', 'PIP', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(81, 334, 'MIRANDA_JULEMIR', 'JULEMIR', 'MIRANDA', 'Male', 'jhun', 'KDTW262', 'miranda_j-kdt@corp.khi.co.jp', 'ENV', 'DE1', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(82, 335, 'BALLON_AL JOHN', 'AL JOHN', 'BALLON', 'Male', 'aljohn', 'KDTW318', 'ballon-kdt@corp.khi.co.jp', 'TEG', 'DE1', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(83, 338, 'BULAN JR._ROSBELT', 'ROSBELT', 'BULAN JR.', 'Male', 'ross', 'KDTW301', 'bulan-kdt@corp.khi.co.jp', 'ENV', 'DE1', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(84, 343, 'RUBICO_RIZZIEL', 'RIZZIEL', 'RUBICO', 'Unknown', 'rizziel', 'KDTW289', 'rubico-kdt@corp.khi.co.jp', 'TEG', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(85, 344, 'PATRON_EDILAINE MAROSE', 'EDILAINE MAROSE', 'PATRON', 'Female', 'em', 'KDTW331', 'patron-kdt@corp.khi.co.jp', 'CHE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(86, 345, 'CAUNGA_RUSTUM OLIVER', 'RUSTUM OLIVER', 'CAUNGA', 'Male', 'rocaunga', 'KDTW347', 'caunga-kdt@corp.khi.co.jp', 'CRY', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(87, 346, 'MIRABEL_MARIE ELEONOR', 'MARIE ELEONOR', 'MIRABEL', 'Female', 'yhelle', 'KDTW350', 'mirabel-kdt@corp.khi.co.jp', 'ECS/EE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(88, 348, 'TOBIAS_JEOFFER', 'JEOFFER', 'TOBIAS', 'Male', 'jltobias', 'KDTW329', 'tobias-kdt@corp.khi.co.jp', 'ENV', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(89, 350, 'CAJES_JOSEPH', 'JOSEPH', 'CAJES', 'Male', 'josephcc', 'KDTW368', 'cajes-kdt@corp.khi.co.jp', 'CRY', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(90, 352, 'DUCAY_JOHN DAVID', 'JOHN DAVID', 'DUCAY', 'Male', 'johndavid', 'KDTW294', 'ducay-kdt@corp.khi.co.jp', 'ENV', 'DE1', 0, 'Requestor', 'ON', 'OFF', '-', '-'),
(91, 353, 'TORIO_RAFFY', 'RAFFY', 'TORIO', 'Male', 'raffy', 'KDTW351', 'torio-kdt@corp.khi.co.jp', 'SYS', 'SSE', 4, 'Developer', 'ON', 'ON', 'DONE', 'DONE'),
(92, 355, 'DE JESUS_JOMMUEL', 'JOMMUEL', 'DE JESUS', 'Male', 'jommuel', 'KDTW395', 'dejesus_j-kdt@corp.khi.co.jp', 'SYS', 'DE3', 4, 'Developer', 'OFF', 'OFF', 'DONE', 'DONE'),
(93, 356, 'CABRADILLA_LIAN MARIE', 'LIAN MARIE', 'CABRADILLA', 'Female', 'lian', 'KDTW349', 'cabradilla-kdt@corp.khi.co.jp', 'EE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(94, 357, 'SANAO_JOMARI', 'JOMARI', 'SANAO', 'Male', 'jomari', 'KDTW337', 'sanao-kdt@corp.khi.co.jp', 'PIP', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(95, 358, 'SANAO_ROXANNE', 'ROXANNE', 'SANAO', 'Female', 'xanxane', 'KDTW336', 'velez-kdt@corp.khi.co.jp', 'PIP', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(96, 363, 'AGON_MARK PAUL', 'MARK PAUL', 'AGON', 'Male', 'paul', 'KDTW250', 'agon-kdt@corp.khi.co.jp', 'ENV/CHE', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(97, 364, 'BITANG_KIMBRIAN', 'KIMBRIAN', 'BITANG', 'Male', 'Kimbrian', 'KDTW393', 'bitang-kdt@corp.khi.co.jp', 'ENV', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(98, 365, 'DIMACULANGAN_LARA JOY', 'LARA JOY', 'DIMACULANGAN', 'Male', 'lara', 'KDTW286', 'dimaculangan-kdt@corp.khi.co.jp', 'ENV', 'DE1', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(99, 367, 'MENDOZA_MARCIAL', 'MARCIAL', 'MENDOZA', 'Male', 'marci', 'KDTW264', 'mendoza_m-kdt@corp.khi.co.jp', 'ENV', 'DE1', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(100, 370, 'NOPRA_CANDY', 'CANDY', 'NOPRA', 'Female', 'candy', 'KDTW381', 'nopra-kdt@corp.khi.co.jp', 'IT', 'IT-E3', 4, 'Admin', 'ON', 'ON', 'DONE', '-'),
(101, 371, 'CORDOVA_YSABEL', 'YSABEL', 'CORDOVA', 'Female', 'ysay', 'KDTW288', 'cordova-kdt@corp.khi.co.jp', 'TEG', 'ADE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(102, 372, 'FRANE_GERALD CHRISTOPHER', 'GERALD CHRISTOPHER', 'FRANE', 'Male', 'gerald', 'KDTW249', 'frane-kdt@corp.khi.co.jp', 'ECS/EE', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(103, 373, 'SABARILLO_NELMAR BONG', 'NELMAR BONG', 'SABARILLO', 'Male', 'bong', 'KDTW330', 'sabarillo-kdt@corp.khi.co.jp', 'CRY', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(104, 374, 'FORTUS_DOMINI', 'DOMINI', 'FORTUS', 'Male', 'domini', 'KDTW273', 'fortus-kdt@corp.khi.co.jp', 'TEG', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(105, 375, 'ILAGAN_ANGELLE', 'ANGELLE', 'ILAGAN', 'Female', 'angelle', 'KDTW230', 'ilagan-kdt@corp.khi.co.jp', 'MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(106, 376, 'VALLESTERO_KAREN LORRAINE', 'KAREN LORRAINE', 'VALLESTERO', 'Female', 'karenv', 'KDTW261', 'vallestero-kdt@corp.khi.co.jp', 'EE', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(107, 377, 'GUICO_ALDRIN', 'ALDRIN', 'GUICO', 'Male', 'gibo', 'KDTW342', 'guico-kdt@corp.khi.co.jp', 'MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(108, 378, 'REYES_JENNELYN', 'JENNELYN', 'REYES', 'Female', 'jhen', 'KDTW341', 'reyes_j-kdt@corp.khi.co.jp', 'MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(109, 381, 'FLORES_ANGELO', 'ANGELO', 'FLORES', 'Male', 'gelo', 'KDTW308', 'flores_a-kdt@corp.khi.co.jp', 'TEG', 'ADE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(110, 382, 'MARQUEZ_ARVIN DAVID', 'ARVIN DAVID', 'MARQUEZ', 'Male', 'arvin', 'KDTW259', 'marquez-kdt@corp.khi.co.jp', 'CIV', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(111, 383, 'BELLEN_ABEGAIL', 'ABEGAIL', 'BELLEN', 'Female', 'bellenabi', 'KDTW345', 'bellen-kdt@corp.khi.co.jp', 'CIV', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(112, 384, 'GALLARDO_AL SHARIFF', 'AL SHARIFF', 'GALLARDO', 'Male', 'al', 'KDTW378', 'gallardo-kdt@corp.khi.co.jp', 'ANA', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(113, 385, 'PEREZ_JEREMIA', 'JEREMIA', 'PEREZ', 'Female', 'mia', 'KDTW346', 'perez_j-kdt@corp.khi.co.jp', 'CIV', 'ADE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(114, 386, 'TAN_DENNIS', 'DENNIS', 'TAN', 'Male', 'dennistan', 'KDTW', 'tan_d-kdt@corp.khi.co.jp', 'MCH', 'ADE', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(115, 387, 'BALGOMA_RAMIL', 'RAMIL', 'BALGOMA', 'Male', 'rbalgoma', 'KDTW307', 'balgoma-kdt@corp.khi.co.jp', 'MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(116, 388, 'GUPIT_BERNICO', 'BERNICO', 'GUPIT', 'Male', 'bernico', 'KDTW362', 'gupit-kdt@corp.khi.co.jp', 'ASH/MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(117, 389, 'MIRANDA_NIKKO', 'NIKKO', 'MIRANDA', 'Male', 'nikkomiranda', 'KDTW352', 'miranda_n-kdt@corp.khi.co.jp', 'MCH', 'DE2', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(118, 390, 'GARCIA_CHRISTIAN JOSEPH', 'CHRISTIAN JOSEPH', 'GARCIA', 'Male', 'cmgarcia', 'KDTW375', 'garcia_c-kdt@corp.khi.co.jp', 'ENV', 'ADE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(119, 391, 'AUSTRIA_CATHERINE', 'CATHERINE', 'AUSTRIA', 'Female', 'catherine', '', 'austria-kdt@corp.khi.co.jp', 'ACT', '', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(120, 393, 'DE SOTTO_FRANCIS JOHN', 'FRANCIS JOHN', 'DE SOTTO', 'Male', 'francis', '', 'desotto-kdt@corp.khi.co.jp', 'MH', '', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(121, 394, 'BANTA_LEAH MARIEL', 'LEAH MARIEL', 'BANTA', 'Female', 'leah', 'KDTW229', 'banta-kdt@corp.khi.co.jp', 'MH', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(122, 395, 'VILLANUEVA_GLADYS', 'GLADYS', 'VILLANUEVA', 'Female', 'Gladys', 'KDTW267', 'villanueva-kdt@corp.khi.co.jp', 'ENV/CHE', 'ADE', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(123, 396, 'LACSA_JOHN', 'JOHN', 'LACSA', 'Male', 'lacsa', 'KDTW361', 'lacsa-kdt@corp.khi.co.jp', 'MH', 'ADE', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(124, 398, 'CANTOS_REN', 'REN', 'CANTOS', 'Male', 'ren', 'KDTW369', 'cantos-kdt@corp.khi.co.jp', 'ENE', 'ADE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(125, 401, 'LAUREANO_MIKI ANTONIO', 'MIKI ANTONIO', 'LAUREANO', 'Male', 'mikilaureano', 'KDTW373', 'laureano_m-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(126, 402, 'ORNIDO_MARVIN JOHN', 'MARVIN JOHN', 'ORNIDO', 'Male', 'marvz', 'KDTW234', 'ornido-kdt@corp.khi.co.jp', 'ENE', 'PDE', 2, 'Viewer', 'OFF', 'OFF', '-', '-'),
(127, 403, 'MANGALIMAN_LAARNI', 'LAARNI', 'MANGALIMAN', 'Female', 'laarni', 'KDTW212', 'tumamao-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(128, 404, 'ARGENTE_GENE OWEN', 'GENE OWEN', 'ARGENTE', 'Male', 'geneowen', 'KDTW374', 'argente-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(129, 406, 'TUMBAGA_JEP', 'JEP', 'TUMBAGA', 'Male', 'jep', 'KDTW204', 'tumbaga-kdt@corp.khi.co.jp', 'CM', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(130, 407, 'VILLATUYA_RUSSEL', 'RUSSEL', 'VILLATUYA', 'Male', 'rcvillatuya', 'KDTW246', 'villatuya-kdt@corp.khi.co.jp', 'ECS/EE', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(131, 408, 'PALEN_ANGELICA', 'ANGELICA', 'PALEN', 'Female', 'angelica', 'KDTW227', 'palen-kdt@corp.khi.co.jp', 'SYS', 'CAD/CAE', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(132, 409, 'DELA CRUZ_EARVIN JAMES', 'EARVIN JAMES', 'DELA CRUZ', 'Male', 'earvinjames', 'KDTW228', 'delacruz-kdt@corp.khi.co.jp', 'SYS/INT', 'CAD/CAE', 4, 'Developer', 'OFF', 'OFF', 'DONE', 'DONE'),
(133, 410, 'PARRA_ELY', 'ELY', 'PARRA', 'Male', 'elyparra', 'KDTW243', 'parra-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(134, 411, 'MANALO_MARYLOU', 'MARYLOU', 'MANALO', 'Female', 'malou', 'KDTW275', 'manalo-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(135, 412, 'RIVERA_REENAN', 'REENAN', 'RIVERA', 'Male', 'reenan', '', 'rivera-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(136, 413, 'ANORICO_WENDY', 'WENDY', 'ANORICO', 'Female', 'wendz', 'KDTW', 'anorico-kdt@corp.khi.co.jp', 'ASH/MH', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(137, 414, 'ANTONIO_WILHELM DENNIS', 'WILHELM DENNIS', 'ANTONIO', 'Male', 'wilhelm', '', 'antonio-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(138, 415, 'ASTRERA_PHILIP JHON', 'PHILIP JHON', 'ASTRERA', 'Male', 'philipj', '', 'astrera-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(139, 416, 'FLORESCA_GENE PHILIP', 'GENE PHILIP', 'FLORESCA', 'Male', 'gene', 'KDTW274', 'floresca-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(140, 417, 'BINAY-AN_DARYL', 'DARYL', 'BINAY-AN', 'Male', 'darylb', 'KDTW', 'binayan-kdt@corp.khi.co.jp', 'ASH/MH', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(141, 419, 'MESIAS_MERIAM', 'MERIAM', 'MESIAS', 'Female', 'meriam', '', 'mesias-kdt@corp.khi.co.jp', 'ADM/DRIVER', '', 1, 'Viewer', 'OFF', 'OFF', '-', '-'),
(142, 420, 'BENEDICTO_ALVIN', 'ALVIN', 'BENEDICTO', 'Male', 'vin', '', 'benedicto-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(143, 421, 'NAZAR_JOHN JACOB', 'JOHN JACOB', 'NAZAR', 'Male', 'jjnazar', '', 'nazar-kdt@corp.khi.co.jp', 'MH', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(144, 422, 'PIMENTEL_LUCKY BOY', 'LUCKY BOY', 'PIMENTEL', 'Male', 'lux', '', 'pimentel-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(145, 423, 'CARO_RENSON', 'RENSON', 'CARO', 'Male', 'rensonc', '', 'caro-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(146, 424, 'PEREZ_RENZEL', 'RENZEL', 'PEREZ', 'Male', 'renzel', '', 'perez_r-kdt@corp.khi.co.jp', 'MH', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(147, 425, 'BELEN_MARVIN', 'MARVIN', 'BELEN', 'Male', 'mbelen', '', 'belen_m-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(148, 426, 'TUAZON_KING LOUIS', 'KING LOUIS', 'TUAZON', 'Male', 'kdtuazon', '', 'tuazon-kdt@corp.khi.co.jp', 'ENE', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(149, 427, 'FERNANDEZ_JULIUS', 'JULIUS', 'FERNANDEZ', 'Male', 'julius', '', 'fernandez-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(150, 428, 'VELASCO_VRYAN', 'VRYAN', 'VELASCO', 'Male', 'vryan', '', 'velasco-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(151, 429, 'MORALITA_DENMARK', 'DENMARK', 'MORALITA', 'Male', 'dmoralita', '', 'moralita-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(152, 430, 'UCOL_ZENDY GRACE', 'ZENDY GRACE', 'UCOL', 'Female', 'zendy', '', 'ucol-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(153, 432, 'MACARAAN_CHRISTIAN', 'CHRISTIAN', 'MACARAAN', 'Male', 'cmacaraan', '', 'macaraan-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(154, 433, 'RAMOS_ALYSSA', 'ALYSSA', 'RAMOS', 'Female', 'alyssa', '', 'ramos-kdt@corp.khi.co.jp', 'MH', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(155, 434, 'PILIS_VILMER', 'VILMER', 'PILIS', 'Male', 'vilmer', '', 'pilis-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(156, 435, 'BASIBAS_KERSTIN PAULA', 'KERSTIN PAULA', 'BASIBAS', 'Female', 'kbasibas', '', 'basibas-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(157, 436, 'VINAS_EUGENE', 'EUGENE', 'VINAS', 'Male', 'eugene', '', 'vinas-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(158, 437, 'CALLORES_DICK FRANCIS', 'DICK FRANCIS', 'CALLORES', 'Male', 'dickfrancis', '', 'callores-kdt@corp.khi.co.jp', 'TEG', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(159, 438, 'REYES_JUAN CARLOS', 'JUAN CARLOS', 'REYES', 'Male', 'jc', '', 'reyes_jc-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(160, 439, 'ARROYO_MICAH CAMILLE', 'MICAH CAMILLE', 'ARROYO', 'Female', 'carroyo', '', 'arroyo-kdt@corp.khi.co.jp', 'IT', 'PDE', 4, 'Admin', 'ON', 'ON', 'DONE', '-'),
(161, 440, 'PANGINBAYAN_ROCHELLE', 'ROCHELLE', 'PANGINBAYAN', 'Female', 'chelly', '', 'panginbayan-kdt@corp.khi.co.jp', 'IT', 'PDE', 4, 'Admin', 'ON', 'ON', 'DONE', '-'),
(162, 444, 'TOBIAS_KENNETH', 'KENNETH', 'TOBIAS', 'Male', 'ken', '', 'tobias_k-kdt@corp.khi.co.jp', 'CIV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(163, 445, 'HONRADO_RUTH ANNE', 'RUTH ANNE', 'HONRADO', 'Female', 'ruth', '', 'honrado-kdt@corp.khi.co.jp', 'ANA', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(164, 446, 'TAKENAKA_YUKIHIRO', 'YUKIHIRO', 'TAKENAKA', 'Male', 'takenaka_yu', '', 'takenaka_yu@khi.co.jp', 'ADM', 'SM', 4, 'Requestor', 'ON', 'OFF', 'DONE', '-'),
(165, 447, 'MEDRANO_MARCO', 'MARCO', 'MEDRANO', 'Male', 'maco', '', 'medrano-kdt@corp.khi.co.jp', 'PIP', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(166, 448, 'SOLIVEN_CHERRY MAE', 'CHERRY MAE', 'SOLIVEN', 'Female', 'che', '', 'soliven-kdt@corp.khi.co.jp', 'PIP', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(167, 449, 'VIADO_MEYRVIN', 'MEYRVIN', 'VIADO', 'Male', 'meyrvin', '', 'viado-kdt@corp.khi.co.jp', 'PIP', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(168, 450, 'CASEM_KIMBERLY', 'KIMBERLY', 'CASEM', 'Female', 'kimmy', '', 'casem-kdt@corp.khi.co.jp', 'PIP', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(169, 451, 'GUIAO_NEIL STEPHEN', 'NEIL STEPHEN', 'GUIAO', 'Male', 'guiao', '', 'guiao-kdt@corp.khi.co.jp', 'PIP', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(170, 452, 'NIGOS_SCOTTEE JAIRUS', 'SCOTTEE JAIRUS', 'NIGOS', 'Male', 'scotty', '', 'nigos-kdt@corp.khi.co.jp', 'ANA', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(171, 453, 'SAMANTE_PRINCESS JOY', 'PRINCESS JOY', 'SAMANTE', 'Female', 'cessy', '', 'samante-kdt@corp.khi.co.jp', 'ENE', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(172, 454, 'ARMAS_KENN JOHN', 'KENN JOHN', 'ARMAS', 'Male', 'armas', '', 'armas-kdt@corp.khi.co.jp', 'ENE', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(173, 455, 'MANALO_V_VINCEN', 'VINCEN', 'MANALO', 'Male', 'vincen', '', 'manalo_v-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(174, 456, 'RIVERA_M_MAX VINCENT', 'MAX VINCENT', 'RIVERA', 'Male', 'maxxs', '', 'rivera_m-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(175, 457, 'BAUTISTA_J_JUSTINE LLOYD', 'JUSTINE LLOYD', 'BAUTISTA', 'Male', 'justine', '', 'bautista_j-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(176, 458, 'PONCE_ALLYSHA ELLAINE', 'ALLYSHA ELLAINE', 'PONCE', 'Female', 'allysha', '', '', 'ADM', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(177, 459, 'CUTARAN_RENNEL MAE', 'RENNEL MAE', 'CUTARAN', 'Female', 'rennel', 'KDTW', 'cutaran-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(178, 460, 'BERONGOY_EURJHON', 'EURJHON', 'BERONGOY', 'Male', 'eurjhon', 'KDTW', 'berongoy-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(179, 461, 'BAYQUEN_HANNAH MILLACE', 'HANNAH MILLACE', 'BAYQUEN', 'Female', 'hannah', 'KDTW', 'bayquen-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(180, 462, 'SANTOS_LUIZE NICOLE', 'LUIZE NICOLE', 'SANTOS', 'Male', 'luize', 'KDTW', 'santos-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(181, 463, 'REYES_RIZCHELLE', 'RIZCHELLE', 'REYES', 'Female', 'riz', 'KDTW', 'reyes_r-kdt@corp.khi.co.jp', 'ENV', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(182, 464, 'COQUIA_JOSHUA MARI', 'JOSHUA MARI', 'COQUIA', 'Male', 'josh', 'KDTW444', 'coquia-kdt@corp.khi.co.jp', 'SYS', 'PDE', 0, 'Developer', 'ON', 'ON', 'DONE', 'DONE'),
(183, 465, 'PETATE_FELIX EDWIN', 'FELIX EDWIN', 'PETATE', 'Male', 'felix', 'KDTW408', 'petate-kdt@corp.khi.co.jp', 'SYS', 'PDE', 0, 'Developer', 'ON', 'ON', 'DONE', 'DONE'),
(184, 466, 'AGANAN_ALVIN JOHN', 'ALVIN JOHN', 'AGANAN', 'Male', 'aganan-kdt', 'KDTW358', 'aganan-kdt@corp.khi.co.jp', 'SYS', 'PDE', 0, 'Developer', 'ON', 'ON', 'DONE', 'DONE'),
(185, 467, 'CAMUNGGOL_ALDRIN JERICK', 'ALDRIN JERICK', 'CAMUNGGOL', 'Male', 'aldrin', 'KDTW', 'camunggol-kdt@corp.khi.co.jp', 'ENE', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(186, 468, 'GAMEZ_AARON GODFREY', 'AARON GODFREY', 'GAMEZ', 'Male', 'aarongamez', 'KDTW', 'gamez-kdt@corp.khi.co.jp', 'MIL', 'PDE', 0, 'Viewer', 'OFF', 'OFF', 'DONE', '-'),
(187, 41, 'NOGOMI_YASUHISA', 'YASUHISA', 'NOGOMI', 'Unknown', 'nogomi_y', '', 'nogomi_y@khi.co.jp', 'ADM', 'SM', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(188, 10018, 'UENO_RYOSUKE', 'RYOSUKE', 'UENO', 'Unknown', 'ueno_r', 'KDTW', 'ueno_r@khi.co.jp', 'ENV', 'DM', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(189, 10008, 'CHIBA_TATSUROU', 'TATSUROU', 'CHIBA', 'Unknown', 'chiba_ta', 'KDTW', 'chiba_ta@khi.co.jp', 'ENV', 'ADE', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(196, 10035, 'IWAMURA_MUNECHIYO', 'MUNECHIYO', 'IWAMURA', 'Unknown', 'iwamura_m', 'KDTW', 'iwamura_m@khi.co.jp', 'ENV', 'SV', 3, 'Viewer', 'OFF', 'OFF', '-', '-'),
(197, 701, 'Common_Dev', 'Dev', 'Common', 'Unknown', 'dev_common', 'kdtw388', 'kdtdev01-kdt@corp.khi.co.jp', 'SYS', 'SV', 4, 'Viewer', 'OFF', 'OFF', '-', '-'),
(199, 702, 'Room 24P_Conference', 'Conference', 'Room 24P', 'Unknown', 'kdt-common', '', 'kdt-common@corp.khi.co.jp', 'SYS', '', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(202, 446, 'TAKENAKA_YUKIHIRO', 'YUKIHIRO', 'TAKENAKA', 'Male', 'president', '', 'takenaka_yu@khi.co.jp', '', '', 0, 'Requestor', 'ON', 'OFF', '-', '-'),
(203, 446, 'TAKENAKA_YUKIHIRO', 'YUKIHIRO', 'TAKENAKA', 'Male', 'kdtpresident', '', 'takenaka_yu@khi.co.jp', '', '', 0, 'Requestor', 'ON', 'OFF', '-', '-'),
(204, 30001, 'Yonezawa_', 'Yonezawa', ' ', 'Unknown', 'Yonezawa-bnc', '', '', '', '', 0, 'Viewer', 'OFF', 'OFF', '-', '-'),
(206, 487, 'MEDRANO_COLLENE KEITH', 'COLLENE KEITH', 'MEDRANO', 'Female', 'collene', '', 'medrano_c-kdt@corp.khi.co.jp', 'SYS', 'PDE', 0, 'Developer', 'OFF', 'OFF', 'DONE', 'DONE'),
(209, 488, 'GULAM_GLENDA ANN', 'GLENDA ANN', 'GULAM', 'Female', 'glenda', '', 'gulam-kdt@corp.khi.co.jp', 'SYS', 'PDE', 0, 'Developer', 'OFF', 'OFF', 'DONE', 'DONE');

-- --------------------------------------------------------

--
-- Table structure for table `request_list`
--

CREATE TABLE `request_list` (
  `ID` int(11) NOT NULL,
  `TicketNumber` varchar(20) NOT NULL,
  `RequestCode` varchar(30) DEFAULT NULL,
  `PriorityRank` int(11) NOT NULL DEFAULT 0,
  `Title` varchar(1000) DEFAULT NULL,
  `GroupBU` varchar(50) DEFAULT NULL,
  `Description` varchar(2000) NOT NULL,
  `ProjectType` varchar(50) NOT NULL DEFAULT '-',
  `ProjectCode` varchar(10) NOT NULL DEFAULT '-',
  `UploadedFiles` varchar(8000) NOT NULL,
  `InitialPath` varchar(255) NOT NULL DEFAULT '-',
  `FinishPath` varchar(255) NOT NULL DEFAULT '-',
  `KeyPerson` varchar(50) DEFAULT NULL,
  `KeyPersonEmail` varchar(50) NOT NULL,
  `ClientRepresentative` varchar(50) DEFAULT NULL,
  `ClientRepEmail` varchar(50) NOT NULL DEFAULT 'None',
  `Developer` varchar(255) DEFAULT '-',
  `DateRequested` date NOT NULL,
  `TimeRequested` time NOT NULL,
  `StartDate` date NOT NULL,
  `FinishDate` date NOT NULL,
  `Progress` int(3) NOT NULL,
  `Status` char(20) DEFAULT 'Pending',
  `Remarks` varchar(255) DEFAULT 'Your request is on queue.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_list`
--

INSERT INTO `request_list` (`ID`, `TicketNumber`, `RequestCode`, `PriorityRank`, `Title`, `GroupBU`, `Description`, `ProjectType`, `ProjectCode`, `UploadedFiles`, `InitialPath`, `FinishPath`, `KeyPerson`, `KeyPersonEmail`, `ClientRepresentative`, `ClientRepEmail`, `Developer`, `DateRequested`, `TimeRequested`, `StartDate`, `FinishDate`, `Progress`, `Status`, `Remarks`) VALUES
(1, 'WRN-21-001', '20211117_105005_E212', 0, 'Web Request System (WRS)', 'SYS', 'Web Request System (WRS)', '09 Web Development', '09-0001', 'Chrome.png  -  132.63 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211117_105005_E212', '\\\\kdt-ph\\c\\WRS\\PROJECTS\\09 Web Development\\0001_Web Request System (WRS)\\2021\\20211117_105005_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'alvinjohn', '2021-11-17', '10:50:05', '2021-11-22', '2022-02-25', 100, 'Finished', 'This request was already finished.'),
(2, 'WRN-21-002', '20211117_113410_E134', 0, 'Web QMS - Quality Management System', 'EE', 'This program will allow all employees to input, access and update their individual company information and activities in our KDT Intranet.', '09 Web Development', '09-0002', '20210929-0632 Re_ Intranet Input of Employees Individual History.eml  -  320.97 KB,20211015-0816 Re_ WEB QMS UI Draft (rev).eml  -  7.05 KB,20211102-1617 Re_ QMS WG_ Document Number & Cover Page.eml  -  358.73 KB,20211103-1608 Re_ QMS WG_ Document Number & Cover Page.eml  -  28.03 KB,20211103-1623 Re_ QMS WG_ Job History Database Input.eml  -  37.68 KB,20211103-1636 Re_ QMS WG_ Document Number & Cover Page.eml  -  28.52 KB,20211103-1655 QMS WG_ Additional Output Report.eml  -  207.68 KB,20211104-0706 Re_ QMS WG_ Document Number & Cover Page.eml  -  27.06 KB,20211111-1501 Fw_ QMS-Job History Selection.eml  -  140.46 KB,20211112-1124 Re_ Fw_ QMS-Job History Selection.eml  -  140.76 KB,20211112-1327 Fw_ QMS-Job History Selection.eml  -  142.29 KB,20211112-1426 Fw_ QMS-Job History Selection.eml  -  377.02 KB,20211115-1646 Re_ Fw_ QMS-Job History Selection.eml  -  287.58 KB,20211116-0711 QMS_ Revised UI.eml  -  347.67 KB,20211116-0743 Re_ QMS_ Revised UI.eml  -  349.5 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211117_113410_E134', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20211117_113410_E134', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'felix, josh', '2021-11-17', '11:34:10', '2021-09-28', '2022-01-26', 100, 'Finished', 'This request was already finished.'),
(3, 'WRN-21-003', '20211118_111645_E212', 0, 'kdtCablewayBranchSplit', 'SHI', 'bway split with 2 table reference for 2 condition', '', '-', '20211006-0858 Add CHR Split Pattern.eml  -  62.02 KB,20211006-0858 CHR Split Pattern.xlsx  -  15.87 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_111645_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2021-11-18', '11:16:45', '0000-00-00', '0000-00-00', 20, 'Cancelled', 'neglect request'),
(4, 'WRN-21-004', '20211118_111807_E212', 0, 'kdtCablewayBranchSplit', 'SHI', '20211013-1037 SHI FB desc - Edmon', '04 AVEVA Marine', '04-0079', '20211013-1037 FB division information addition request.eml  -  340.02 KB,20211014-0930 Re_ FB division information addition request.eml  -  456.86 KB,20211015-1031 Re_ FB division information addition request.eml  -  511.55 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_111807_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0079_kdtCablewayBranchSplit/2022/20211118_111807_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2021-11-18', '11:18:07', '2022-04-27', '2022-04-27', 100, 'Finished', 'This request was already finished.'),
(5, 'WRN-21-005', '20211118_112000_E212', 0, 'kdtCablewayBranchSplit', 'SHI', '20211101-0938 SHI FBR - Edmon', '04 AVEVA Marine', '04-0079', '20211101-0938 (20211102-0723) Re_ kdtCablewayBranchSplit_20211029_FBR legs distances and legs rotation.eml  -  2.13 MB,20211102-0723 (20211102-0925) Re_ kdtCablewayBranchSplit_20211029_FBR legs distances and legs rotation.eml  -  2.18 MB,20211102-0925 Re_ kdtCablewayBranchSplit_20211029_FBR legs distances and legs rotation.eml  -  2.2 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_112000_E212', '\\\\kdt-ph\\C\\WRS\\PROJECTS\\04 AVEVA Marine\\0079_kdtCablewayBranchSplit\\2022\\20211118_112000_E212', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2021-11-18', '11:20:00', '0000-00-00', '0000-00-00', 100, 'Finished', 'This request was already finished.'),
(6, 'WRN-21-006', '20211118_112224_E212', 0, 'kdtCablewayBranchSplit', 'SHI', '20211026-1424 SHI - Edmon', '04 AVEVA Marine', '04-0079', '20211026-1424 (20211029-1757) Problems During Request.eml  -  6.35 MB,20211029-1757 kdtCablewayBranchSplit_Re_ Problems During Request.eml  -  27.56 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_112224_E212', '\\\\kdt-ph\\C\\WRS\\PROJECTS\\04 AVEVA Marine\\0079_kdtCablewayBranchSplit\\2022\\20211118_112224_E212', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2021-11-18', '11:22:24', '0000-00-00', '0000-00-00', 100, 'Finished', 'This request was already finished.'),
(7, 'WRN-21-007', '20211118_114709_E355', 0, 'kdtCwayReportPadMarking', 'SHI', '20211008-0840 SHI Cable Way Pad Marking - joms', '04 AVEVA Marine', '04-0090', 'Re_ PAD of main cable way_1.eml  -  448.24 KB,Re_ PAD of main cable way_2.eml  -  540.78 KB,Re_ PAD of main cable way_3.eml  -  972.23 KB,Re_ PAD of main cable way_4.eml  -  974.37 KB,Re_ PAD of main cable way_5.eml  -  0.98 MB,Re_ PAD of main cable way_6.eml  -  1.1 MB,Re_ PAD of main cable way_7.eml  -  1.11 MB,Shi.eml  -  793.47 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_114709_E355', '\\\\kdt-ph\\c\\WRS\\PROJECTS\\04 AVEVA Marine\\0090_kdtCwayReportPadMarking\\2022\\20211118_114709_E355', 'Jommuel De Jesus', 'aganan-kdt@corp.khi.co.jp', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp', 'jommuel, raffy', '2021-11-18', '11:47:10', '2021-10-08', '2021-12-13', 100, 'Finished', 'This request was already finished.'),
(8, 'WRN-21-008', '20211118_143045_E409', 0, 'INTMaterialLibraryPartName', 'INT', '20211105 INT MaterialLibraryMacro - ej', '03 Microsoft Excel', '03-0037', '20211105-1145  Request for excel Formula_Macro.eml  -  847.22 KB,B2301_管継手(ねじ込み可鍛鋳鉄製)_R2_MacroTest.xlsm  -  612.12 KB,Macro_request.xlsx  -  129.84 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_143045_E409', '//kdt-ph/c/WRS/PROJECTS/03 Microsoft Excel/0037_INTMaterialLibraryPartName/2022/20211118_143045_E409', 'Earvin James Dela Cruz', 'aganan-kdt@corp.khi.co.jp', 'Ruth Anne Honrado', 'honrado-kdt@corp.khi.co.jp', 'earvinjames', '2021-11-18', '14:30:45', '2023-01-01', '2023-01-01', 100, 'Finished', 'This request was already finished.'),
(9, 'WRN-21-009', '20211118_160124_E173', 2, 'EE Site Supervision Application (QR)', 'EE', '20210914 - EE Site Supervision Application', '08 Mobile Development', '08-', 'Fw_ QR Code File.eml  -  6.3 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_160124_E173', '-', 'Ramir Valdez', 'valdez-kdt@corp.khi.co.jp', 'Artemio Roel Becina', 'becina-kdt@corp.khi.co.jp', 'earvinjames', '2021-11-18', '16:01:24', '2022-07-02', '0000-00-00', 50, 'On Hold', 'Your request is ON HOLD due to prior requests.'),
(10, 'WRN-21-010', '20211118_162054_E104', 2, 'KDT Engineering Manhour Summary', 'MNG', '20211117-0730 MNG KDTManhourSummary', '01 Application', '-', '20211117-0730 merge name only.PNG  -  28.88 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211118_162054_E104', '-', 'Ernesto Lou Veloso', 'veloso-kdt@corp.khi.co.jp', 'Ryosuke Ueno', 'ueno_r@khi.co.jp', 'edmon, raffy', '2021-11-18', '16:20:54', '2022-04-01', '2022-04-19', 100, 'Ongoing', 'The progress of your request is 100%. \r\nPlease communicate with System Developers if you have any concerns to your request.'),
(11, 'WRN-21-011', '20211206_092833_E212', 0, 'Web Request System (WRS)', 'SYS', 'Additional Features - Coding and Debugging (as of December 6, 2021)', '09 Web Development', '09-0001', '1.png  -  13.65 KB,2.png  -  20.52 KB,3.png  -  21.36 KB,4.png  -  47.1 KB,5.jfif  -  11.17 KB,6.png  -  105.01 KB,7.jfif  -  9.94 KB,8.png  -  56.44 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211206_092833_E212', '\\\\kdt-ph\\c\\WRS\\PROJECTS\\09 Web Development\\0001_Web Request System (WRS)\\2021\\20211206_092833_E212', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'alvinjohn, edmon', '2021-12-06', '09:28:33', '2021-12-06', '2022-04-13', 100, 'Finished', 'This request was already finished.'),
(12, 'WRN-21-012', '20211213_102341_E226', 14, 'Auto Support Fabrication V2.0', 'EE2', 'Auto Support Fabrication update', '-', '-', 'MTO.exe  -  1.64 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211213_102341_E226', '-', 'Francis Martee Gulapa', 'gulapa-kdt@corp.khi.co.jp', 'Roel Boy Apostol', 'apostol-kdt@corp.khi.co.jp', 'jommuel', '2021-12-13', '10:23:42', '2022-02-22', '0000-00-00', 76, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(13, 'WRN-21-013', '20211215_142200_E355', 0, 'kdtCwayReportPadMarking', 'SYS', '20211008-0840 SHI Cable Way Pad Marking - joms', '04 AVEVA Marine', '04-0090', 'Re_ PAD of main cable way.eml  -  1.55 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211215_142200_E355', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0090_kdtCwayReportPadMarking/2022/20211215_142200_E355', 'Jommuel De Jesus', 'aganan-kdt@corp.khi.co.jp', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp', 'jommuel, raffy', '2021-12-15', '14:22:00', '2021-12-13', '2022-02-15', 100, 'Finished', 'This request was already finished.'),
(14, 'WRN-21-014', '20211217_080201_E226', 0, 'Cable tray MTO', 'EE2', '1. FIX THE NET QUANTITY FORMULA FOR CODE NUMBER CON(100) AND CON(150). 2. SORTING OF CODE NUMBER ', '07 PDMS', '07-0007', 'CTCODE1.csv  -  7.96 KB,KDTCableTrayList.pmlfrm  -  71.22 KB,KDTDictionary.pmlobj  -  3.93 KB,MODIFY_20211217.txt  -  0.11 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20211217_080201_E226', '//kdt-ph/c/WRS/PROJECTS/07 PDMS/0007_Cable tray MTO/2022/20211217_080201_E226', 'Francis Martee Gulapa', 'aganan-kdt@corp.khi.co.jp', 'Dickenson Sangalang', 'sangalang_d-kdt@corp.khi.co.jp', 'jommuel', '2021-12-17', '08:02:01', '2021-12-17', '2022-02-03', 100, 'Finished', 'This request was already finished.'),
(15, 'WRN-21-015', '20220105_084802_E252', 14, 'Simplier Weekly Report and Monitoring for KDT Civil', 'CIV', 'Will be use as a present material for our Weekly meeting with KHI', '', '-', '2022_KDT Overall & weekly Schedule(Rex).xlsx  -  99.47 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220105_084802_E252', '-', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'None', 'None', '-', '2022-01-05', '08:48:02', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(16, 'WRN-21-016', '20220106_080309_E353', 0, 'kdtCoordinatePosition', 'SHI', 'Get coordinate position based on graphical mouse pick', '04 AVEVA Marine', '04-0091', '20211222-1806 (20211224-1409) Sample macro create .eml  -  17.39 KB,20211224-1409 Re_ Sample macro create .eml  -  20.64 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220106_080309_E353', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0091_kdtCoordinatePosition/2022/20220106_080309_E353', 'Raffy Torio', 'aganan-kdt@corp.khi.co.jp', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', '-', '2022-01-06', '08:03:09', '2022-01-01', '2022-01-01', 100, 'Finished', 'This request was already finished.'),
(17, 'WRN-21-017', '20220118_092312_E466', 0, 'Test Project Name', 'SYS', 'Test Description', '-', '-', '', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220118_092312_E466', '-', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'Joshua Mari Coquia', 'coquia-kdt@corp.khi.co.jp', '-', '2022-01-18', '09:23:12', '0000-00-00', '0000-00-00', 0, 'Cancelled', 'For testing purposes only.'),
(18, 'WRN-21-018', '20220118_120417_E370', 0, 'KDT Breaktime Music', 'IT', 'Automatic command service for playing music in breaktime (10:00:15am). This will be installed in 2 KDT-IT Remote PC.', '01 Application', '01-0046', 'Bruno Mars, Anderson .Paak, Silk Sonic - Skate [Official Music Video] (320kbps).mp3  -  7.75 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220118_120417_E370', '//kdt-ph/c/WRS/PROJECTS/01 Application/0046_KDT Breaktime Music/2022/20220118_120417_E370', 'Candy Nopra', 'aganan-kdt@corp.khi.co.jp', 'Erwin Tan', 'tan-g1@hg.khi.co.jp', 'earvinjames, josh', '2022-01-18', '12:04:17', '2022-01-18', '2022-01-29', 100, 'Finished', 'This request was already finished.'),
(19, 'WRN-21-019', '20220119_115058_E353', 3, 'AMS Auto Downloader', 'SYS', 'Automatically download logs generated from Attendance Management Server.', '01 Application', '-', 'Attendance Management Program.png  -  123.01 KB,Timelog Database v2.0.png  -  66.54 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220119_115058_E353', '-', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp', 'Micah Camille Arroyo', 'arroyo-kdt@corp.khi.co.jp', 'raffy', '2022-01-19', '11:50:58', '0000-00-00', '0000-00-00', 100, 'Ongoing', 'Your request is on queue.'),
(20, 'WRN-21-020', '20220124_102912_E212', 14, 'kdtMessagingSystem', 'SHI', ' Messaging system to be used for kdt communication.', '', '-', 'SYS MessegingSystem_R01_20210602-0832.pptx  -  1.53 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220124_102912_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None', '-', '2022-01-24', '10:29:13', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(21, 'WRN-21-021', '20220124_134449_E373', 0, 'Music - Lite Kaizen', 'CRY', 'Play one or two songs Monday-Friday at 10 am breaktime.', '-', '-', 'Playing Music during Breaktime Guidelines-R1_220107.xlsx  -  10.25 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220124_134449_E373', '-', 'Nelmar Bong Sabarillo', 'sabarillo-kdt@corp.khi.co.jp', 'None', 'None', 'josh', '2022-01-24', '13:44:49', '0000-00-00', '0000-00-00', 0, 'Cancelled', 'This request is cancelled because this was already completed by Joshua Coquia.'),
(22, 'WRN-21-022', '20220125_141315_E307', 14, 'Meeting Room Reservation System', 'IT', 'Please see attached', '-', '-', 'Request_Meeting Room Reservation_25Jan2022.xlsx  -  10.66 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220125_141315_E307', '-', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'Erwin Tan', 'tan-g1@hg.khi.co.jp', 'felix, josh', '2022-01-25', '14:13:15', '2022-01-25', '0000-00-00', 90, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(23, 'WRN-21-023', '20220201_105235_E224', 4, 'ENV SupplyPartsList', 'ENV', 'Modification and debugging for parts with two child part', '03 Microsoft Excel', '03-', '57_SL _Chita-Nanbu_with Comments.pdf  -  208.14 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220201_105235_E224', '-', 'Blessel Desoloc', 'desoloc-kdt@corp.khi.co.jp', 'None', 'None', 'earvinjames', '2022-02-01', '10:52:35', '2023-01-09', '2023-01-20', 15, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.\r\n\\157.116.25.166common-117-Solutions\04_EnviSupply Parts ListMacro_Suppy Part List_220706'),
(24, 'WRN-21-024', '20220208_134828_E212', 0, 'kdtElectricalPartList', 'SYS', 'new FA fittings', '04 AVEVA Marine', '04-0088', '20211215-0904  灯具&各種取付台(4951区分).xls  -  760 KB,20211215-0904 (ElectricalPartList) KS Weight Output & FA-5 weight change.eml  -  2.16 MB,20211215-0904 FA-5.pdf  -  30.89 KB,20211215-0904 電路金物製作表(4961区分).xls  -  794.5 KB,20220131-1658 Re_ (ElectricalPartList) KS Weight Output & FA-5 weight change.eml  -  89.83 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220208_134828_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0088_kdtElectricalPartList/2022/20220208_134828_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2022-02-08', '13:48:28', '2022-02-04', '2022-03-07', 100, 'Finished', 'This request was already finished.'),
(25, 'WRN-21-025', '20220210_080729_E212', 0, 'kdtCablewayBranchSplit', 'SYS', 'CH multiple split', '04 AVEVA Marine', '04-0079', '20220208-1830 Re_ kdtCablewayBranchSplit_20220205_common.eml  -  1.54 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2021\\20220210_080729_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0079_kdtCablewayBranchSplit/2022/20220210_080729_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None', 'edmon', '2022-02-10', '08:07:30', '2022-02-08', '2022-02-10', 100, 'Finished', 'This request was already finished.'),
(26, 'WRN-22-026', '20220211_081612_E373', 0, 'KDT Breaktime Music', 'CRY', 'Play songs Monday-Friday at 10am and 3 pm breaktime. Different set of songs for 10 am and 3 pm.', '01 Application', '01-0046', 'Playing Music during Breaktime Guidelines-R2_220211.xlsx  -  10.31 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220211_081612_E373', '//kdt-ph/c/WRS/PROJECTS/01 Application/0046_KDT Breaktime Music/2022/20220211_081612_E373', 'Nelmar Bong Sabarillo', 'aganan-kdt@corp.khi.co.jp', 'Candy Nopra', 'nopra-kdt@corp.khi.co.jp', 'earvinjames, josh', '2022-02-11', '08:16:13', '2022-02-11', '2022-03-23', 100, 'Finished', 'This request was already finished.'),
(27, 'WRN-22-027', '20220217_113754_E288', 14, 'EE Photo Database', 'EE', '20210804-1317 EE Photo Database', '01 Application', '01-', '20210804-1317 Electrical Group Photo Database Software.pptx  -  5.26 MB,20210804-1317 Request for Software Development (EE Photo Database Software).eml  -  7.2 MB,20210820-1436 Re_ Request for Software Development (EE Photo Database Software).eml  -  8.41 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220217_113754_E288', '-', 'Jhon Ray Godoy', 'godoy-kdt@corp.khi.co.jp', 'Artemio Roel Becina', 'becina-kdt@corp.khi.co.jp;', 'alvinjohn', '2022-02-17', '11:37:54', '2022-06-20', '0000-00-00', 51, 'On Hold', 'Integrated in KDT Cloud Navigator.\r\nOfficially stopped.'),
(28, 'WRN-22-028', '20220217_142615_E212', 0, 'kdtCablewayBranchSplit', 'SYS', 'FB extend function & FBR Support distance', '04 AVEVA Marine', '04-0079', '20220217-1324 Re_ kdtCablewayBranchSplit_20220217_CH supp distance.eml  -  2.24 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220217_142615_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0079_kdtCablewayBranchSplit/2022/20220217_142615_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-02-17', '14:26:15', '2022-02-17', '2022-02-26', 100, 'Finished', 'This request was already finished.'),
(29, 'WRN-22-029', '20220301_135924_E212', 0, 'kdtCablewayBranchSplit', 'SYS', 'FBR single supp & FB supp1 extend bug', '04 AVEVA Marine', '04-0079', '20220228-1018 Re_ kdtCablewayBranchSplit_20220226_FBR supp distances and FB supp extend funct.eml  -  2.52 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220301_135924_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0079_kdtCablewayBranchSplit/2022/20220301_135924_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-01', '13:59:24', '2022-02-28', '2022-03-01', 100, 'Finished', 'This request was already finished.'),
(30, 'WRN-22-030', '20220302_130940_E212', 0, 'kdtSetGisouArea', 'SYS', 'compile to net4.6', '04 AVEVA Marine', '04-0083', '20220228-1519 Re_ kdtSetGisouArea_20201025_create.eml  -  605.25 KB,20220301-0850 Fw_ kdtSetGisouArea_20201025_create.eml  -  575.81 KB,20220301-1017 Re_ Fw_ kdtSetGisouArea_20201025_create.eml  -  580.25 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220302_130940_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0083_kdtSetGisouArea/2022/20220302_130940_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-02', '13:09:40', '2022-02-28', '2022-03-03', 100, 'Finished', 'This request was already finished.'),
(31, 'WRN-22-031', '20220302_145800_E307', 14, 'Squid Proxy Server', 'IT', 'Squid Proxy Server', '-', '-', 'DETAILS.txt  -  0.05 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220302_145800_E307', '-', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'Erwin Tan', 'tan-g1@hg.khi.co.jp;', '-', '2022-03-02', '14:58:00', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(32, 'WRN-22-032', '20220303_114701_E212', 0, 'kdtCablewayProductionAddin', 'SYS', 'compile to net4.6', '04 AVEVA Marine', '04-0056', '20220302-1112 Re_ kdtSetGisouArea_20220302_compiled to 4.6dotNet.eml  -  611.39 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220303_114701_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0056_kdtCablewayProductionAddin/2022/20220303_114701_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-03', '11:47:01', '2022-02-28', '2022-03-02', 100, 'Finished', 'This request was already finished.'),
(33, 'WRN-22-033', '20220303_143104_E226', 0, 'Cable tray MTO', 'ECS', '1. output the pml cable tray MTO to cable tray MTO format excel file. 2. sort the output in the cable tray MTO format excel file by cable ladder and accessories.', '07 PDMS', '07-0007', 'CABLE TRAY MTO.xls  -  95 KB,CTCODE1.csv  -  8.01 KB,KDTCableTrayList.pmlfrm  -  71.58 KB,KDTDictionary.pmlobj  -  10.72 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220303_143104_E226', '//kdt-ph/c/WRS/PROJECTS/07 PDMS/0007_Cable tray MTO/2022/20220303_143104_E226', 'Francis Martee Gulapa', 'aganan-kdt@corp.khi.co.jp', 'Dickenson Sangalang', 'sangalang_d-kdt@corp.khi.co.jp;', 'jommuel', '2022-03-03', '14:31:16', '2022-03-07', '2022-04-04', 100, 'Finished', 'This request was already finished.'),
(34, 'WRN-22-034', '20220307_105917_E307', 1, 'KDT IT Helpdesk', 'IT', 'KDT IT Helpdesk', '', '-', 'Details.txt  -  0.04 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220307_105917_E307', '-', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'Candy Nopra, Micah Camille Arroyo, Rochelle Pangin', 'nopra-kdt@corp.khi.co.jp;arroyo-kdt@corp.khi.co.jp', 'felix, josh', '2022-03-07', '10:59:17', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(35, 'WRN-22-035', '20220307_110014_E307', 14, 'ADMIN 201 Files', 'IT', 'ADMIN 201 Files', '09 Web Development', '09-', 'Details.txt  -  0.04 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220307_110014_E307', '-', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'Van Panado', 'panado-g1@hg.khi.co.jp;', 'felix, josh', '2022-03-07', '11:00:14', '2022-07-27', '0000-00-00', 70, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(36, 'WRN-22-036', '20220307_110151_E307', 14, 'KDT Survey  Portal', 'IT', 'KDT Survey  Portal', '', '-', 'Details.txt  -  0 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220307_110151_E307', '-', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'None', 'None;', 'felix, josh', '2022-03-07', '11:01:51', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(37, 'WRN-22-037', '20220311_145622_E212', 4, 'amPipeSketches', 'SYS', 'SP5 bug', '04 AVEVA Marine', '-', '20220311-1050 ampipesketches.pmlboj has a problem with dimensions..eml  -  1.87 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220311_145622_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-11', '14:56:22', '0000-00-00', '0000-00-00', 30, 'On Hold', 'priority kdtElectricalPartLlist and kdtHvacAutolabel'),
(38, 'WRN-22-038', '20220315_101900_E353', 14, 'AutoDP Handrail', 'SYS', 'Automatic creation of Handrail production drawing', '04 AVEVA Marine', '04-', 'AUTO_DP_for Handrail_Dimension_control.xlsx  -  73.54 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220315_101900_E353', '-', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp;', 'raffy', '2022-03-15', '10:19:01', '2022-03-15', '2022-06-10', 40, 'Ongoing', 'Fix ISO View ADDE Elements'),
(39, 'WRN-22-039', '20220316_144258_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'Additional Features - Members List / All Job Reports / Manpower Info / Former Employees Report / Report(ALL) for SMs / Photo Gallery: Users can see group photos of every BU', '09 Web Development', '09-0002', 'Screenshot 2022-03-16 143948.png  -  1.04 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220316_144258_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220316_144258_E464', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'felix, josh', '2022-03-16', '14:42:58', '2022-03-02', '2022-03-21', 100, 'Finished', 'This request was already finished.'),
(40, 'WRN-22-040', '20220318_082423_E355', 0, 'kdtCwayReportPadMarking', 'SYS', 'update report MACRO for AM12SP5', '04 AVEVA Marine', '04-0090', 'Elec_report_problem_SP5_only.xlsx  -  455.56 KB,How to debug a Reporting.xlsx  -  739.91 KB,Reporting problem for AM12SP5.eml  -  1.78 MB,電路製作図用リストv16.repv  -  123.44 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220318_082423_E355', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0090_kdtCwayReportPadMarking/2022/20220318_082423_E355', 'Jommuel De Jesus', 'aganan-kdt@corp.khi.co.jp', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp;', 'jommuel', '2022-03-18', '08:24:23', '2022-03-14', '2022-05-06', 100, 'Finished', 'This request was already finished.'),
(41, 'WRN-22-041', '20220321_085517_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'My Team: Generate Team Reports for Managers', '09 Web Development', '09-0002', 'Screenshot 2022-03-21 085358.png  -  1.13 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220321_085517_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220321_085517_E464', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'felix, josh', '2022-03-21', '08:55:17', '2022-01-27', '2022-03-01', 100, 'Finished', 'This request was already finished.'),
(42, 'WRN-22-042', '20220321_090229_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'Checking Function - function for comparing changes between latest input of employees and database', '09 Web Development', '09-0002', 'Screenshot 2022-03-21 090129.png  -  49.11 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220321_090229_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220321_090229_E464', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'felix, josh', '2022-03-21', '09:02:29', '2022-03-21', '2022-04-01', 100, 'Finished', 'This request was already finished.'),
(43, 'WRN-22-043', '20220322_143625_E464', 0, 'KDT Portal', 'SYS', 'Login page  - login interface for users/Forgot password-function to reset password/Email notification about password changes/Logout function/', '09 Web Development', '09-0007', 'Screenshot 2022-03-22 135738.png  -  44.04 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220322_143625_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0007_KDT Portal/2022/20220322_143625_E464', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'felix, josh', '2022-03-22', '14:36:25', '2022-03-21', '2022-04-04', 100, 'Finished', 'This request was already finished.'),
(44, 'WRN-22-044', '20220322_144646_E212', 0, 'kdtElectricalPartList', 'SYS', 'revised KDS standard item', '04 AVEVA Marine', '04-0088', '20220316-1427 Request to Modify Electrical Parts List.eml  -  2.41 MB,20220316-1720 Re_ Request to Modify Electrical Parts List.eml  -  2.41 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220322_144646_E212', '//kdt-ph/c/WRS/PROJECTS/04 AVEVA Marine/0088_kdtElectricalPartList/2022/20220322_144646_E212', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-22', '14:46:47', '2022-03-23', '2022-03-29', 100, 'Finished', 'This request was already finished.'),
(45, 'WRN-22-045', '20220323_065751_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'Additional Feature - Transportation Info/Reports', '09 Web Development', '09-0002', 'image_xh.png  -  1.13 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220323_065751_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220323_065751_E464', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'Rex Araneta', 'araneta-kdt@corp.khi.co.jp', 'felix, josh', '2022-03-23', '06:57:51', '2022-03-22', '2022-03-30', 100, 'Finished', 'This request was already finished.'),
(46, 'WRN-22-046', '20220330_062857_E212', 4, 'kdtElectricalPartList', 'SYS', 'additional item revised KDS 2021 ', '04 AVEVA Marine', '-', '20220329-1300 Re_ Request to Modify Electrical Parts List.eml  -  305.05 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220330_062857_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-03-30', '06:28:57', '2022-03-30', '2022-04-08', 100, 'Ongoing', 'additional item revised KDS 2021'),
(47, 'WRN-22-047', '20220404_122920_E370', 0, 'KDT Breaktime Music', 'IT', 'Automatic command service for playing Exercise music at 12:01pm in 4ECOM only. Temporary solution while waiting for KDDI Support for Chime music ', '01 Application', '01-0046', 'Edited02_Radio Taiso Exercise Routine - English Language.mp2  -  3.19 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220404_122920_E370', '//kdt-ph/c/WRS/PROJECTS/01 Application/0046_KDT Breaktime Music/2022/20220404_122920_E370', 'Candy Nopra', 'aganan-kdt@corp.khi.co.jp', 'Veronica Mendoza, Erwin Tan', 'mendoza-kdt@corp.khi.co.jp;tan-g1@hg.khi.co.jp;', 'josh, earvinjames', '2022-04-04', '12:29:20', '2022-04-04', '2022-04-05', 100, 'Finished', 'This request was already finished.'),
(48, 'WRN-22-048', '20220406_121628_E464', 0, 'JMR - Web Bulletin Board', 'SYS', 'Additional Feature: Display Announcements on JMR with slideshow format / Control Function for selected users', '09 Web Development', '09-0004', 'jmrbb.png  -  193.37 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220406_121628_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0004_JMR - Web Bulletin Board/2022/20220406_121628_E464', 'Edmon Lazaro', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'felix, josh', '2022-04-06', '12:16:28', '2022-04-04', '2022-04-29', 100, 'Finished', 'This request was already finished.'),
(49, 'WRN-22-049', '20220419_080701_E466', 0, 'Test Project A', 'SYS', 'Test Desc of Project A', '-', '-', 'Test.png  -  132.63 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220419_080701_E466', '-', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'Aaron Godfrey Gamez', 'gamez-kdt@corp.khi.co.jp', 'alvinjohn', '2022-04-19', '08:07:01', '0000-00-00', '0000-00-00', 0, 'Cancelled', 'For testing only '),
(50, 'WRN-22-050', '20220419_103448_E464', 0, 'KDT Breaktime Music', 'SYS', 'New Condition: After last song is played, player will stop.', '01 Application', '01-0046', 'Screenshot 2022-04-19 103140.png  -  19.06 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220419_103448_E464', '//kdt-ph/c/WRS/PROJECTS/01 Application/0046_KDT Breaktime Music/2022/20220419_103448_E464', 'Candy Nopra', 'aganan-kdt@corp.khi.co.jp', 'Nelmar Bong Sabarillo', 'sabarillo-kdt@corp.khi.co.jp;', 'josh', '2022-04-19', '10:34:48', '2022-04-18', '2022-04-19', 100, 'Finished', 'This request was already finished.'),
(51, 'WRN-22-051', '20220419_131858_E466', 13, 'Web Request System', 'SYS', 'General Controls', '09 Web Development', '09-', 'Test.png  -  132.63 KB', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220419_131858_E466', '-', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'alvinjohn', '2022-04-19', '13:19:05', '2022-04-18', '0000-00-00', 24, 'On Hold', 'Doing EE Photo Database Project '),
(52, 'WRN-22-052', '20220425_140104_E370', 0, 'Automatic Play of Last Wednesday Cleaning Announcement', 'IT', 'Automatic command service for playing Last Wednesday Cleaning Announcement in  (1:25pm). This will be installed in 2 KDT-IT Remote PC.', '01 Application', '01-0046', 'Test.txt  -  0 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220425_140104_E370', '//kdt-ph/c/WRS/PROJECTS/01 Application/0046_KDT Breaktime Music/2022/20220425_140104_E370', 'Candy Nopra', 'aganan-kdt@corp.khi.co.jp', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp;', 'josh', '2022-04-25', '14:01:04', '2022-04-26', '2022-05-26', 100, 'Finished', 'This request was already finished.'),
(53, 'WRN-22-053', '20220505_131753_E212', 4, 'kdtPromachDrwgAutoLabel', 'SYS', 'hspool labelling', '', '-', '20220317-1547 Fw_ Macro development list.eml  -  406.71 KB,20220317-1547 Hvac_auto_label.xlsx  -  215.73 KB,20220413-1329 Fw_ Macro development list（HVAC　autolabel）.eml  -  539.04 KB,20220413-1329 Hvac_auto_label_r01.xlsx  -  359.41 KB,kdtpromachDrwgAutoLabel_20220503_hvac label.eml  -  747.01 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220505_131753_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-05', '13:17:53', '2022-03-17', '2022-05-03', 100, 'Ongoing', 'The progress of your request is 100%. \r\nPlease communicate with System Developers if you have any concerns to your request.'),
(54, 'WRN-22-054', '20220506_080722_E212', 5, 'KDT Engineering Manhour Summary', 'SYS', 'april comparison', '01 Application', '01-', '20220503-1057 Monthly MH Report Summary & Comparison Table as of APRIL 2022.eml  -  3.68 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220506_080722_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'Ernesto Lou Veloso', 'veloso-kdt@corp.khi.co.jp', 'edmon, raffy', '2022-05-06', '08:07:22', '2022-05-03', '2022-05-13', 100, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(55, 'WRN-22-055', '20220506_080837_E212', 6, 'kdtElectricalPartList', 'SYS', 'comments', '', '-', '20220421-0944 Re_ kdtElectricalPartList_20220412_KDS2021 add item & KDS1998 weight change.eml  -  541.96 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220506_080837_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon, raffy', '2022-05-06', '08:08:37', '2022-04-21', '2022-05-10', 100, 'Ongoing', 'comment apr21 and pad check'),
(56, 'WRN-22-056', '20220511_133834_E212', 7, 'kdtHvacDrwgAutolabel', 'SYS', 'macro rename from kdtPromachDrwgAutolabel', '04 AVEVA Marine', '-', '20220509-1018 Re_ kdtpromachDrwgAutoLabel_20220503_hvac label.eml  -  206.37 KB,20220509-1102 Fw_ kdtpromachDrwgAutoLabel_20220503_hvac label.eml  -  900.01 KB,20220510-0658 Fw_ kdtpromachDrwgAutoLabel_20220503_hvac label.eml  -  243.89 KB,20220510-0727 Fw_ kdtpromachDrwgAutoLabel_20220503_hvac label.eml  -  1.11 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220511_133834_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', '-', '2022-05-11', '13:38:34', '2022-05-11', '2022-05-11', 100, 'Ongoing', 'macro rename from kdtPromachDrwgAutolabel'),
(57, 'WRN-22-057', '20220518_081136_E212', 8, 'kdtHvacDrwgAutolabel', 'SYS', 'unwanted new view', '04 AVEVA Marine', '-', '20220511-1458 (20220512-1045) Re_ kdtHvacDrwgAutolabel_20220511 macro rename.eml  -  671.83 KB,20220511-1643 (20220518) Re_ kdtHvacDrwgAutolabel_20220511 macro rename.eml  -  842.46 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220518_081136_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-18', '08:11:37', '2022-05-16', '2022-05-18', 100, 'Ongoing', 'unwanted new view. 100% 2022May18'),
(58, 'WRN-22-058', '20220518_081523_E212', 9, 'kdtCablewayBranchSplit', 'SYS', 'legs change description', '04 AVEVA Marine', '04-', '20220513-1017 kdtCablewayBranchSplit FB.eml  -  101.83 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220518_081523_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-18', '08:15:23', '2022-05-18', '2022-05-26', 100, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(59, 'WRN-22-059', '20220519_143929_E355', 14, 'kdtCwayReportPadMarking', 'SYS', 'additional request', '-', '-', 'Re_ Reporting problem for AM12SP5.eml  -  609.54 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220519_143929_E355', '-', 'Jommuel De Jesus', 'dejesus_j-kdt@corp.khi.co.jp', 'Raffy Torio', 'torio-kdt@corp.khi.co.jp;', 'jommuel', '2022-05-19', '14:39:29', '0000-00-00', '0000-00-00', 40, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(60, 'WRN-22-060', '20220527_095721_E212', 10, 'kdtCablewayBranchSplit', 'SYS', 'legs desc info change', '04 AVEVA Marine', '04-', '20220526-1316 (20220527) Re_ kdtCablewayBranchSplit_20220526 fb desc change.eml  -  206.9 KB,20220527-0754 (20220527)  Re_ kdtCablewayBranchSplit_20220526 fb desc change.eml  -  274.69 KB,el.txt  -  13.68 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220527_095721_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-27', '09:57:21', '2022-05-27', '2022-05-27', 100, 'Ongoing', 'The progress of your request is 100%. \r\nPlease communicate with System Developers if you have any concerns to your request.'),
(61, 'WRN-22-061', '20220527_101819_E212', 12, 'kdtElectricalPartList', 'SYS', '-', '04 AVEVA Marine', '04-', '20220519-0753 Re_ kdtElectricalPartList_20220516_sf and rsa correction.eml  -  1.03 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220527_101819_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-27', '10:18:19', '2022-05-26', '2022-05-27', 10, 'On Hold', 'Your request is ON HOLD due to prior requests.'),
(62, 'WRN-22-062', '20220527_105406_E212', 11, 'kdtCablewayBranchSplit', 'SYS', '3 legs desc info  (no macro changes)', '04 AVEVA Marine', '04-', '20220527-1014 Re_ kdtCablewayBranchSplit_20220527 legs desc info change.eml  -  336.62 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220527_105406_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-05-27', '10:54:06', '2022-05-27', '2022-05-27', 100, 'Ongoing', 'no macro changes'),
(63, 'WRN-22-063', '20220531_123035_E261', 0, 'Smart Plant P&ID Software Report', 'CHE', 'This request is mainly regarding the generation of report from Smart Plant P&ID software.', '-', '-', '310SMRY001_RPC_Line List.xlsx  -  419.15 KB,Information for detailed request.xlsx  -  14 KB,KHI-Line List Generated.xlsm  -  357.53 KB,KHI-Line List_Original File.xlsm  -  370.32 KB,Line List_Step 1.xlsm  -  145.44 KB,Line List_Step 1_Remarks.xlsm  -  145.47 KB,P&ID Reference.pdf  -  1.68 MB,SPPID Line List single row.xlsm  -  284.61 KB,SPPID Line List.xlsm  -  85.26 KB,SPPID Pipe Run List.xlsm  -  65.48 KB,Eneos_Equipment List.xlsm  -  465.84 KB,機器リスト_R3_20210527.xlsm  -  1.03 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220531_123035_E261', '-', 'Amor Villamor', 'villamor-kdt@corp.khi.co.jp', 'Edilaine Marose Patron', 'patron-kdt@corp.khi.co.jp;', '-', '2022-05-31', '12:30:36', '2022-10-18', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(64, 'WRN-22-064', '20220531_142053_E352', 14, 'ABEITA', 'ENV', 'Macro Modification', '03 Microsoft Excel', '03-', 'Exxxxx-71xxx1_Ver.2.4.xlsm  -  419.33 KB,Macro Modification for Ver.2.4.xlsx  -  29.87 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220531_142053_E352', '-', 'John David Ducay', 'ducay-kdt@corp.khi.co.jp', 'Gene Owen Argente', 'argente-kdt@corp.khi.co.jp;', 'earvinjames', '2022-05-31', '14:20:53', '2022-06-09', '2022-06-10', 95, 'Waiting', 'Waiting for comments / documents.'),
(65, 'WRN-22-065', '20220610_080622_E212', 14, 'kdtInternetMsEdge', 'SYS', 'switch IE to MsEdge', '04 AVEVA Marine', '04-', '20220609-0928 Macro fixes due to switching from Internet Explorer to Microsoft Edge.eml  -  104.62 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220610_080622_E212', '-', 'Edmon Lazaro', 'lazaro-kdt@corp.khi.co.jp', 'None', 'None;', 'edmon', '2022-06-10', '08:06:22', '2022-06-10', '0000-00-00', 5, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(66, 'WRN-22-066', '20220622_082229_E37', 0, 'JMR', 'ENE', 'Careless Mistakes Summary Report', '-', '-', 'Engineering Careless Mistake_Gen. Summary_May22.xlsx  -  210.27 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220622_082229_E37', '-', 'Ferdinand Llanes', 'llanes-kdt@corp.khi.co.jp', 'Bryan Jay Cano', 'cano-kdt@corp.khi.co.jp;', '-', '2022-06-22', '08:22:29', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(67, 'WRN-22-067', '20220629_152145_E464', 0, 'KDT Portal - Admin Controls', 'SYS', 'Create Webpage for adding new employees, modifying KDT business units, and modifying KDT designations in the web database', '09 Web Development', '09-0007', 'admincontrolssample.png  -  32.47 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220629_152145_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0007_KDT Portal/2022/20220629_152145_E464', 'Joshua Mari Coquia', 'aganan-kdt@corp.khi.co.jp', 'Felix Edwin Petate', 'petate-kdt@corp.khi.co.jp;', '-', '2022-06-29', '15:21:45', '2022-06-06', '2022-06-13', 100, 'Finished', 'This request was already finished.'),
(68, 'WRN-22-068', '20220802_075006_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'Additional Function - Check if user has modified inputs in Group History, Job History, Dispatch History, and Training History', '09 Web Development', '09-0002', 'Screenshot 2022-08-01 144248.png  -  32.58 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220802_075006_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220802_075006_E464', 'Joshua Mari Coquia', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', '-', '2022-08-02', '07:50:06', '2022-07-29', '2022-08-01', 100, 'Finished', 'This request was already finished.'),
(69, 'WRN-22-069', '20220812_081358_E409', 0, 'KDT Screen Time', 'SYS', 'Count time elapsed per software.', '01 Application', '01-0032', 'CEM KDT Screen Time.sln  -  1.13 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220812_081358_E409', '//kdt-ph/c/WRS/PROJECTS/01 Application/0032_KDT Screen Time/2022/20220812_081358_E409', 'Earvin James Dela Cruz', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', '-', '2022-08-12', '08:13:58', '2022-08-08', '2022-08-12', 100, 'Finished', 'This request was already finished.'),
(70, 'WRN-22-070', '20220819_131559_E295', 14, 'CATIA Macros for KAIZEN 2022 (Request to Solutions Group)', 'MH', 'Macros of CATIA for MAH Group ', '02 CATIA', '02-', 'CATIA Macros for KAIZEN 2022 (Request to Solutions Group).pdf  -  852.98 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220819_131559_E295', '-', 'Rex Moreno', 'moreno-kdt@corp.khi.co.jp', 'Ysabel Cordova', 'cordova-kdt@corp.khi.co.jp;', 'earvinjames', '2022-08-19', '13:15:59', '2022-09-14', '0000-00-00', 20, 'On Hold', 'No available Macro programmers.'),
(71, 'WRN-22-071', '20220825_155727_E409', 0, 'CHE.SmartPlantP&IDReport', 'SYS', 'Excel macro', '-', '-', 'Line List_Step 1\'\'_Edmon.xlsm  -  149.85 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220825_155727_E409', '-', 'Earvin James Dela Cruz', 'delacruz-kdt@corp.khi.co.jp', 'Edilaine Marose Patron', 'patron-kdt@corp.khi.co.jp;', 'earvinjames', '2022-08-25', '15:57:27', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(72, 'WRN-22-072', '20220825_155808_E409', 14, 'KDT ScreenTime', 'SYS', 'Counter for software used', '-', '-', 'CEM KDT Screen Time.sln  -  1.13 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220825_155808_E409', '-', 'Earvin James Dela Cruz', 'delacruz-kdt@corp.khi.co.jp', 'None', 'None;', 'earvinjames', '2022-08-25', '15:58:08', '2022-08-22', '2022-09-16', 75, 'Ongoing', 'Debugging of missing data in logs tab. \r\nRevision of data sync.\r\nInvestigation for insufficient total time for other users.\r\n'),
(73, 'WRN-22-073', '20220908_081847_E464', 0, 'Web QMS - Quality Management System', 'SYS', 'Additional Feature - Certification Report(JLPT)', '09 Web Development', '09-0002', 'Screenshot 2022-09-08 081723.jpg  -  167.01 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220908_081847_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0002_Web QMS - Quality Management System/2022/20220908_081847_E464', 'Artemio Roel Becina', 'aganan-kdt@corp.khi.co.jp', 'None', 'None;', 'josh, felix', '2022-09-08', '08:18:47', '2022-09-05', '2022-09-06', 100, 'Finished', 'This request was already finished.'),
(74, 'WRN-22-074', '20220919_132943_E307', 0, 'SURVEY: Jacket or Tumbler', 'IT', 'Survey all KDT members for yearly gift (Jacket or Tumbler) -request by Ma\'am Anne', '-', '-', 'SURVEY.txt  -  0.08 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20220919_132943_E307', '//157.116.72.26/WebRequest/WRS/PROJECTS/09 Web Development/0006_SURVEY: Jacket or Tumbler/2022/20220919_132943_E307', 'Veronica Mendoza', 'mendoza-kdt@corp.khi.co.jp', 'None', 'None;', '-', '2022-09-19', '13:29:43', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(75, 'WRN-22-075', '20221004_144504_E464', 27, 'KDT Website', 'SYS', 'New KDT Website - http://www.kdt.com.ph/', '-', '-', 'kdtweb.jpg  -  219.77 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221004_144504_E464', '-', 'Joshua Mari Coquia', 'coquia-kdt@corp.khi.co.jp', 'Erwin Tan', 'tan-g1@hg.khi.co.jp;', 'felix, collene', '2022-10-04', '14:45:10', '2022-10-12', '0000-00-00', 0, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(76, 'WRN-22-076', '20221004_144838_E464', 0, 'KDT Forms', 'SYS', 'Paperless Forms System', '09 Web Development', '09-0009', 'image_46.png  -  54.73 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221004_144838_E464', '//kdt-ph/c/WRS/PROJECTS/09 Web Development/0001_Web Request System (WRS)/2023/20221004_144838_E464', 'Joshua Mari Coquia', 'coquia-kdt@corp.khi.co.jp', 'Erwin Tan', 'tan-g1@hg.khi.co.jp;', 'felix, josh, collene', '2022-10-04', '14:48:38', '2022-09-27', '2023-01-20', 100, 'Finished', 'This request was already finished.'),
(77, 'WRN-22-077', '20221012_152756_E61', 0, 'KDT Cloud Based File Finder', 'ANA', 'Kaizen Entry for EE, Mill and Analysis Group', '-', '-', '7. KDT Info Page (ANA).pptx  -  1.99 MB,9. KDT Cloud System (Mill).pptx  -  2.15 MB,10_Photo Database with Translator Software(EE).pptx  -  4.88 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221012_152756_E61', '-', 'Cezar Balisbis Jr.', 'balisbis-kdt@corp.khi.co.jp', 'Jeffrey Beltran, Jhon Ray Godoy', 'beltran-kdt@corp.khi.co.jp;godoy-kdt@corp.khi.co.j', '-', '2022-10-12', '15:27:56', '0000-00-00', '0000-00-00', 0, 'Cancelled', 'Change Name from \"KDT Cloud Based File Finder\" into \"KDT Cloud Navigator\".'),
(78, 'WRN-22-078', '20221013_103948_E464', 29, 'Web JMR', 'SYS', 'JMR Migration to Web(SQL)', '09 Web Development', '09-', 'image_J4.png  -  2.01 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221013_103948_E464', '-', 'Joshua Mari Coquia', 'coquia-kdt@corp.khi.co.jp', 'None', 'None;', 'josh, felix', '2022-10-13', '10:39:48', '2022-08-16', '0000-00-00', 20, 'Ongoing', 'System group are now doing your request. \r\nYou can monitor here the progress.'),
(79, 'WRN-22-079', '20221014_155436_E61', 34, 'KDT Cloud Navigator', 'ANA', 'Kaizen Entry for EE, Mill and Analysis Group', '09 Web Development', '09-', '7. KDT Info Page (ANA).pptx  -  1.99 MB,9. KDT Cloud System (Mill).pptx  -  2.15 MB,10_Photo Database with Translator Software(EE).pptx  -  4.88 MB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221014_155436_E61', '-', 'Cezar Balisbis Jr.', 'balisbis-kdt@corp.khi.co.jp', 'Jeffrey Beltran, Jhon Ray Godoy', 'beltran-kdt@corp.khi.co.jp;godoy-kdt@corp.khi.co.j', 'alvinjohn', '2022-10-14', '15:54:37', '2022-10-20', '0000-00-00', 22, 'Ongoing', 'Updated Feb. 11, 2023'),
(80, 'WRN-22-080', '20221024_103111_E37', 0, 'JMR CM', 'ENE', 'Automated Careless Mistakes Summary Report', '-', '-', 'CarelessMistake_BOI_20220901-20220930_Summary.xlsx  -  309.1 KB,Engineering Careless Mistake_Gen. Summary_SEPT.22.xlsx  -  221.41 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221024_103111_E37', '-', 'Ferdinand Llanes', 'llanes-kdt@corp.khi.co.jp', 'None', 'None;', '-', '2022-10-24', '10:31:12', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(81, 'WRN-22-081', '20221124_102346_E314', 0, 'Cable Tray MTO for E3D', 'EE', 'Modification of the \"Kdt.CableTray.MTO.dll\" to run on E3D software and modify \"KDTCableTrayList\" pmlform to choose tray description from excel file \"CTCODE1 or CTCODE2 \".', '-', '-', 'CABLE TRAY MTO.xls  -  95 KB,CTCODE1.csv  -  7.96 KB,CTCODE2.csv  -  1.79 KB,Kdt.CableTray.MTO.dll  -  18 KB,KDTCableTrayList.pmlfrm  -  71.21 KB,KDTDictionary.pmlobj  -  3.93 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221124_102346_E314', '-', 'Dickenson Sangalang', 'sangalang_d-kdt@corp.khi.co.jp', 'Francis Martee Gulapa', 'gulapa-kdt@corp.khi.co.jp;', '-', '2022-11-24', '10:23:46', '0000-00-00', '0000-00-00', 0, 'Pending', 'Your request is on queue.'),
(82, 'TEST-22-1', '20221208_144735_E466', 0, 'TEST ONLY!', 'SYS', 'TEST ONLY!!', '02 CATIA', '02-0001', '1.png  -  13.65 KB,3.png  -  21.36 KB,4.png  -  47.1 KB,', '\\\\kdt-ph\\c\\WRS\\UPLOADS\\2022\\20221208_144735_E466', '//kdt-ph/c/WRS/PROJECTS/02 CATIA/0001_TEST ONLY!/2022/20221208_144735_E466', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'Earvin James Dela Cruz', 'delacruz-kdt@corp.khi.co.jp;', '-', '2022-12-08', '14:47:35', '2022-12-15', '2022-12-06', 0, 'Cancelled', 'This request was already finished.'),
(83, 'TEST-22-1', '20221208_145209_E466', 0, 'TEST', 'SYS', 'TEST', '01 Application', '01-', '6.png  -  105.01 KB,7.jfif  -  9.94 KB,8.png  -  56.44 KB,9.png  -  286.51 KB,', '\\\\kdt-ph\\C\\WRS\\Uploads\\2022\\20221208_145209_E466', '//157.116.25.159/c/WRS/PROJECTS/01 Application/0016_TEST/2022/20221208_145209_E466', 'Alvin John Aganan', 'aganan-kdt@corp.khi.co.jp', 'Rizchelle Reyes', 'reyes_r-kdt@corp.khi.co.jp;', '-', '2022-12-08', '14:52:09', '2022-12-14', '2022-12-14', 0, 'Cancelled', 'For testing only');

-- --------------------------------------------------------

--
-- Stand-in structure for view `systems group`
-- (See below for the actual view)
--
CREATE TABLE `systems group` (
`ID` int(11)
,`EmployeeID` int(10)
,`FullName` varchar(50)
,`UserName` varchar(30)
,`PC` varchar(20)
,`Email` varchar(50)
,`BusinessUnit` varchar(50)
,`Designation` varchar(20)
,`AccessType` int(3)
,`Access` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `systems group`
--
DROP TABLE IF EXISTS `systems group`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `systems group`  AS SELECT `employee_list`.`ID` AS `ID`, `employee_list`.`EmployeeID` AS `EmployeeID`, `employee_list`.`FullName` AS `FullName`, `employee_list`.`UserName` AS `UserName`, `employee_list`.`PC` AS `PC`, `employee_list`.`Email` AS `Email`, `employee_list`.`BusinessUnit` AS `BusinessUnit`, `employee_list`.`Designation` AS `Designation`, `employee_list`.`AccessType` AS `AccessType`, `employee_list`.`Access` AS `Access` FROM `employee_list` WHERE `employee_list`.`BusinessUnit` like '%SYS%' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_units`
--
ALTER TABLE `business_units`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `control_locationpath`
--
ALTER TABLE `control_locationpath`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employee_list`
--
ALTER TABLE `employee_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `request_list`
--
ALTER TABLE `request_list`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_units`
--
ALTER TABLE `business_units`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `control_locationpath`
--
ALTER TABLE `control_locationpath`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employee_list`
--
ALTER TABLE `employee_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `request_list`
--
ALTER TABLE `request_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
