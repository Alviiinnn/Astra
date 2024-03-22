<?php
require "dbconn.php";

$request_type = mysqli_escape_string($conn, $_POST['requestType']);

if ($request_type == "Inventory") {
    $id = $_POST['data_id'];
    $item = $_POST['data_item'];
    $category = $_POST['data_category'];
    $uom = $_POST['data_uom'];
    $qty = $_POST['data_qty'];
    $unitcost = $_POST['data_unitcost'];
    $brand = $_POST['data_brand'];
    $remarks = $_POST['data_remarks'];
    $base_stock_level = 0;
    $level;

    $sql_getHighStock = "SELECT highest_stock FROM inventory_tbl WHERE item_id = '$id'";
    $result = $conn->query($sql_getHighStock);

    if($result->num_rows > 0){
        $row = $result->fetch_assoc();
        $base_stock_level = $row['highest_stock']; 
    }

    $highest_qty = ($qty < $base_stock_level)? $base_stock_level: $qty;
    $percentage_level = ($qty / $base_stock_level) * 100;

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

    $sql = "UPDATE inventory_tbl 
            SET item_name = '$item',
                category = '$category',
                stock = '$qty',
                unit_of_measurement = '$uom',
                unit_cost = '$unitcost',
                brand = '$brand',
                remarks = '$remarks',
                highest_stock = '$highest_qty',
                stock_level = '$level'
            WHERE item_id = '$id'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}

if ($request_type == "Purchase_Request") {
    $id = $_POST['data_id'];
    $pr_num = $_POST['data_pr_num'];
    $item = $_POST['data_item'];
    $qty = $_POST['data_qty'];
    $uom = $_POST['data_uom'];
    $unitcost = $_POST['data_unitcost'];
    $amount = $_POST['data_amount'];
    $brand = $_POST['data_brand'];
    $remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];
    $status = $_POST['data_status'];

    $sql = "UPDATE purchase_req_tbl 
            SET pr_number = '$pr_num',
                item_name = '$item',
                quantity = '$qty',
                unit_of_measurement = '$uom',
                unit_cost = '$unitcost',
                amount = '$amount',
                brand = '$brand',
                remarks = '$remarks',
                phase = '$phase',
                block = '$block',
                lot = '$lot',
                pr_status = '$status'
            WHERE pr_id = '$id'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}

if ($request_type == "Material_Request") {
    $id = $_POST['data_id'];
    $req_slip_num = $_POST['data_req_slip_num'];
    $item_id = $_POST['data_item_id'];
    $item = $_POST['data_item'];
    $qty = $_POST['data_qty'];
    $uom = $_POST['data_uom'];
    $remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];
    $requested_by = $_POST['data_requested_by'];
    $date_requested = $_POST['data_date_requested'];
    $approved_by = $_POST['data_approved_by'];
    $date_approved = $_POST['data_date_approved'];
    $intended_for = $_POST['data_intended_for'];
    $status = $_POST['data_status'];

    $sql = "UPDATE material_req_tbl 
            SET request_slip_no = '$req_slip_num',
                item_id = '$item_id',
                item_name = '$item',
                quantity = '$qty',
                unit_of_measurement = '$uom',
                remarks = '$remarks',
                phase = '$phase',
                block = '$block',
                lot = '$lot',
                requested_by = '$requested_by',
                date_requested = '$date_requested',
                approved_by = '$approved_by',
                date_approved = '$date_approved',
                intended_for = '$intended_for',
                mat_req_status = '$status'
            WHERE mat_req_id = '$id'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();