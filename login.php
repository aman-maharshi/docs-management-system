<?php
	require_once 'connection.php';

	if(isset($_POST['submit'])){
		require_once 'sanitize-input.php';
		$un = mysql_entities_fix_string($_POST['username']);
		$pw = mysql_entities_fix_string($_POST['password']);
		
		if($un != '' && $pw != '') {
			$result = mysql_query("select * from users_login1 where emp_no = '$un' and password = '$pw'");
			$row_count = mysql_num_rows($result);
			if($row_count == 1) {
				$tuple = mysql_fetch_array($result);
				session_start();
				$_SESSION['username'] = $tuple['namee'];
				$_SESSION['section'] = $tuple['section'];
				$_SESSION['level'] = $tuple['level'];
				header("location: options.php");
				
			}
			else {
				$message = "* Invalid Fields";
			}
		}
		else {
			$message = "* Invalid Fields";
		}
	}
?>
<html>
	<head>
		<title>DMS - Login</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		
		<section class="login">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<form action="login.php" method="post" class="text-center">
						  <div class="form-group">
							<label for="username">Username<span class="star">*</span></label>
							<input type="text" class="form-control" id="username" name="username">
						  </div>
						  <div class="form-group">
							<label for="password">Password<span class="star">*</span></label>
							<input type="password" class="form-control" id="password" name="password">
						  </div>
						  <div class="form-group">
							<label></label>
							<button type="submit" class="btn btn-primary" name="submit">Login</button>
							<span class="login-warning"><?php echo $message; ?></span>
						  </div>
						</form>					
					</div>
				</div>
			</div>
		</section>
		<?php include("footer-absolute.php")?>
	</body>
</html>