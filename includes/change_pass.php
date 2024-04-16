<?php
require "dbconn.php";

$username = mysqli_escape_string($conn, $_POST['username_changepass']);
$new_password = mysqli_escape_string($conn, $_POST['new_password']);

$hash = password_hash($new_password, PASSWORD_DEFAULT, ['cost' => 12]);

$sql = "UPDATE user_tbl SET user_password='$hash', user_status='Active', temp_password='' WHERE user_name = '$username'";

if ($conn->query($sql) === TRUE) {
    echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: login.js
} else {
    echo "Error " . $sql . "<br>" . $conn->error;
}

$conn->close();

?>