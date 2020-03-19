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

	// function to show results when user triggers a search query
	function showResult($rows, $result) {
		echo "<p class='search-success'>".$rows." Records Found</p>";
		echo <<< _END
			<table class='table table-bordered table-striped'>
				<thead>
					<tr>
						<th style='min-width: 65px;'>S. No.</th>
						<th style='min-width: 135px'>Document Date</th>
						<th>Section</th>
						<th style='min-width: 140px;'>Document Type</th>
						<th>Document Description</th>
						<th>Remarks</th>
						<th>File</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
_END;
			$sno = $rows;

			while($rows > 0 ) {
			$tuple = mysql_fetch_array($result);
			$path = "uploads/".$tuple['file_name'];
			//$date = $tuple['date'];
			//$date = date("d-m-Y", strtotime($date));
			$id = $sno - $rows + 1;
			echo 
				"<tr>
					<td>$id</td>
					<td>".$tuple['doc_date']."</td>
					<td>".$tuple['section']."</td>
					<td>".$tuple['doc_type']."</td>
					<td>".$tuple['doc_desc']."</td>
					<td>".$tuple['remarks']."</td>
					<td><a href='$path' target='_blank'>".$tuple['file_name']."</a></td>
					<td>
						<form action=edit-upload.php method=post>
							<input type=hidden name=id value='".$tuple['id']."'>
							<button class='btn btn-xs btn-warning' name=edit>Edit</button>
						</form>
					</td>
				</tr>";
				
			$rows--;
			}
			echo "</tbody>
				</table>";
	}
?>
<html>
	<head>
		<title>DMS - Search Document</title>
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>		
		<?php include("header.php")?>
		<nav>
			<a href="options.php" class="home-btn">Home</a>
			<div>
				<a href="options.php" class="back-btn">Back</a>
				<a href="logout.php" class="logout-btn">Logout</a>
			</div>
		</nav>
		<section class="search-section">
			<div class="container">
				<div class="row">
					<div class="search-bar">
						<form action="search-document-admin.php" method="post">
							<div class="col-sm-10" style="padding: 0;">
								<div class="form-inline">
									<div class="form-group">
										<label style="margin-right: 5px;">From</label>
										<input type="date" class="form-control custom-input" name="from-date">
										<label style="margin: 0 10px;">To</label>
										<input type="date" class="form-control custom-input" name="to-date" value="<?php echo $currentDate;?>">
									</div>
									<div class="form-group">
										<label style="margin: 0 5px;">Section</label>
										<select class="form-control custom-input" name="section" style="width: 170px">
											<option>-- Section --</option>
											<?php echo $sec_value ?>
										</select>
									</div>
									<div class="form-group">
										<label style="margin: 0 5px;">Doc Type</label>
										<select class="form-control custom-input" name="file-type">
											<option>-- All Files --</option>
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
								</div>
								<div class="form-inline">
									<div class="form-group" style="width: 925px;">
										<label style="margin-right: 5px;">Document Description / Remarks Like</label>
										<input style="width: 397px;" type="text" class="form-control" name="doc-name">
									</div>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group" style="display: flex; flex-direction: column; padding: 0 10px;">
									<button type="submit" class="btn btn-primary" name="search" style="margin-bottom: 5px;">Search</button>
									<button type="submit" class="btn btn-danger" name="reset">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
				
		<div class="search-result table-responsive">
			<?php
				if(isset($_POST['search'])) {
					$section = $_POST['section'];
					$from_date = $_POST['from-date'];
					$to_date = $_POST['to-date'];
					$type = $_POST['file-type'];
					
					require_once 'sanitize-input.php';
					$doc_name = mysql_entities_fix_string($_POST['doc-name']);
					
					//1. If 0 field - no fields are set (Show all records)
					if($section == '-- Section --' && $doc_name == '' && $from_date == '' && $type == '-- All Files --') {
						$result = mysql_query("select * from dms_add_document order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found.</p>";
						}
					}
					
					//2. If 1 field - date field is set
					if($from_date != '' && $section == '-- Section --' && $doc_name == '' && $type == "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where doc_date between '$from_date' and '$to_date' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found between ".$from_date." and ".$to_date."</p>";
						}
					}
					
					//3. If 1 field - section field is set
					if($section != '-- Section --' && $doc_name == '' && $from_date == '' && $type == "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where section = '$section' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found for: ".$section."</p>";
						}
					}
					
					//4. If  1 field - document name is set
					if($doc_name != '' && $section == '-- Section --' && $from_date == '' && $type == "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where doc_desc like '%$doc_name%' or remarks like '%$doc_name%' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found with name: ".$doc_name."</p>";
						}
					}
					
					//5. If 1 field - document type is set
					if($doc_name == '' && $section == '-- Section --' && $from_date == '' && $type != '-- All Files --'){
						$result = mysql_query("select * from dms_add_document where doc_type = '$type' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) {
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No ".$type." document found.</p>";
						}
					}
					
					//6. If 2 fields - section and file type are selected
					if($doc_name == '' && $section != '-- Section --' && $from_date == '' && $type != '-- All Files --') {							
						$result = mysql_query("select * from dms_add_document where section = '$section' and doc_type = '$type' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No ".$type." document found for: ".$section."</p>";
						}
					}
					
					//7. If 2 fields -  date and document type are selected
					if($from_date != '' && $section == '-- Section --' && $doc_name == '' && $type != "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where doc_type = '$type' and doc_date between '$from_date' and '$to_date' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found</p>";
						}
					}
					
					//8. If 2 fields - section and document description are set
					if($from_date == '' && $section != '-- Section --' && $doc_name != '' && $type == "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where section = '$section' and doc_desc like '%$doc_name%' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records for `".$doc_name."` in ".$section."</p>";
						}
					}
					
					//9. If 3 fields -  date, section and document type are selected
					if($from_date != '' && $section != '-- Section --' && $doc_name == '' && $type != "-- All Files --") {
						$result = mysql_query("select * from dms_add_document where section = '$section' and doc_type = '$type' and doc_date between '$from_date' and '$to_date' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) { 
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found</p>";
						}
					}
					
					//10. If 4 fields - fromdate, section, type, desc
					if($from_date != '' && $section != '-- Section --' && $type != '-- All Files --' &&  $doc_name != '') {
						$result = mysql_query("select * from dms_add_document where section = '$section' and doc_type = '$type' and doc_desc like '%$doc_name%' and doc_date between '$from_date' and '$to_date' order by doc_date desc");
						$rows = mysql_num_rows($result);
						
						if($rows != 0) {
							showResult($rows, $result);
						}
						else {
							echo "<p class='search-warning'>* No records found for `".$doc_name."` for section ".$section." between the selected dates</p>";
						}
					}
				}
			?>
		</div>
	</body>
</html>