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

    $sql_userAccess = "INSERT INTO user_access_tbl (username, purchase, delivery, inventory, withdrawal, user_access, user_management)
        VALUES ('$username', 'None', 'None', 'View', 'None', 'None', 'None')";

    if ($conn->query($sql_userAccess) === TRUE) {
        echo "Insert User_Access_Success!"; //DO NOT REMOVE THE WORD 'User_Access_Success' | Reference: user-access.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }

} else {
    echo "Username already_exists!";   //DO NOT REMOVE THE WORD 'exists' | Reference: user-management.js
}
