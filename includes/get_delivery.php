<?php

require "dbconn.php";

$sql = "SELECT * FROM delivery_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;
        $data[] = array(
            "ctr" => $ctr,
            "id" => $row['delivery_id'],
            "pr_number" => $row['pr_number'],
            "item" => $row['item_name'],
            "qty" => $row['quantity'],
            "uom" => $row['uom'],
            "date_of_delivery" => $row['date_of_delivery'],
            "dr_number" => $row['delivery_receipt_num'],
            "supplier" => $row['supplier'],
            "status" => $row['delivery_status']
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
