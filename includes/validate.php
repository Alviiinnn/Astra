<?php

require "dbconn.php";

$fname = mysqli_escape_string($conn, $_POST['fname']);
$lname = mysqli_escape_string($conn, $_POST['lname']);
$username = mysqli_escape_string($conn, $_POST['username']);
$password = mysqli_escape_string($conn, $_POST['password']);

$hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 12]);

$sql_username = "SELECT user_name FROM user_tbl WHERE user_name = '$username'";
$result = $conn->query($sql_username);

if ($result->num_rows == 0) {
    $sql = "INSERT INTO user_tbl (user_name, user_password, temp_password, first_name, last_name, user_status)
        VALUES ('$username', '$hash', '$password', '$fname', '$lname', 'Active') ";

    if ($conn->query($sql) === TRUE) {
        echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: user-management.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Username already_exists!";   //DO NOT REMOVE THE WORD 'exists' | Reference: user-management.js
}
