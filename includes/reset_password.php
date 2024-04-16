<?php
require "dbconn.php";

$username = mysqli_escape_string($conn, $_POST['username']);

$sql = "SELECT * FROM user_tbl WHERE user_name = '$username'";

$result = $conn->query($sql);

if($result->num_rows > 0){
    $sql_reset = "UPDATE user_tbl SET password_reset = 'Yes' WHERE user_name = '$username' ";

    if ($conn->query($sql_reset) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: login.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }

}else{
    echo "Not_Existing!";    //WARNING! Do not change this STRING! //Reference: login.js
}

?>