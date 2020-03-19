<?php 
	include 'session-check.php'; 
	require_once 'connection.php';
	
	// fetch sections from sections table and add them to form dropdown
	$result_sec = mysql_query("SELECT section FROM section", $connection);	
	$sec_value = '';
	while($row_sec = mysql_fetch_array($result_sec)) {
		$sec_value .= "<option>".$row_sec['section']."</option>";
	}
	
	if(isset($_POST['edit'])) {
		$id = $_POST['id'];
		$result = mysql_query("select * from dms_add_document where id ='$id'");
		$row = mysql_fetch_array($result);
		$date = $row['doc_date'];
		$section = $row['section'];
		$type = $row['doc_type'];
		$desc = $row['doc_desc'];
		$remarks = $row['remarks'];
	}
	
	if(isset($_POST['update'])) {
		$id = $_POST['current-id'];
		$date = $_POST['doc-date'];
		$section = $_POST['doc-section'];
		$type = $_POST['doc-type'];
		$desc = $_POST['doc-desc'];
		$remarks = $_POST['doc-remarks'];
		
		if($desc != '') {
			mysql_query("update dms_add_document set doc_date = '$date', section = '$section', doc_type = '$type', doc_desc = '$desc', remarks = '$remarks' where id = '$id'");
			$message = "<span style='color: green;'>Details Updated</span>";
		}
		else {
			$message = "Invalid Description";
		}
	}
	if(isset($_POST['delete'])) {
		$id = $_POST['current-id'];
		$result = mysql_query("select * from dms_add_document where id = '$id'");
		$row = mysql_fetch_array($result);
		$file_name = $row['file_name'];
		$path = "uploads/".$file_name;
		unlink($path);
		mysql_query("delete from dms_add_document where id ='$id'");
		$message = "Record Deleted";
		
	}
	
?>

<html>
	<head>
		<title>DMS - Edit Upload</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		<nav>
			<a href="options.php" class="home-btn">Home</a>
			<div>
				<a href="search-document.php" class="back-btn">Back</a>
				<a href="logout.php" class="logout-btn">Logout</a>
			</div>
		</nav>
		<section class="add-document-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2"> 
						<form action="edit-upload.php" method="post" enctype="multipart/form-data">
						  <div class="form-group">
							<label>Document Date</label>
							<input type="date" class="form-control custom-input" name="doc-date" value="<?php echo $date;?>">
						  </div>
						  <div class="form-group">
							<label>Section</label>
							<select class="form-control custom-input" name="doc-section">
								<option><?php echo $section;?></option>
								<?php echo $sec_value ?>
							</select>
						  </div>
						  <div class="form-group">
							<label>Document Type<span class="star">*</span></label>
							<select class="form-control custom-input" name="doc-type">
								<option><?php echo $type;?></option>
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
							<textarea type="text" class="form-control" name="doc-desc" style="height: 80px;"><?php echo $desc;?></textarea>
						  </div>
						  <div class="form-group">
							<label>Remarks</label>
							<textarea type="text" class="form-control" name="doc-remarks" style="height: 50px;"><?php echo $remarks;?></textarea>
						  </div>
						  <input type="hidden" name="current-id" value="<?php echo $id;?>">
						  <div class="form-group">
							<label></label>
							<button type="submit" class="btn btn-primary" name="update">Update</button>
							<span class="login-warning-two"><?php echo $message; ?></span>
							<button type="submit" class="btn btn-danger" name="delete" style="margin-left: auto;">Delete Record</button>
						  </div>
						</form>	
					</div>
				</div>
			</div>
		</section>
		<?php include("footer-absolute.php")?>
		
	</body>
</html>