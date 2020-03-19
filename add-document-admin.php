<?php 
	include 'session-check.php'; 
	require_once 'connection.php';
	
	// fetch sections from sections table and add them to form dropdown
	$result_sec = mysql_query("SELECT section FROM section", $connection);	
	$sec_value = '';
	while($row_sec = mysql_fetch_array($result_sec)) {
		$sec_value .= "<option>".$row_sec['section']."</option>";
	}
	
	$currentDate = date("Y-m-d");
	
	if(isset($_POST['submit'])) {
		$current_date = $currentDate;
		$doc_date = $_POST['doc-date'];
		$section = $_POST['doc-section'];
		$ip = $_SERVER['REMOTE_ADDR'];
		$user = $_SESSION['username'];
		
		// sanitizing document name and description of the user input
		require_once 'sanitize-input.php';
		$doc_type = mysql_entities_fix_string($_POST['doc-type']);
		$doc_desc = mysql_entities_fix_string($_POST['doc-desc']);
		$doc_remarks = mysql_entities_fix_string($_POST['doc-remarks']);
		
		$file = $_FILES['doc-file'];
		$file_name = $_FILES['doc-file']['name'];
		$file_type = $_FILES['doc-file']['type'];
		$file_size = $_FILES['doc-file']['size'];
		$file_source_path = $_FILES['doc-file']['tmp_name'];
		$output_path = "uploads/".$file_name;
		
		if($section == "-- Select --") {
			$section = "--";
		}
		if($doc_type == "-- Select --") {
			$doc_type = "--";
		}
		if($doc_date == '') {
			$doc_date = '--';
		}
		if($doc_remarks == '') {
			$doc_remarks = '--';
		}
		
		
		if($doc_type != '' && $doc_desc != '' && $file_name != '') {
			$result = mysql_query("select * from dms_add_document where file_name = '$file_name'");
			$rows= mysql_num_rows($result);	
			if($rows) {
				$message = "* File Already Present";
				header("refresh: 2; url=add-document.php");
			}
			else {
				// upload file and save details to the backend table
				move_uploaded_file($file_source_path, $output_path);
			
				mysql_query("insert into dms_add_document (curr_date, doc_date, section, doc_type, doc_desc, remarks, file_name, file_type, user, ip) 
				values ('$current_date', '$doc_date', '$section', '$doc_type', '$doc_desc', '$doc_remarks', '$file_name', '$file_type', '$user', '$ip')");
				
				$message = "<span style='color: green;'>File Added</span>";
				// header("refresh: 2; url=add-document.php");
			}
		}
		else {
			$message = "* Invalid Fields";
			header("refresh: 2; url=add-document.php");
		}
	}
	if(isset($_POST['reset'])) {
		header("location: add-document.php");
	}
?>


<html>
	<head>
		<title>DMS - Add Document</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		<nav>
			<a href="#" class="home-btn">Home</a>
			<div>
				<a href="options.php" class="back-btn">Back</a>
				<a href="logout.php" class="logout-btn">Logout</a>
			</div>
		</nav>
		<section class="add-document-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2"> 
						<form action="add-document-admin.php" method="post" enctype="multipart/form-data">
						  <div class="form-group">
							<label>Document Date</label>
							<input type="date" class="form-control custom-input" name="doc-date">
							<span class="curr-date"><?php echo date("d-m-Y", strtotime($currentDate)); ?></span>
						  </div>
						  <div class="form-group">
							<label>Section</label>
							<select class="form-control custom-input" name="doc-section">
								<option>-- Select --</option>
								<?php echo $sec_value ?>
							</select>
						  </div>
						  <div class="form-group">
							<label>Document Type<span class="star">*</span></label>
							<select class="form-control custom-input" name="doc-type">
								<option>-- Select --</option>
								<option>REPORTS</option>
								<option>INSTRUCTIONS</option>
								<option>MANUALS</option>
								<option>PROCEDURES</option>
								<option>LETTERS</option>
								<option>TENDER</option>
								<option>REGULATORY</option>
								<option>LAYOUTS</option>
								<option>OTHERS</option>
							</select>
						  </div>
						  <div class="form-group">
							<label>Document Description<span class="star">*</span></label>
							<textarea type="text" class="form-control" name="doc-desc" style="height: 80px;"></textarea>
						  </div>
						  <div class="form-group">
							<label>Remarks</label>
							<textarea type="text" class="form-control" name="doc-remarks" style="height: 50px;"></textarea>
						  </div>
						  <div class="form-group">
							<label>Attach Document<span class="star">*</span></label>
							<input type="file" name="doc-file" class="file-select">
						  </div>
						  <div class="form-group">
							<label></label>
							<button type="submit" class="btn btn-primary" name="submit">Submit</button>
							<span class="login-warning-two"><?php echo $message; ?></span>
							<button type="submit" class="btn btn-danger" name="reset" style="margin-left: auto;">Reset</button>
						  </div>
						</form>	
					</div>
				</div>
			</div>
		</section>
		<?php include("footer-absolute.php")?>
		
	</body>
</html>