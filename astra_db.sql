-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 06:45 AM
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
(6, 0, 'PR_002', 'Semento', '', 1000, 'bags', 0.00, '', 1000, 'Maximum');

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
  `inventory` varchar(50) NOT NULL,
  `purchase` varchar(50) NOT NULL,
  `withdrawal` varchar(50) NOT NULL,
  `delivery` varchar(50) NOT NULL,
  `user_access` varchar(50) NOT NULL,
  `user_management` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_access_tbl`
--

INSERT INTO `user_access_tbl` (`username`, `inventory`, `purchase`, `withdrawal`, `delivery`, `user_access`, `user_management`) VALUES
('alvin', 'View, Add, Edit, Delete', 'View, Add, Edit, Delete', 'View, Add, Edit, Delete', 'View, Add, Edit, Delete', 'View, Edit', 'View, Add, Edit, Delete');

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
(2, 'alvin', '$2y$12$8BGhmz7DTpAO.WngpmKIR.NnuwyCuEmfxcZ9eIxuDaAD7EBqoOC4.', 'Alvin John', 'Aganan', 'Hello', 'Active', '', '', '', '', ''),
(3, 'john', '$2y$12$G/A31yjvm4K9.4gvlxUYE.iU.EIS8gQCb7GEvj87pDjFTSWwhfcNq', 'Alvin', 'John', 'hehe', 'Active', '', '', '', '', ''),
(4, 'aj', '$2y$12$qYK06LYHL2il4kni5aD5I.3CySXGYZiYBiMO3J9Hkx5Xu/cUvWZ3i', 'AJ', 'Aganan', '123456', 'Active', '', '', '', '', ''),
(6, 'hehi', '$2y$12$d8/vT.B32aTxZHeBDl4R1OYNy2jlR/qt./Pxn/fbma0onmBrynrc6', 'he', 'hi', 'hehi', 'Active', '', '', '', '', ''),
(7, 'alvin5', '$2y$12$VstTSvP3xZzTJsNDCaHQee4xJwnVhd4dQ0raw3eGH6Mva9zeLkucC', 'Alvin', 'John', 'alvin', 'Active', '', '', '', '', ''),
(8, 'bianca', '$2y$12$w8I1t6b6bP88i8ds.1QjPOwtc4mxnpXawpz12cUBxocF94erREpce', 'Bianca', 'De Villa', '123456', 'Active', '', '', '', '', ''),
(9, 'bianca2', '$2y$12$ppJdDYnhSV/LpGgyWbtTlu1Fsb2rsm6WwQL0aXT35ENot20Dq4NPO', 'Bianca', 'Ashly', 'ABC', 'Active', '', '', '', '', '');

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
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
