<?php

require "dbconn.php";

$requestType = $_POST['requestType'];

if($requestType == "Access_Control"){
    $username = $_POST['username'];

    $sql = "SELECT * FROM user_access_tbl WHERE username = '$username'";
    $result = $conn->query($sql);
    $data = array();
    
    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
    
            $data[] = array(
                "username" => $row['username'],
                "purchase" => $row['purchase'],
                "delivery" => $row['delivery'],
                "inventory" => $row['inventory'],
                "withdrawal" => $row['withdrawal'],
                "user_access" => $row['userccess'],
                "user_management" => $row['user_management']
            );
        }
    } else {
        echo "0 results";
    }
    $conn->close();
    
    // Set content type as JSON
    header('Content-Type: application/json');
    
    // Encode data as JSON and echo the response
    echo json_encode($data);
}



