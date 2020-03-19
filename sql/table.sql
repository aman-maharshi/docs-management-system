-- phpMyAdmin SQL Dump
-- version 2.7.0-beta1
-- http://www.phpmyadmin.net
-- 
-- Host: 10.32.2.55
-- Generation Time: Mar 19, 2020 at 01:55 PM
-- Server version: 5.5.52
-- PHP Version: 5.4.16
-- 
-- Database: `Web_Kaiga56`
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
-- Dumping data for table `users_login1`
-- 

INSERT INTO `users_login1` VALUES (2, 1617834, 7011, 'VINOD NAYAK', 'IT', 7, 'vrnayak123', 9480474242, 'vrnayak@npcil.co.in', 1);
INSERT INTO `users_login1` VALUES (4, 1604341, 7002, 'K. V. SHETTY', 'PLANNING', 5, 'default123', 9449874107, 'kvshetty@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (5, 1601318, 7003, 'S V GAJANANA', 'CIVIL', 1, 'default123', 9448999140, 'svgajanana@npcil.co.in', 1);
INSERT INTO `users_login1` VALUES (6, 1601288, 7004, 'SATISH B SHETTY', 'CIVIL', 1, 'default123', 9448291738, 'sb_shetty@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (7, 1718631, 7005, 'DEVENDRA KUMAR', 'ELECTRICAL', 2, 'default123', 9448991764, 'devendrakumar@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (8, 1604970, 7006, 'JAKEERAHUSEN AMINSAB ASKI', 'CIVIL', 1, 'default123', 9448999796, 'jaaski@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (9, 1603795, 7007, 'PRABHAKARRAO ASADHI', 'CIVIL', 1, 'default123', 9448100615, 'pasadhi@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (10, 1629431, 7008, 'NUNAVATH MOHAN', 'CIVIL', 1, 'default123', 9480824747, 'n.mohan@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (11, 9136185, 7009, 'J.S.RUHAL', 'PLANNING', 5, 'default123', 9448075162, 'jsruhal@npcil.co.in', 1);
INSERT INTO `users_login1` VALUES (12, 1607995, 7012, 'H. N. RAMESHA', 'CIVIL', 1, 'default123', 8277937891, 'hnramesha@npcil.co.in', 1);
INSERT INTO `users_login1` VALUES (13, 1804006, 7013, 'A M DESNAVI', 'MANAGEMENT', 6, 'default123', 9422036666, 'amdesnavi@npcil.co.in', 1);
INSERT INTO `users_login1` VALUES (14, 1603817, 7014, 'M P KADEMANI', 'ELECTRICAL', 2, 'default123', 9448999145, 'mpkademani@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (16, 1612298, 7016, 'B. N. NAGENDRAKUMAR', 'PLANNING', 5, 'default123', 9449874035, 'bnnkumar@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (17, 1622919, 7017, 'MAHADEV. B. UPARE', 'ELECTRICAL', 2, 'default123', 9448999149, 'mbupare@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (18, 1622072, 7018, 'VIJAYARAVI C SATHI', 'INDUSTRIAL SAFETY\r\n', 8, 'default123', 9448991781, 'sathi@npcil.co.in', 2);
INSERT INTO `users_login1` VALUES (20, 1629431, 7008, 'NUNAVATH MOHAN', 'CIVIL', 1, 'default123', 9480824747, 'n.mohan@npcil.co.in;', 2);


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
-- Dumping data for table `section`
-- 

INSERT INTO `section` VALUES (1, 'CIVIL', 1);
INSERT INTO `section` VALUES (2, 'ELECTRICAL', 2);
INSERT INTO `section` VALUES (3, 'MECHANICAL', 3);
INSERT INTO `section` VALUES (4, 'C & I', 4);
INSERT INTO `section` VALUES (5, 'PLANNING', 5);
INSERT INTO `section` VALUES (6, 'MANAGEMENT', 6);
INSERT INTO `section` VALUES (7, 'IT', 7);
INSERT INTO `section` VALUES (8, 'INDUSTRIAL SAFETY\r\n', 8);
INSERT INTO `section` VALUES (9, 'E & US', 9);
INSERT INTO `section` VALUES (10, 'HR', 10);


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
-- Dumping data for table `dms_add_document`
-- 

INSERT INTO `dms_add_document` VALUES (1, '2020-03-09', '2018-10-17', 'CIVIL', 'OTHERS', 'Technical Sanction (TS) - Construction of IRB', 'Modification Kaiga-3&amp;4 Time Office', 'TS - Construction of IRB & Modification Kaiga-3&4 Time Office.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (5, '2020-03-09', '2020-02-24', 'PLANNING', 'OTHERS', 'Quotation - OSEC INFOSYSTEMS', '--', 'Quotation NPCIL.xls', 'application/vnd.ms-excel', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (6, '2020-03-09', '2020-01-30', 'PLANNING', 'OTHERS', 'Presentation to AERB', '--', 'Presentation  to AERB.ppt', 'application/vnd.ms-powerpoint', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (8, '2020-03-13', '2011-08-17', 'PLANNING', 'REGULATORY', 'DAE In Principle Approval for Kaiga 5&amp;6 2011', '--', '20110817-DAE Approval-In  Principle.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (9, '2020-03-13', '2017-11-16', 'CIVIL', 'REGULATORY', 'NBWL application ', 'Wildlife Clearance Application', 'Application for Wild Life   Clearance for Kaiga 5 & 6 (1).pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (10, '2020-03-13', '2011-09-16', 'PLANNING', 'REGULATORY', 'DAE Approval for Kaiga 5&amp;6 2011', '--', 'DAE approval  letter-Kaiga-5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (11, '2020-03-13', '2019-05-03', 'CIVIL', 'REGULATORY', 'Water Assurance Letter Government of Karnataka', '--', 'GOK letter_Water reassurance.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (12, '2020-03-13', '2011-07-20', 'CIVIL', 'REGULATORY', 'Land approval letter for Kaiga 5&amp;6', '--', 'Land for 5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (13, '2020-03-13', '2015-07-08', 'CIVIL', 'REGULATORY', 'Letter of TOR', '--', 'Letter to MoEFCC on ToR   submission of Kaiga 5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (14, '2020-03-13', '2018-09-14', 'CIVIL', 'REGULATORY', 'Sanction of manpower for construction and O&amp;M for Kaiga 5&amp;6', '--', 'Manpower Sanction KGS-5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (15, '2020-03-13', '2016-10-13', 'CIVIL', 'REGULATORY', 'MOM for Kaiga 5&amp;6 TOR with MECON', '--', 'MoM of Kaiga 5 & 6 ToR with MECON  03.10.16.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (16, '2020-03-13', '2013-12-13', 'CIVIL', 'REGULATORY', 'Proposal for Kaiga 5&amp;6 project in light of MoEFs Directive on Western Ghats', 'Red Zone Exemption letter from NPCIL', 'Proposal for Kaiga-5&6 for  exemtpion from Red Zone for development.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (17, '2020-03-13', '2016-09-06', 'CIVIL', 'REGULATORY', 'Terms of Reference (TOR) - Expansion of capacity of unit', '--', 'ToR for Kaiga 5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (18, '2020-03-16', '2020-03-06', 'PLANNING', 'REPORTS', 'Monthly Report - Feb - 2020', '--', 'Feb_2020.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (19, '2020-03-16', '2020-02-05', 'PLANNING', 'REPORTS', 'Monthly Report - Jan - 2020', '--', 'Jan_2020.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (21, '2020-03-16', '2020-01-03', 'PLANNING', 'REPORTS', 'Monthly Report - Dec - 2019', '--', 'Dec_2019.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (22, '2020-03-16', '2019-12-06', 'PLANNING', 'REPORTS', 'Monthly Report - Nov - 2019', '--', 'Nov_2019.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (23, '2020-03-16', '2019-10-31', 'PLANNING', 'REPORTS', 'Monthly Report - Oct - 2019', '--', 'Oct_2019.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (24, '2020-03-16', '2019-10-09', 'PLANNING', 'REPORTS', 'Monthly Report - Sept - 2019', '--', 'Sept_2019.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (25, '2020-03-16', '2019-09-07', 'PLANNING', 'REPORTS', 'Monthly Report - Aug - 2019', '--', 'Aug_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (26, '2020-03-16', '2019-08-14', 'PLANNING', 'REPORTS', 'Monthly Report - July - 2020', '--', 'July_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (27, '2020-03-16', '2019-07-05', 'PLANNING', 'REPORTS', 'Monthly Report - June - 2019', '--', 'June_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (28, '2020-03-16', '2019-06-06', 'PLANNING', 'REPORTS', 'Monthly Report - May - 2019', '--', 'May_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (29, '2020-03-16', '2019-05-06', 'PLANNING', 'REPORTS', 'Monthly Report - April - 2019', '--', 'Apr_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (30, '2020-03-16', '2019-04-10', 'PLANNING', 'REPORTS', 'Monthly Report - Mar - 2019', '--', 'Mar_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (31, '2020-03-16', '2019-03-08', 'PLANNING', 'REPORTS', 'Monthly Report - Feb - 2019', '--', 'Feb_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (32, '2020-03-16', '2019-02-08', 'PLANNING', 'REPORTS', 'Monthly Report - Jan - 2019', '--', 'Jan_2019.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (33, '2020-03-17', '2019-12-09', 'PLANNING', 'INSTRUCTIONS', 'Project Instructions - 02', '--', 'Project Instructions-reg.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (34, '2020-03-15', '2020-03-15', 'PLANNING', 'MANUALS', 'BCN - 2020 details', '--', 'bcn-BE2020.pdf', 'application/pdf', 'K. V. SHETTY', '10.40.106.194');
INSERT INTO `dms_add_document` VALUES (35, '2020-03-17', '2020-03-17', 'PLANNING', 'MANUALS', 'BCN 2019 - 2020 comparison', '--', 'BCN.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'K. V. SHETTY', '10.40.106.194');
INSERT INTO `dms_add_document` VALUES (36, '2020-03-17', '2018-06-15', 'PLANNING', 'INSTRUCTIONS', 'Project Instructions - 01 - (R-0)', '--', 'Project Instructions1-reg.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (37, '2020-03-17', '2020-03-16', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Mar Week 2 ', '--', '2020_Mar_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (38, '2020-03-17', '2020-03-07', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Mar Week 1', '--', '2020_Mar_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (39, '2020-03-17', '2020-01-06', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Jan Week 1', '--', '2020_Jan_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (40, '2020-03-17', '2020-01-12', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Jan Week 2', '--', '2020_Jan_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (41, '2020-03-17', '2020-01-20', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Jan Week 3', '--', '2020_Jan_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (42, '2020-03-17', '2020-01-27', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Jan Week 4', '--', '2020_Jan_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (43, '2020-03-17', '2020-02-03', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Jan Week 5', '--', '2020_Jan_5.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (44, '2020-03-17', '2020-02-07', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Feb Week 1', '--', '2020_Feb_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (45, '2020-03-17', '2020-02-15', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Feb Week 2', '--', '2020_Feb_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (46, '2020-03-17', '2020-02-22', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Feb Week 3', '--', '2020_Feb_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (47, '2020-03-17', '2020-03-02', 'PLANNING', 'REPORTS', 'Weekly Report - 2020 Feb Week 4', '--', '2020_Feb_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (48, '2020-03-17', '2019-01-15', 'PLANNING', 'REPORTS', 'Weekly Report - 2019 Jan Week 1', '--', '2019_Jan_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (49, '2020-03-17', '2019-01-22', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Jan Week 2', '--', '2019_Jan_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (50, '2020-03-17', '2019-01-28', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Jan Week 3', '--', '2019_Jan_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (51, '2020-03-17', '2019-02-04', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Jan Week 4', '--', '2019_Jan_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (52, '2020-03-17', '2019-02-11', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Feb Week 1', '--', '2019_Feb_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (53, '2020-03-17', '2019-02-19', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Feb Week 2', '--', '2019_Feb_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (54, '2020-03-17', '2019-02-25', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Feb Week 3', '--', '2019_Feb_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (55, '2020-03-17', '2019-03-04', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Feb Week 4', '--', '2019_Feb_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (56, '2020-03-17', '2019-03-11', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Mar Week 1', '--', '2019_Mar_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (57, '2020-03-17', '2019-03-18', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Mar Week 2', '--', '2019_Mar_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (58, '2020-03-17', '2019-03-18', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Mar Week 3', '--', '2019_Mar_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (59, '2020-03-17', '2019-03-25', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Mar Week 4', '--', '2019_Mar_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (60, '2020-03-17', '2019-03-01', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Mar Week 5', '--', '2019_Mar_5.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (61, '2020-03-17', '2019-04-08', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Apr Week 1', '--', '2019_Apr_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (62, '2020-03-17', '2019-04-15', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Apr Week 2', '--', '2019_Apr_2.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (63, '2020-03-17', '2019-04-22', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Apr Week 3', '--', '2019_Apr_3.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (64, '2020-03-17', '2019-04-29', 'PLANNING', 'REPORTS', 'Weekly Report -2019 Apr Week 4', '--', '2019_Apr_4.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (65, '2020-03-17', '2019-05-06', 'PLANNING', 'REPORTS', 'Weekly Report -2019 May Week 1', '--', '2019_May_1.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.117.51');
INSERT INTO `dms_add_document` VALUES (69, '2020-03-19', '2019-07-10', 'PLANNING', 'MANUALS', 'QA Manual for Site Construction ', 'Quality Assurance', 'QA Manual for Site Construction Kaiga-5&6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
INSERT INTO `dms_add_document` VALUES (70, '2020-03-19', '2019-07-04', 'INDUSTRIAL SAFETY', 'MANUALS', 'Construction Safety Management  Manual of Kaiga-5 &amp;6', '--', 'Construction Safety Management  Manual of Kaiga-5 &6.pdf', 'application/pdf', 'VINOD NAYAK', '10.40.106.142');
