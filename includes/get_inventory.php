<?php

require "dbconn.php";

$sql = "SELECT * FROM inventory_tbl";
$result = $conn->query($sql);
$data = array();
$ctr = 0;
$level;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $ctr++;
        $stock_qty = $row['stock'] . " " . $row['unit_of_measurement'];
        $percentage_level = ($row['stock'] / $row['highest_stock'])*100;
        $percent = round($percentage_level, 2)."%";

        if($percentage_level <= 20){
            $level = "Critical";
        }else if($percentage_level >= 21 && $percentage_level <= 40){
            $level = "Minimum";
        }else if($percentage_level >= 41 && $percentage_level <= 60){
            $level = "Safe";
        }else if($percentage_level >= 61 && $percentage_level <= 100){
            $level = "Maximum";
        }else{
            $level = "";
        }

        $data[] = array(
            "ctr" => $ctr,
            "id" => $row['item_id'],
            "item" => $row['item_name'],
            "category" => $row['category'],
            "quantity" => $row['stock'],
            "stock_qty" => $stock_qty,
            "uom" => $row['unit_of_measurement'],
            "stock_level" => $level,
            "unitcost" => $row['unit_cost'],
            "brand" => $row['brand'],
            "remarks" => $row['remarks'],
            "highest_stock" => $row['highest_stock'],
            "percentage_level" => $percent
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
