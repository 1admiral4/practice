<html>
<head>
	<title>Add Data</title>
</head>

<body>
<?php
//including the database connection file
include_once("config.php");

if(isset($_POST['Submit'])) {	
	$oNo = $_POST['oNo'];
	$pname = $_POST['pname'];
	$pprice = $_POST['pprice'];
	$users = $_POST['users'];
	$cname = $_POST['cname'];
		
	// checking empty fields
	if(empty($oNo) || empty($pname) || empty($pprice) || empty($users) || empty($cname)) {
				
		if(empty($oNo)) {
			echo "<font color='red'>Order Number field is empty.</font><br/>";
		}
		
		if(empty($pname)) {
			echo "<font color='red'>Product field is empty.</font><br/>";
		}
		
		if(empty($pprice)) {
			echo "<font color='red'>Price field is empty.</font><br/>";
		}
		
		if(empty($users)) {
			echo "<font color='red'>UserName field is empty.</font><br/>";
		}
		
		if(empty($cname)) {
			echo "<font color='red'>Customer field is empty.</font><br/>";
		}
		
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		// if all the fields are filled (not empty) 
			
		//insert data to database		
		$sql = "INSERT INTO users(oNo, pname, pprice, users, cname) VALUES(:oNo, :pname, :pprice, :users, cname)";
		$query = $dbConn->prepare($sql);
				
		$query->bindparam(':oNo', $oNo);
		$query->bindparam(':pname', $pname);
		$query->bindparam(':pprice', $pprice);
		$query->bindparam(':users', $users);
		$query->bindparam(':cname', $cname);
		$query->execute();
		
		// Alternative to above bindparam and execute
		// $query->execute(array(':name' => $name, ':email' => $email, ':age' => $age));
		
		//display success message
		echo "<font color='green'>Data added successfully.";
		echo "<br/><a href='index.php'>View Result</a>";
	}
}
?>
</body>
</html>
