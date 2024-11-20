<!--Savannah Park-->

<!DOCTYPE html>
<html lang="EN">
  <head>
    <title> Login  </title>
	<link rel="stylesheet" type="text/css" href="#" />
  </head>
  <body>

<?php
session_start();

#connect to mysql database
$db = mysqli_connect("db","Employee_Management","password","Employee_Management");

if (mysqli_connect_errno())
	exit("Error - could not connect to MySQL");
$email = htmlspecialchars($_POST['email']);
$password = htmlspecialchars($_POST['password']);
		
$email = mysqli_real_escape_string($db,$_POST["email"]);
$password = mysqli_real_escape_string($db, $_POST["password"]);

if(empty($email)) {
	//Missing email.
					?>
	<p> Please enter a valid email address! </p>
	<?php
				}
	else {
	if(empty($password)) {
	//Missing password.
						?>
		<p>  Please enter password! </p>
						<?php
					}
		else {
//Selects the data from the database
$constructed_query = "SELECT * FROM Account WHERE email='$email' AND password='$password'";

//Execute the query
	$result=mysqli_query($db,$constructed_query);
	//$row = mysqli_fetch_array($result,MYSQLI_ASSOC);

if(mysqli_num_rows($result) === 1) {
	#Retrieving result from database.
$row = mysqli_fetch_assoc($result);
	#Verifying that email and password match.
if($row['email'] === $email && $row['password'] === $password) {
	//Successful login.
$_SESSION['email']=$email;
header("location: account.php");
}
else{ header("location: TechLockLogin.html");
  }
}
else {
//Unsuccessful login.
header("location: TechLockLogin.html");
	}
		}
	}

 
?>

</body>
</html>