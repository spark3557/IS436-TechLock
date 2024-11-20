<!--Savannah Park-->

<!DOCTYPE html>
<html lang="EN">
  <head>
    <title> Register  </title>
	<link rel="stylesheet" type="text/css" href="#" />
  </head>
  <body>

<?php

#connect to mysql database
$db = mysqli_connect("db","Employee_Management","password","Employee_Management");

if (mysqli_connect_errno())
	exit("Error - could not connect to MySQL");

	$email = $_POST["email"];
	$name = $_POST["name"];
	$job =$_POST["job"];
	$date =$_POST["date"];
	$salary=$_POST["salary"];
	$department=$_POST["department"];
    $password = $_POST["password"];
    
	//inserts user form submission into the database
	$constructed_query = "INSERT INTO Account (email_add, full_name, job_position, date_started, salary, department, acc_password)
	VALUES('$email','$name','$job, '$date','$salary','$department,'$password')";
	
	//Execute the query
	$result=mysqli_query($db,$constructed_query);

?>
<!--Leads user to next step(login page) after inserting the data into the database-->
<div class="continue">
<p> Account Registered.</p>
<p><a class="buttoncontinue" href="TechLockLogin.html"> Login Now. </a></p>
</div>
</body>
</html>