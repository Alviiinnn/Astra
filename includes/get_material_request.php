<?php

require "dbconn.php";

$sql = "SELECT * FROM material_req_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;
        $data[] = array(
            "ctr" => $ctr,
            "id" => $row['mat_req_id'],
            "request_slip_num" => $row['request_slip_no'],
            "item_id" => $row['item_id'],
            "item" => $row['item_name'],
            "qty" => $row['quantity'],
            "uom" => $row['unit_of_measurement'],
            "remarks" => $row['remarks'],
            "phase" => $row['phase'],
            "block" => $row['block'],
            "lot" => $row['lot'],
            "requested_by" => $row['requested_by'],
            "date_requested" => $row['date_requested'],
            "approved_by" => $row['approved_by'],
            "date_approved" => $row['date_approved'],
            "intended_for" => $row['intended_for'],
            "status" => $row['mat_req_status']
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
