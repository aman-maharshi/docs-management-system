<?php
	$level = $_SESSION['level'];
	if($level == 1) {
		header("location: search-document-admin.php");
	}
	elseif($level == 2) {
		header("location: search-document-user.php");
	}
	else {
		header("location: login.php");
	}
?>