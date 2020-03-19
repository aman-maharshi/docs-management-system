<?php include 'session-check.php'; ?>
<html>
	<head>
		<title>DMS - Options</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		<nav>
			<a href="#" class="home-btn">Home</a>
			<a href="logout.php" class="logout-btn">Logout</a>
		</nav>
		<p class="display_un">
		<?php
			echo "Welcome, ".$_SESSION['username']." (".$_SESSION['section'].")"; 
		?>
		</p>
		<section class="options-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<div class="options-box">
							<ul>
								<li><a href="add-document.php">Add Document</a></li>
								<li><a href="search-document.php">Search Document</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<?php include("footer-absolute.php")?>
	</body>
</html>