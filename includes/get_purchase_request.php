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
            "qty_per_unit" => $row['qty_per_unit'],
            "uom" => $row['unit_of_measurement'],
            "unit_per_batch" => $row['unit_per_batch'],
            "unitcost" => $row['unit_cost'],
            "total_qty" => $row['total_qty'],
            "amount_per_unit" => $row['amount_per_unit'],
            "total_amount" => $row['total_amount'],
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
