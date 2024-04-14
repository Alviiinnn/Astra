<?php
session_start();
require "dbconn.php";

$request_type = mysqli_escape_string($conn, $_POST['requestType']);

if ($request_type == "Inventory") {
    $id = $_POST['data_id'];
    $item = $_POST['data_item'];
    $category = $_POST['data_category'];
    $uom = $_POST['data_uom'];
    $qty = $_POST['data_qty'];
    $unitcost = $_POST['data_unitcost'];
    $remarks = $_POST['data_remarks'];
    $base_stock_level = 0;
    $level;

    $sql_getHighStock = "SELECT base_stock FROM inventory_tbl WHERE item_id = '$id'";
    $result = $conn->query($sql_getHighStock);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $base_stock_level = $row['base_stock'];
    }

    // $highest_qty = ($qty < $base_stock_level) ? $base_stock_level : $qty;
    $percentage_level = ($qty / $base_stock_level) * 100;

    if ($percentage_level <= 20) {
        $level = "Critical";
    } else if ($percentage_level >= 21 && $percentage_level <= 40) {
        $level = "Minimum";
    } else if ($percentage_level >= 41 && $percentage_level <= 60) {
        $level = "Safe";
    } else if ($percentage_level >= 61 && $percentage_level <= 100) {
        $level = "Maximum";
    } else {
        $level = "";
    }

    $sql = "UPDATE inventory_tbl 
            SET item_name = '$item',
                category = '$category',
                stock = '$qty',
                unit_of_measurement = '$uom',
                unit_cost = '$unitcost',
                remarks = '$remarks',
                base_stock = '$qty',
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
    $qty_per_unit = $_POST['data_qty_per_unit'];
    $uom = $_POST['data_uom'];
    $unit_per_batch = $_POST['data_unit_per_batch'];
    $unitcost = $_POST['data_unitcost'];
    $total_qty  = $_POST['data_total_qty'];
    $amount_per_unit  = $_POST['data_amount_per_unit'];
    $total_amount  = $_POST['data_total_amount'];
    $remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];
    $status = $_POST['data_status'];

    $sql = "UPDATE purchase_req_tbl 
            SET pr_number = '$pr_num',
                item_name = '$item',
                qty_per_unit = '$qty_per_unit',
                unit_of_measurement = '$uom',
                unit_per_batch = '$unit_per_batch',
                unit_cost = '$unitcost',
                total_qty = '$total_qty',
                amount_per_unit = '$amount_per_unit',
                total_amount = '$total_amount',
                remarks = '$remarks',
                phase = '$phase',
                block = '$block',
                lot = '$lot',
                pr_status = '$status'
            WHERE pr_id = '$id'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: purchase-request.js
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
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: material-request.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }

    //Reduce Item Inventory Stock based on Requested Quantity
    if ($status == "Released") {
        $new_stock_count = 0;
        $sql_stock = "SELECT stock FROM inventory_tbl WHERE item_id = '$item_id' ";
        $result = $conn->query($sql_stock);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $new_stock_count = $row['stock'] - $qty;
        }

        if ($new_stock_count != 0) {
            $sql_updateStock = "UPDATE inventory_tbl 
                SET stock = '$new_stock_count' 
                WHERE item_id = '$item_id' ";

            if ($conn->query($sql_updateStock) === TRUE) {
                echo "<br>Inventory is Updated!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: material-request.js
            } else {
                echo "Error " . $sql . "<br>" . $conn->error;
            }
        }
    }
}


if ($request_type == "Delivery") {
    $id = $_POST['data_id'];
    $item = $_POST['data_item'];
    $pr = $_POST['data_pr'];
    $pr_qty = $_POST['data_pr_qty'];
    $qty = $_POST['data_qty'];
    $uom = $_POST['data_uom'];
    $date_delivered = $_POST['data_date_delivered'];
    $dr_number = $_POST['data_dr_number'];
    $supplier = $_POST['data_supplier'];
    $status = $_POST['data_status'];

    $sql = "UPDATE delivery_tbl 
            SET item_name = '$item',
                pr_number = '$pr',
                quantity = '$qty',
                uom = '$uom',
                date_of_delivery = '$date_delivered',
                delivery_receipt_num = '$dr_number',
                supplier = '$supplier',
                delivery_status = '$status'
            WHERE delivery_id = '$id'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: delivery.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }

    if ($status == "Received") {
        $sql_inventory = "INSERT INTO inventory_tbl (item_name, pr_number, stock, base_stock, unit_of_measurement) 
        VALUES ('$item', '$pr', '$qty', '$pr_qty', '$uom') ";

        if ($conn->query($sql_inventory) === TRUE) {
            echo "Inventory Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }
    }
}


if ($request_type == "Access_Control") {
    $username = $_POST['data_username'];
    $pr = isset($_POST['data_pr']) ? implode(", ", $_POST['data_pr']) : "None";
    $delivery = isset($_POST['data_delivery']) ? implode(", ", $_POST['data_delivery']) : "None";
    $inventory = isset($_POST['data_inventory']) ? implode(", ", $_POST['data_inventory']) : "None";
    $withdrawal = isset($_POST['data_withdrawal']) ? implode(", ", $_POST['data_withdrawal']) : "None";
    $accesscontrol = isset($_POST['data_accesscontrol']) ? implode(", ", $_POST['data_accesscontrol']) : "None";
    $management = isset($_POST['data_management']) ? implode(", ", $_POST['data_management']) : "None";

    // echo "\nPR: $data_pr\n";
    // echo "\nisset: ". ISSET($data_pr)."\n";
    // $pr = (ISSET($data_pr))? implode(", ", $data_pr) : "";
    // $delivery = implode(", ", $data_delivery);
    // $inventory = implode(", ", $data_inventory);
    // $withdrawal = implode(", ", $data_withdrawal);
    // $accesscontrol = implode(", ", $data_accesscontrol);
    // $management = implode(", ", $data_management);

    $sql = "UPDATE user_access_tbl 
            SET purchase = '$pr',
                delivery = '$delivery',
                inventory = '$inventory',
                withdrawal = '$withdrawal',
                user_access = '$accesscontrol',
                user_management = '$management'
            WHERE username = '$username'
            ";

    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: user-management.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


if ($request_type == "User_Management") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);
    $fname = mysqli_escape_string($conn, $_POST['data_fname']);
    $lname = mysqli_escape_string($conn, $_POST['data_lname']);
    $status = mysqli_escape_string($conn, $_POST['data_status']);
    $username = mysqli_escape_string($conn, $_POST['data_username']);
    $password = mysqli_escape_string($conn, $_POST['data_password']);
    $_SESSION['firstname'] = $fname;
    $_SESSION['lastname'] = $lname;

    if ($password != "") {
        // Creating a hash  // If you omit the ['cost' => 12] part, it will default to 10
        $hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 12]);
        $sql = "UPDATE user_tbl 
            SET first_name = '$fname',
                last_name = '$lname',
                user_status = '$status',
                user_name = '$username',
                user_password = '$hash',
                temp_password = '$password'
            WHERE user_id = '$id'
            ";
    }else{
        $sql = "UPDATE user_tbl 
            SET first_name = '$fname',
                last_name = '$lname',
                user_status = '$status',
                user_name = '$username'
            WHERE user_id = '$id'
            ";
    }


    if ($conn->query($sql) === TRUE) {
        echo "Update Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: user-management.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


$conn->close();
