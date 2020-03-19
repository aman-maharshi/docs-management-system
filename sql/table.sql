-- phpMyAdmin SQL Dump
-- version 2.7.0-beta1
-- http://www.phpmyadmin.net
-- 
-- Generation Time: Mar 19, 2020 at 01:55 PM
-- Server version: 5.5.52
-- PHP Version: 5.4.16
-- 
-- Database: `docs_management_system`
-- 
-- TABLES:
-- 1. users_login1
-- 2. section
-- 3. dms_add_document
--
--

-- --------------------------------------------------------

-- 
-- Table structure for table `users_login1`
-- 

CREATE TABLE `users_login1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) DEFAULT NULL,
  `cc_no` int(11) DEFAULT NULL,
  `namee` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `section_code` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT 'c4ca4238a0b923820dcc509a6f75849b',
  `mobile` bigint(20) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `level` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- 
-- Example entry for table `users_login1`
-- 

INSERT INTO `users_login1` VALUES (2, 1617834, 7011, 'USERNAME', 'IT', 7, 'abc%123', 9480474244, 'username@host.com', 1);


-- --------------------------------------------------------

-- 
-- Table structure for table `section`
-- 

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) DEFAULT NULL,
  `section_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Example entry for table `section`
-- 

INSERT INTO `section` VALUES (1, 'CIVIL', 1);


-- --------------------------------------------------------

-- 
-- Table structure for table `dms_add_document`
-- 

CREATE TABLE `dms_add_document` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `curr_date` date NOT NULL,
  `doc_date` date NOT NULL,
  `section` varchar(20) NOT NULL,
  `doc_type` varchar(20) NOT NULL,
  `doc_desc` varchar(1024) NOT NULL,
  `remarks` varchar(512) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `user` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;


-- 
-- Example entry for table `dms_add_document`

INSERT INTO `dms_add_document` VALUES (13, '2020-03-13', '2015-07-08', 'CIVIL', 'REGULATORY', 'Letter of TOR', '--', 'Letter to Auth.pdf', 'application/pdf', 'Username '120.0.0.1');
