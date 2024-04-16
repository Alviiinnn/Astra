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
    $data_remarks = $_POST['data_remarks'];

    $item = json_decode($data_item);
    $category = json_decode($data_category);
    $uom = json_decode($data_uom);
    $qty = json_decode($data_qty);
    $unitcost = json_decode($data_unitcost);
    $remarks = json_decode($data_remarks);

    $user = $_SESSION['username'];

    // Loop and Insert Items 
    for ($i = 0; $i < count($item); $i++) {
        $sql = "INSERT INTO inventory_tbl (item_name, category, stock, unit_of_measurement, unit_cost, remarks, base_stock) 
                VALUES ('$item[$i]', '$category[$i]', '$qty[$i]', '$uom[$i]', '$unitcost[$i]', '$remarks[$i]', '$qty[$i]')";

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
    $data_qty_per_unit = $_POST['data_qty_per_unit'];
    $data_uom = $_POST['data_uom'];
    $data_unit_per_batch = $_POST['data_unit_per_batch'];
    $data_unitcost = $_POST['data_unitcost'];
    $data_total_qty = $_POST['data_total_qty'];
    $data_amount_per_unit = $_POST['data_amount_per_unit'];
    $data_total_amount = $_POST['data_total_amount'];
    $data_remarks = $_POST['data_remarks'];
    $phase = $_POST['data_phase'];
    $block = $_POST['data_block'];
    $lot = $_POST['data_lot'];
    $status = $_POST['data_status'];

    $item = json_decode($data_item);
    $qty_per_unit = json_decode($data_qty_per_unit);
    $uom = json_decode($data_uom);
    $unit_per_batch = json_decode($data_unit_per_batch);
    $unitcost = json_decode($data_unitcost);
    $total_qty = json_decode($data_total_qty);
    $amount_per_unit = json_decode($data_amount_per_unit);
    $total_amount = json_decode($data_total_amount);
    $remarks = json_decode($data_remarks);

    $user = $_SESSION['username'];

    for ($i = 0; $i < count($item); $i++) {

        $sql = "INSERT INTO purchase_req_tbl (pr_number, item_name, qty_per_unit, unit_of_measurement, unit_per_batch, unit_cost, total_qty, amount_per_unit, total_amount, remarks, phase, block, lot, pr_status) 
                VALUES ('$purchase_num', '$item[$i]', '$qty_per_unit[$i]', '$uom[$i]', '$unit_per_batch[$i]', '$unitcost[$i]', '$total_qty[$i]', '$amount_per_unit[$i]', '$total_amount[$i]', '$remarks[$i]', '$phase', '$block', '$lot', '$status')";

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
    $req_status = $_POST['data_status'];

    $item_id = json_decode($data_item_id);
    $item = json_decode($data_item);
    $qty = json_decode($data_qty);
    $uom = json_decode($data_uom);

    $user = $_SESSION['username'];
    for ($i = 0; $i < count($item); $i++) {

        $sql = "INSERT INTO material_req_tbl (request_slip_no, item_id, item_name, quantity, unit_of_measurement, remarks, phase, block, lot, requested_by, date_requested, approved_by, date_approved, intended_for, mat_req_status) 
                VALUES ('$req_slip_number', '$item_id[$i]', '$item[$i]', '$qty[$i]', '$uom[$i]', '$remarks', '$phase', '$block', '$lot', '$requested_by', '$date_requested', '$approved_by', '$date_approved', '$intended_for', '$req_status')";

        if ($conn->query($sql) === TRUE) {
            echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }

        //Reduce Item Inventory Stock based on Requested Quantity
        if ($req_status == "Released") {
            $new_stock_count = 0;
            $sql_stock = "SELECT stock FROM inventory_tbl WHERE item_id = '$item_id[$i]' ";
            $result = $conn->query($sql_stock);
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $new_stock_count = $row['stock'] - $qty;
            }

            if ($new_stock_count != 0) {
                $sql_updateStock = "UPDATE inventory_tbl 
                SET stock = '$new_stock_count' 
                WHERE item_id = '$item_id[$i]' ";

                if ($conn->query($sql_updateStock) === TRUE) {
                    echo "<br>Inventory is Updated!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: material-request.js
                } else {
                    echo "Error " . $sql . "<br>" . $conn->error;
                }
            }
        }
    }
}


if ($request_type == "Add_Delivery") {
    $data_item = $_POST['data_item'];
    $data_pr = $_POST['data_pr'];
    $data_pr_qty = $_POST['data_pr_qty'];
    $data_qty = $_POST['data_qty'];
    $data_uom = $_POST['data_uom'];
    $data_date_of_delivery = $_POST['data_date_of_delivery'];
    $data_DR_number = $_POST['data_DR_number'];
    $data_supplier = $_POST['data_supplier'];
    $data_status = $_POST['data_status'];

    $item = json_decode($data_item);
    $pr = json_decode($data_pr);
    $pr_qty = json_decode($data_pr_qty);
    $qty = json_decode($data_qty);
    $uom = json_decode($data_uom);
    $delivered_date = json_decode($data_date_of_delivery);
    $dr_number = json_decode($data_DR_number);
    $supplier = json_decode($data_supplier);
    $status = json_decode($data_status);

    $user = $_SESSION['username'];
    for ($i = 0; $i < count($item); $i++) {

        $sql = "INSERT INTO delivery_tbl (item_name, pr_number, quantity, uom, date_of_delivery, delivery_receipt_num, supplier, delivery_status) 
                VALUES ('$item[$i]', '$pr[$i]', '$qty[$i]', '$uom[$i]', '$delivered_date[$i]', '$dr_number[$i]', '$supplier[$i]', '$status[$i]')";

        if ($conn->query($sql) === TRUE) {
            echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
        } else {
            echo "Error " . $sql . "<br>" . $conn->error;
        }

        if ($status[$i] == "Received") {
            $sql_inventory = "INSERT INTO inventory_tbl (item_name, pr_number, stock, base_stock, unit_of_measurement) 
            VALUES ('$item[$i]', '$pr[$i]', '$qty[$i]', '$pr_qty[$i]', '$uom[$i]')";

            if ($conn->query($sql_inventory) === TRUE) {
                echo "Insert Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
            } else {
                echo "Error " . $sql . "<br>" . $conn->error;
            }
        }
    }
}



$conn->close();
