-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2020 at 12:43 PM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) ,
  `username` varchar(500) ,
  `loginid` varchar(30) ,
  `password` varchar(100) ,
  `fname` varchar(50) ,
  `lname` varchar(500) ,
  `gender` varchar(500) ,
  `dob` text ,
  `mobileno` text ,
  `addr` varchar(500) ,
  `notes` varchar(200) ,
  `image` varchar(2000) ,
  `created_on` date ,
  `updated_on` date ,
  `role_id` int(11) ,
  `last_login` date ,
  `delete_status` int(11)  DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `loginid`, `password`, `fname`, `lname`, `gender`, `dob`, `mobileno`, `addr`, `notes`, `image`, `created_on`, `updated_on`, `role_id`, `last_login`, `delete_status`) VALUES
(1, 'admin', 'ndbhalerao91@gmail.com', 'aa7f019c326413d5b8bcad4314228bcd33ef557f5d81c7cc977f7728156f4357', 'Nikhil Bhalerao', 'admin', 'Male', '2018-11-26', '9423979339', '<p>Maharashtra, India</p>\r\n', '<p>admin panel</p>\r\n', 'profile.jpg', '2018-04-30', '2019-10-15', 1, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) ,
  `appointmenttype` varchar(25) ,
  `patientid` int(10) ,
  `roomid` int(10) ,
  `departmentid` int(10) ,
  `appointmentdate` date ,
  `appointmenttime` time ,
  `doctorid` int(10) ,
  `status` varchar(10) ,
  `app_reason` text ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`, `delete_status`) VALUES
(1, '', 1, 0, 1, '2020-05-25', '12:00:00', 1, 'Approved', 'Reason of appointment', 0),
(2, '', 1, 0, 2, '2020-05-27', '10:00:00', 1, 'Active', 'reason of appointment', 0),
(3, '', 1, 0, 1, '2020-05-26', '11:11:00', 1, 'Inactive', 'reason', 0),
(4, '', 1, 0, 2, '2020-05-29', '15:00:00', 1, 'Active', 'reason of appointment', 0);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingid` int(10) ,
  `patientid` int(10) ,
  `appointmentid` int(10) ,
  `billingdate` date ,
  `billingtime` time ,
  `discount` float(10,2) ,
  `taxamount` float(10,2) ,
  `discountreason` text ,
  `discharge_time` time ,
  `discharge_date` date 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE `billing_records` (
  `billingservice_id` int(10) ,
  `billingid` int(10) ,
  `bill_type_id` int(10)  COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) ,
  `bill_amount` float(10,2) ,
  `bill_date` date ,
  `status` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) ,
  `departmentname` varchar(100) ,
  `description` text ,
  `status` varchar(10) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`, `delete_status`) VALUES
(1, 'ICU department', 'ICU department for people with serious illness', 'Active', 0),
(2, 'Neurology department', 'neurology department for treating diseases of nervous system', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) ,
  `doctorname` varchar(50) ,
  `mobileno` varchar(15) ,
  `departmentid` int(10) ,
  `loginid` varchar(25) ,
  `password` text ,
  `status` varchar(10) ,
  `education` varchar(25) ,
  `experience` float(11,1) ,
  `consultancy_charge` float(10,2) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`, `delete_status`) VALUES
(1, 'Dr. Akash Ahire', '9423979339', 1, 'akash@gmail.com', 'bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358', 'Active', 'MD', 3.0, 200.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) ,
  `doctorid` int(10) ,
  `start_time` time ,
  `end_time` time ,
  `available_day` varchar(15) ,
  `status` varchar(10) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`, `delete_status`) VALUES
(1, 1, '09:00:00', '12:00:00', '', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manage_website`
--

CREATE TABLE `manage_website` (
  `id` int(11) ,
  `business_name` varchar(600) ,
  `business_email` varchar(600) ,
  `business_web` varchar(500) ,
  `portal_addr` varchar(500) ,
  `addr` varchar(600) ,
  `curr_sym` varchar(600) ,
  `curr_position` varchar(500) ,
  `front_end_en` varchar(500) ,
  `date_format` date ,
  `def_tax` varchar(500) ,
  `logo` varchar(500) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage_website`
--

INSERT INTO `manage_website` (`id`, `business_name`, `business_email`, `business_web`, `portal_addr`, `addr`, `curr_sym`, `curr_position`, `front_end_en`, `date_format`, `def_tax`, `logo`) VALUES
(1, 'Mayuri K', 'mayuri.infospace@gmail.com', '#', '#', '<p>Maharashtra, India</p>\r\n', '$', 'right', '0', '0000-00-00', '0.20', 'logo for hospital system.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) ,
  `medicinename` varchar(25) ,
  `medicinecost` float(10,2) ,
  `description` text ,
  `status` varchar(10) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`, `delete_status`) VALUES
(1, 'Paracetamol', 10.00, 'Medicine description here', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) ,
  `patientid` int(10) ,
  `doctorid` int(10) ,
  `prescriptionid` int(10) ,
  `orderdate` date ,
  `deliverydate` date ,
  `address` text ,
  `mobileno` varchar(15) ,
  `note` text ,
  `status` varchar(10) ,
  `payment_type` varchar(20) ,
  `card_no` varchar(20) ,
  `cvv_no` varchar(5) ,
  `expdate` date ,
  `card_holder` varchar(50) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) ,
  `patientname` varchar(50) ,
  `admissiondate` date ,
  `admissiontime` time ,
  `address` varchar(250) ,
  `mobileno` varchar(15) ,
  `city` varchar(25) ,
  `pincode` varchar(20) ,
  `loginid` varchar(50) ,
  `password` text ,
  `bloodgroup` varchar(20) ,
  `gender` varchar(10) ,
  `dob` date ,
  `status` varchar(10) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`, `delete_status`) VALUES
(1, 'Atul Petkar', '2020-05-25', '11:00:00', 'nashik, maharashtra', '9423979339', 'nashik', '1234', 'atul@gmail.com', 'bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358', 'B+', 'Male', '1995-07-25', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(10) ,
  `patientid` int(10) ,
  `appointmentid` int(10) ,
  `paiddate` date ,
  `paidtime` time ,
  `paidamount` float(10,2) ,
  `status` varchar(10) ,
  `cardholder` varchar(50) ,
  `cardnumber` int(25) ,
  `cvvno` int(5) ,
  `expdate` date 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) ,
  `treatment_records_id` int(10) ,
  `doctorid` int(10) ,
  `patientid` int(10) ,
  `delivery_type` varchar(10)  COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10)  COMMENT 'appointmentid or orderid',
  `prescriptiondate` date ,
  `status` varchar(10) ,
  `appointmentid` int(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) ,
  `prescription_id` int(10) ,
  `medicine_name` varchar(25) ,
  `cost` float(10,2) ,
  `unit` int(10) ,
  `dosage` varchar(25) ,
  `status` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) ,
  `roomtype` varchar(25) ,
  `roomno` int(10) ,
  `noofbeds` int(10) ,
  `room_tariff` float(10,2) ,
  `status` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) ,
  `service_type` varchar(100) ,
  `servicecharge` float(10,2) ,
  `description` text ,
  `status` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_config`
--

CREATE TABLE `tbl_email_config` (
  `e_id` int(21) ,
  `name` varchar(500) ,
  `mail_driver_host` varchar(5000) ,
  `mail_port` int(50) ,
  `mail_username` varchar(50) ,
  `mail_password` varchar(30) ,
  `mail_encrypt` varchar(300) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_config`
--

INSERT INTO `tbl_email_config` (`e_id`, `name`, `mail_driver_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encrypt`) VALUES
(1, 'Upturn India Technologies', 'mail.upturnit.com', 587, 'contact.info@upturnit.com', 'x(ilz?cWumI2', 'sdsad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) ,
  `name` varchar(200) ,
  `display_name` varchar(200) ,
  `operation` varchar(200) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`id`, `name`, `display_name`, `operation`) VALUES
(1, 'repairs', 'Repairs', 'repairs'),
(2, 'create_repair', 'Create Repair	', 'create_repair	'),
(3, 'edit_repair', 'Edit Repair', 'edit_repair'),
(4, 'delete_repair', 'Delete Repair', 'delete_repair'),
(5, 'manage_category', 'Manage Category', 'manage_category'),
(6, 'sales', 'Sales', 'sales'),
(7, 'invoices', 'Invoices', 'invoices'),
(8, 'edit_invoice', 'Edit Invoice', 'edit_invoice'),
(9, 'add_payment', 'Add Payment', 'add_payment'),
(10, 'custom_reports', 'Custom Reports', 'custom_reports'),
(11, 'financial_overview', 'Financial Overview', 'financial_overview'),
(12, 'manage_expense', 'Manage Expense', 'manage_expense'),
(13, 'create_expense', 'Create Expense', 'create_expense'),
(14, 'edit_expense', 'Edit Expense', 'edit_expense'),
(15, 'delete_expense', 'Delete Expense', 'delete_expense'),
(16, 'generate_invoice', 'Generate Invoice', 'generate_invoice'),
(17, 'products', 'Products', 'products'),
(18, 'create_product', 'Create Product', 'create_product'),
(19, 'edit_product', 'Edit Product', 'edit_product'),
(20, 'delete_product', 'Delete Product', 'delete_product'),
(21, 'users', 'Users', 'users'),
(22, 'create_user', 'Create User', 'create_user'),
(23, 'edit_user', 'Edit User', 'edit_user'),
(24, 'delete_user', 'Delete User', 'delete_user'),
(25, 'manage_roles', 'Manage Roles', 'manage_roles'),
(26, 'settings', 'Settings', 'settings'),
(27, 'communication', 'Communication', 'communication'),
(28, 'create_communication', 'Create Communication', 'create_communication'),
(29, 'delete_communication', 'Delete Communication', 'delete_communication'),
(30, 'payroll', 'Payroll', 'payroll'),
(31, 'create_payroll', 'Create Payroll', 'create_payroll'),
(32, 'edit_payroll', 'Edit Payroll', 'edit_payroll'),
(33, 'delete_payroll', 'Delete Payroll', 'delete_payroll'),
(34, 'departments', 'Departments', 'departments'),
(35, 'saved_items', 'Saved Item', 'saved_items'),
(36, 'create_saved_item', 'Create Saved Item', 'create_saved_item'),
(37, 'edit_saved_item', 'Edit Saved Item', 'edit_saved_item'),
(38, 'delete_saved_item', 'Delete Saved Item', 'delete_saved_item'),
(39, 'dashboard', 'Dashboard', 'dashboard'),
(40, 'clients_statistics', 'Clients Statistics', 'clients_statistics'),
(41, 'invoices_statistics', 'Invoices Statistics', 'invoices_statistics'),
(42, 'repairs_statistics', 'Repairs Statistics', 'repairs_statistics'),
(43, 'financial_overview_graph', 'Financial Overview Graph', 'financial_overview_graph'),
(44, 'calendar', 'Calendar', 'calendar');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_role`
--

CREATE TABLE `tbl_permission_role` (
  `id` int(30) ,
  `permission_id` int(30) ,
  `role_id` int(30) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permission_role`
--

INSERT INTO `tbl_permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 1, 2),
(46, 2, 2),
(47, 6, 2),
(48, 9, 2),
(49, 12, 2),
(50, 17, 2),
(51, 35, 2),
(52, 39, 2),
(53, 40, 2),
(54, 41, 2),
(55, 42, 2),
(56, 43, 2),
(57, 44, 2),
(236, 34, 4),
(237, 1, 3),
(238, 2, 3),
(239, 3, 3),
(240, 4, 3),
(241, 5, 3),
(242, 6, 3),
(243, 7, 3),
(244, 8, 3),
(245, 9, 3),
(246, 10, 3),
(247, 13, 3),
(248, 14, 3),
(249, 17, 3),
(250, 18, 3),
(251, 26, 3),
(252, 27, 3),
(253, 28, 3),
(254, 29, 3),
(255, 34, 3),
(256, 35, 3),
(257, 36, 3),
(258, 37, 3),
(259, 38, 3),
(260, 39, 3),
(261, 40, 3),
(262, 41, 3),
(263, 42, 3),
(264, 43, 3),
(265, 44, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) ,
  `role_name` varchar(200) ,
  `slug` varchar(500) ,
  `delete_status` int(11)  DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `role_name`, `slug`, `delete_status`) VALUES
(1, 'Admin', 'admin', 0),
(2, 'client', 'client', 0),
(3, 'Technicians', 'technicians', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_config`
--

CREATE TABLE `tbl_sms_config` (
  `id` int(11) ,
  `sms_username` varchar(200) ,
  `sms_password` varchar(200) ,
  `sms_senderid` varchar(200) ,
  `created_at` date ,
  `delete_status` int(11)  DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sms_config`
--

INSERT INTO `tbl_sms_config` (`id`, `sms_username`, `sms_password`, `sms_senderid`, `created_at`, `delete_status`) VALUES
(1, 'nikhilbhalerao007', '123456789', 'UPTURN', '2019-10-10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(11) ,
  `treatmenttype` varchar(25) ,
  `treatment_cost` decimal(10,2) ,
  `note` text ,
  `status` varchar(10) ,
  `delete_status` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`, `delete_status`) VALUES
(1, 'Blood Test', '200.00', 'Treatment note here', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) ,
  `treatmentid` int(10) ,
  `appointmentid` int(10) ,
  `patientid` int(10) ,
  `doctorid` int(10) ,
  `treatment_description` text ,
  `uploads` varchar(100) ,
  `treatment_date` date ,
  `treatment_time` time ,
  `status` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) ,
  `loginname` varchar(50) ,
  `password` varchar(10) ,
  `patientname` varchar(50) ,
  `mobileno` varchar(15) ,
  `email` varchar(50) ,
  `createddateandtime` datetime  DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD PRIMARY KEY (`billingservice_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Indexes for table `manage_website`
--
ALTER TABLE `manage_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_website`
--
ALTER TABLE `manage_website`
  MODIFY `id` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  MODIFY `e_id` int(21)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  MODIFY `id` int(30)  AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  MODIFY `id` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(11)  AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
