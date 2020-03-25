<?php
	require_once 'connection.php';
	
	if(isset($_POST['change-pass'])) {
		$emp_no = $_POST['emp-no'];
		$current_pass = $_POST['current-password'];
		$new_pass = $_POST['new-password'];
		
		if($emp_no != '' && $current_pass != '' && $new_pass != '') {
			$result = mysql_query("select * from users_login1 where emp_no = '$emp_no'");
			$rows = mysql_num_rows($result);
			if($rows == 1) {
				$tuple = mysql_fetch_array($result);
				if($current_pass == $tuple['password']) {
					mysql_query("update users_login1 set password = '$new_pass' where emp_no = '$emp_no'");
					$message = "<span style='color: green;'>Password Changed</span>";
					header("refresh: 1.5; url=login.php");
				}
				else {
					$message = "*Invalid Fields";
					header("refresh: 1.5; url=change-password.php");
				}
			}
			else {
				$message = "*Invalid Emp No.";
				header("refresh: 1.5; url=change-password.php");
			}
		}
		else {
			$message = "*Invalid Fields";
			header("refresh: 1.5; url=change-password.php");
		}
	}
?>

<html>
	<head>
		<title>DMS - Change Password</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		<nav>
			<a href="#" class="home-btn"></a>
			<a href="login.php" class="logout-btn">Back</a>
		</nav>
		
		<section class="login" style="padding-top: 100px;">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<form action="change-password.php" method="post" class="text-center">
						  <div class="form-group">
							<label for="username" style="width: 185px;">Employee Number<span class="star">*</span></label>
							<input type="number" class="form-control" id="username" name="emp-no">
						  </div>
						  <div class="form-group">
							<label for="password" style="width: 185px;">Current Password<span class="star">*</span></label>
							<input type="password" class="form-control" id="password" name="current-password">
						  </div>
						  <div class="form-group">
							<label for="password" style="width: 185px;">New Password<span class="star">*</span></label>
							<input type="password" class="form-control" id="password" name="new-password">
						  </div>
						  <div class="form-group">
							<label style="width: 160px;"></label>
							<button type="submit" class="btn btn-primary" name="change-pass">Change Password</button>
							<span class="login-warning-cp"><?php echo $message; ?></span>
						  </div>
						</form>					
					</div>
				</div>
			</div>
		</section>
		<?php include("footer-absolute.php")?>
	</body>
</html>