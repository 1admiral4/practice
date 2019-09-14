<?php
// including the database connection file
include_once("config.php");

if(isset($_POST['update']))
{	
	$id = $_POST['id'];
	
	$name=$_POST['name'];
	$age=$_POST['age'];
	$email=$_POST['email'];	
	
	// checking empty fields
	if(empty($name) || empty($age) || empty($email)) {	
			
		if(empty($name)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($age)) {
			echo "<font color='red'>Age field is empty.</font><br/>";
		}
		
		if(empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}		
	} else {	
		//updating the table
		$sql = "UPDATE users SET name=:name, age=:age, email=:email WHERE id=:id";
		$query = $dbConn->prepare($sql);
				
		$query->bindparam(':id', $id);
		$query->bindparam(':name', $name);
		$query->bindparam(':age', $age);
		$query->bindparam(':email', $email);
		$query->execute();
		
		// Alternative to above bindparam and execute
		// $query->execute(array(':id' => $id, ':name' => $name, ':email' => $email, ':age' => $age));
				
		//redirectig to the display page. In our case, it is index.php
		header("Location: index.php");
	}
}
?>
<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$sql = "SELECT `oid`, oNo, oquantity, cname, uusername, pname, pid, `uid` FROM orders o
INNER JOIN products p on o.opid = p.pid
INNER JOIN customer c on o.oCid = c.Cid
INNER JOIN users u on o.oUid = u.uId
WHERE `oid`=:id";
$query = $dbConn->prepare($sql);
$query->execute(array(':id' => $id));

while($row = $query->fetch(PDO::FETCH_ASSOC))
{
	$oid = $row['oid'];
	$onumber = $row['oNo'];
	$quantity = $row['oquantity'];
	$product = $row['pname'];
	$customer = $row['cname'];
	$user = $row['uusername'];
}
?>
<html>
<head>	
	<title>Edit Data</title>
</head>

<body>
	<a href="index.php">Home</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit.php">
		<table border="0">
			<tr> 
				<td>Order Number</td>
				<td><input type="text" name="oid" value="<?php echo $oid;?>"></td>
			</tr>
			<tr> 
				<td>Quantity</td>
				<td><input type="text" name="oquantity" value="<?php echo $oquantity;?>"></td>
			</tr>
			<tr> 
				<td>Product</td>
				<td><input type="text" name="pname" value="<?php echo $pname;?>"></td>
			</tr>
			<tr> 
				<td>Customer</td>
				<td><input type="text" name="cname" value="<?php echo $cname;?>"></td>
			</tr>
			<tr> 
				<td>User</td>
				<td><input type="text" name="uusername" value="<?php echo $uusername;?>"></td>
			</tr>
			<tr>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>
