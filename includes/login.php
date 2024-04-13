<?php
session_start();

require "dbconn.php";

$username = mysqli_escape_string($conn, $_POST['username']);
$password = mysqli_escape_string($conn, $_POST['password']);

$sql = "SELECT * FROM user_tbl WHERE user_name = '$username'";

$result = $conn->query($sql);

if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        if($row['user_status'] == 'Active'){
            if(password_verify($password, $row['user_password'])){
                $_SESSION['username'] = $username;
                $_SESSION['firstname'] = $row['first_name'];
                $_SESSION['lastname'] = $row['last_name'];
                
                echo "Password_Accepted!";      //WARNING! Do not change this STRING! //Reference: login.js
            }else{
                echo "Incorrect_Password! ". $row['user_password'];     //WARNING! Do not change this STRING! //Reference: login.js
            }
        }else{
            echo "Disabled_User!";  //WARNING! Do not change this STRING! //Reference: login.js
        }

    }
}else{
    echo "Username_Not_Exists!";    //WARNING! Do not change this STRING! //Reference: login.js
}

?>