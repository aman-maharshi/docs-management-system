<?php
	$un = $_SESSION['username'];
	if ($un) { // do nothing
		$loggedin = true;
	}
	else { // if session is not set redirect user back to login
		header("location: login.php");
	}
?>