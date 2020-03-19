<?php
	$dbserver = 'localhost';
	$dbusername = 'root';
	$dbpass = '';
	$dbname = 'docs_management_system';
	
	$connection = mysql_connect($dbserver, $dbusername, $dbpass);
	if(!$connection) die("Unable to connect to MySQL: ".mysql_error());
	mysql_select_db($dbname, $connection) or die("Unable to select database: ".mysql_error());
?>