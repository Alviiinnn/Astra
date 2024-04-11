<?php

require "dbconn.php";

$sql = "SELECT * FROM user_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;

        $password = ($row['temp_password'])? $row['temp_password'] : substr($row['user_password'], 0, 50);

        $data[] = array(
            "ctr" => $ctr,
            "id" => $row['user_id'],
            "username" => $row['user_name'],
            "first_name" => $row['first_name'],
            "last_name" => $row['last_name'],
            "password" => $password,
            "status" => $row['user_status']
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

