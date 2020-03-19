<?php
	$level = $_SESSION['level'];
	if($level == 1) {
		header("location: add-document-admin.php");
	}
	elseif($level == 2) {
		header("location: add-document-user.php");
	}
	else {
		header("location: login.php");
	}
?>