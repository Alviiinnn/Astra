<?php
require "dbconn.php";

$request_type = mysqli_escape_string($conn, $_POST['requestType']);


if ($request_type == "Inventory") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);

    $sql = "DELETE from inventory_tbl WHERE item_id = '$id' ";

    if ($conn->query($sql) === TRUE) {
        echo "Delete Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: inventory.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


if ($request_type == "Purchase_Request") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);

    $sql = "DELETE from purchase_req_tbl WHERE pr_id = '$id' ";

    if ($conn->query($sql) === TRUE) {
        echo "Delete Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: purchase-request.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


if ($request_type == "Material_Request") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);

    $sql = "DELETE from material_req_tbl WHERE mat_req_id = '$id' ";

    if ($conn->query($sql) === TRUE) {
        echo "Delete Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: material-request.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


if ($request_type == "Delivery") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);

    $sql = "DELETE from delivery_tbl WHERE delivery_id = '$id' ";

    if ($conn->query($sql) === TRUE) {
        echo "Delete Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: delivery.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


if ($request_type == "User_Management") {
    $id = mysqli_escape_string($conn, $_POST['data_id']);
    $username = mysqli_escape_string($conn, $_POST['data_username']);

    $sql = "DELETE from user_tbl WHERE user_id = '$id' ";

    if ($conn->query($sql) === TRUE) {
        echo "Delete Success!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: user-management.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }

    $sql_accessControl = "DELETE from user_access_tbl WHERE username = '$username' ";

    if ($conn->query($sql_accessControl) === TRUE) {
        echo "Delete Success in Access Control!"; //DO NOT REMOVE THE WORD 'SUCCESS' | Reference: user-management.js
    } else {
        echo "Error " . $sql . "<br>" . $conn->error;
    }
}


$conn->close();