<?php
require "dbconn.php";
session_start();

$request_type = mysqli_escape_string($conn, $_POST['requestType']);


if ($request_type == "Add_Stock") {
    $data_item = $_POST['data_item'];
    $data_category = $_POST['data_category'];
    $data_uom = $_POST['data_uom'];
    $data_qty = $_POST['data_qty'];
    $data_unitcost = $_POST['data_unitcost'];
    $data_brand = $_POST['data_brand'];
    $data_remarks = $_POST['data_remarks'];

    $item = json_decode($data_item);
    $category = json_decode($data_category);
    $uom = json_decode($data_uom);
    $qty = json_decode($data_qty);
    $unitcost = json_decode($data_unitcost);
    $brand = json_decode($data_brand);
    $remarks = json_decode($data_remarks);

    $user = $_SESSION['username'];

    // Loop and Insert Items 
    for ($i = 0; $i < count($item); $i++) {
        $sql = "INSERT INTO inventory_tbl (item_name, category, stock, unit_of_measurement, unit_cost, brand, remarks, highest_stock) 
                VALUES ('$item[$i]', '$category[$i]', '$qty[$i]', '$uom[$i]', '$unitcost[$i]', '$brand[$i]', '$remarks[$i]', '$qty[$i]')";

        if ($conn->query($sql) === TRUE) {
            echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }
    }
}


if ($request_type == "Add_Purchase_Request") {
    $purchase_num = $_POST['data_purchase_num'];
    $data_item = $_POST['data_item'];
    $data_qty = $_POST['data_qty'];
    $data_uom = $_POST['data_uom'];
    $data_unitcost = $_POST['data_unitcost'];
    $data_amount = $_POST['data_amount'];
    $data_brand = $_POST['data_brand'];
    $data_remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];

    $item = json_decode($data_item);
    $qty = json_decode($data_qty);
    $uom = json_decode($data_uom);
    $unitcost = json_decode($data_unitcost);
    $amount = json_decode($data_amount);
    $brand = json_decode($data_brand);
    $remarks = json_decode($data_remarks);

    $user = $_SESSION['username'];

    for ($i = 0; $i < count($item); $i++) {

        $sql = "INSERT INTO purchase_req_tbl (pr_number, item_name, quantity, unit_of_measurement, unit_cost, amount, brand, remarks, phase, block, lot) 
                VALUES ('$purchase_num', '$item[$i]', '$qty[$i]', '$uom[$i]', '$unitcost[$i]', '$amount[$i]', '$brand[$i]', '$remarks[$i]', '$phase', '$block', '$lot')";

        if ($conn->query($sql) === TRUE) {
            echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }
    }
}


if ($request_type == "Add_Material_Request") {
    $req_slip_number = $_POST['data_request_num'];
    $data_item_id = $_POST['data_item_id'];
    $data_item = $_POST['data_item'];
    $data_qty = $_POST['data_qty'];
    $data_uom = $_POST['data_uom'];
    $remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];
    $requested_by = $_POST['data_requested_by'];
    $date_requested = $_POST['data_date_requested'];
    $approved_by = $_POST['data_approved_by'];
    $date_approved = $_POST['data_date_approved'];
    $intended_for = (isset($_POST['data_intended_for'])) ? $_POST['data_intended_for'] : "";

    $item_id = json_decode($data_item_id);
    $item = json_decode($data_item);
    $qty = json_decode($data_qty);
    $uom = json_decode($data_uom);

    $user = $_SESSION['username'];
    for ($i = 0; $i < count($item); $i++) {

        $sql = "INSERT INTO material_req_tbl (request_slip_no, item_id, item_name, quantity, unit_of_measurement, remarks, phase, block, lot, requested_by, date_requested, approved_by, date_approved, intended_for) 
                VALUES ('$req_slip_number', '$item_id[$i]', '$item[$i]', '$qty[$i]', '$uom[$i]', '$remarks', '$phase', '$block', '$lot', '$requested_by', '$date_requested', '$approved_by', '$date_approved', '$intended_for')";

        if ($conn->query($sql) === TRUE) {
            echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }
    }
}



$conn->close();
