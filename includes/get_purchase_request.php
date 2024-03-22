<?php

require "dbconn.php";

$sql = "SELECT * FROM purchase_req_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;
        $data[] = array(
            "ctr" => $ctr,
            "id" => $row['pr_id'],
            "pr_number" => $row['pr_number'],
            "item" => $row['item_name'],
            "qty" => $row['quantity'],
            "uom" => $row['unit_of_measurement'],
            "unitcost" => $row['unit_cost'],
            "amount" => $row['amount'],
            "brand" => $row['brand'],
            "remarks" => $row['remarks'],
            "phase" => $row['phase'],
            "block" => $row['block'],
            "lot" => $row['lot'],
            "status" => ucfirst($row['pr_status'])
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
