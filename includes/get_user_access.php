<?php

require "dbconn.php";

$sql = "SELECT * FROM user_access_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;

        $data[] = array(
            "ctr" => $ctr,
            "username" => $row['username'],
            "inventory" => $row['inventory'],
            "purchase" => $row['purchase'],
            "withdrawal" => $row['withdrawal'],
            "delivery" => $row['delivery'],
            "user_access" => $row['user_access'],
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

