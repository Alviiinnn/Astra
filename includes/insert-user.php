<?php

require "dbconn.php";

$username = mysqli_escape_string($conn, $_POST['username']);
$password = mysqli_escape_string($conn, $_POST['password']);

// Creating a hash  // If you omit the ['cost' => 12] part, it will default to 10
$hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 12]);

$sql = "INSERT INTO user_tbl (user_name, user_password, first_name, last_name, user_access, user_status)
        VALUES ('$username', '$hash', 'Janet', 'Cruz', 'Admin', 'Active');";


//MySQLi Object-Oriented

if($conn->query($sql) === TRUE){
    echo "Insert Success!";
}else{
    echo "Error ".$sql. "<br>" .$conn->error;
}

$conn->close();

?>