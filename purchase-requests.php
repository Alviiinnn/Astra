<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: index.php");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Requests</title>
    <link href="libraries/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <script src="libraries/bootstrap.bundle.min.js"></script>
    <script src="libraries/jquery-uncompressed.js"></script>
    <link href="libraries/DataTables/datatables.css" rel="stylesheet">

    <script src="libraries/DataTables/datatables.js"></script>

    <style>
        .dt-search {
            float: left;
        }

        .c-float-right {
            float: right;
        }
    </style>
</head>

<body class="c-bg-khaki">
    <div class="container-fluid c-header-shadow bg-white">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center mb-4">
                <a href="dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img class="pt-1 pb-2" width="90" src="img/logo.jpg" alt="Astra Logo" />
                    <h4 class="ms-5 mb-0 c-darkgreen">Inventory Management System</h4>
                </a>

                <ul class="nav nav-pills align-items-center">
                    <li class="nav-item px-2"><a href="dashboard.php" class="nav-link c-darkgreen" aria-current="page">Dashboard</a></li>
                    <li class="nav-item px-2 dropdown c-bold">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Requests
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="purchase-requests.php">Purchase Requests</a></li>
                            <li><a class="dropdown-item" href="material-requests.php">Withdrawal Requests</a></li>
                        </ul>
                    </li>
                    <li class="nav-item px-2"><a href="delivery.php" class="nav-link c-darkgreen">Delivery</a></li>
                    <li class="nav-item px-2"><a href="inventory.php" class="nav-link c-darkgreen">Inventory</a></li>
                    <li class="nav-item px-2 dropdown">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Users
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="user-access.php">User Access</a></li>
                            <li><a class="dropdown-item" href="user-management.php">User Management</a></li>
                        </ul>
                    </li>
                    <i class="bi bi-box-arrow-right"></i>
                    <li class="nav-item px-2" name="logout">
                        <a href="index.php" class="nav-link c-darkgreen">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z" />
                                <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z" />
                            </svg>
                        </a>
                    </li>
                </ul>
            </header>
        </div>
    </div>


    <div class="container">
        <h5 class="text-center mb-4">Purchase Requests</h5>
        <hr>
    </div>

    <div class="container d-flex justify-content-between">
        <button class="btn btn-success" id="addRequest" data-bs-toggle="modal" data-bs-target="#modalPurchaseReq" type="button">Add Request</button>
        <select id="statusFilter" class="form-select c-float-right" style="width: 10em;">
            <option value="0" selected disabled>- Status Filter -</option>
            <option value="Pending">Pending</option>
            <option value="Processing">Processing</option>
            <option value="Approved">Approved</option>
            <option value="Completed">Completed</option>
            <option value="Denied">Denied</option>
        </select>
    </div>

    <div class="container c-bg-khaki">
        <table id="table_main" class="table table-hover table-searchable sticky-sm-top sticky-md-top sticky-lg-top sticky-xl-top sticky-xxl-top ">
            <thead>
                <tr>
                    <th>#</th>
                    <th scope="col">PR Number</th>
                    <th scope="col">Item</th>
                    <th scope="col">Qty/Unit</th>
                    <th scope="col">UOM</th>
                    <th scope="col">Unit/Batch</th>
                    <th scope="col">Unit Cost</th>
                    <th scope="col">Total Qty</th>
                    <th scope="col">Phase</th>
                    <th scope="col">Block</th>
                    <th scope="col">Lot</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>


    <!-- MODAL -->

    <div class="modal fade" id="modalPurchaseReq" tabindex="-1" aria-labelledby="modalPurchaseReqLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalPurchaseReqLabel">Purchase Request Form</h1>
                </div>
                <div class="modal-body container p-5 pb-2">
                    <div class="container" role="child">
                        <div class="row align-items-center pb-3">
                            <label class="col-lg-2 p-0" for="purchase_req_num">Purchase Request No.:</label>
                            <div class="col-lg-3">
                                <input class="form-control" id="purchase_req_num" type="text" name="purchase_req_num" placeholder="e.g. EA41-B9-001" />
                            </div>
                            <span class="col-lg-2 small text-danger d-none" name="purchase_req_warning">This is a
                                required field!</span>
                        </div>
                        <div class="row">
                            <table id="table_form" class="table table-bordered table-responsive align-middle text-center">
                                <thead class="table-light">
                                    <th style="width: 1em;">#</th>
                                    <th style="width: 14em;" class="text-start">Item</th>
                                    <th style="width: 4em;">Qty/Unit</th>
                                    <th style="width: 5em;">UOM</th>
                                    <th style="width: 5em;">Unit/Batch</th>
                                    <th style="width: 5em;">Unit Cost</th>
                                    <th style="width: 5em;">Total Qty</th>
                                    <th style="width: 5em;">Amount/Unit</th>
                                    <th style="width: 7em;">Total Amount</th>
                                    <th style="width: 10em;" class="text-start">Remarks</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td contenteditable data-col="item" data-required="1" class="text-start"></td>
                                        <td contenteditable data-int="1" data-col="qty_per_unit"></td>
                                        <td data-dropdown="1" data-col="uom">
                                            <select class="form-select border-0">
                                                <option>pcs</option>
                                                <option>bags</option>
                                                <option>kl</option>
                                                <option>box</option>
                                                <option>gal</option>
                                                <option>tin</option>
                                                <option>ltrs</option>
                                            </select>
                                        </td>
                                        <td contenteditable data-int="1" data-col="unit_per_batch"></td>
                                        <td contenteditable data-int="1" data-col="unitcost"></td>
                                        <td data-int="1" data-col="total_qty">0</td>
                                        <td data-int="1" data-col="amount_per_unit">0</td>
                                        <td data-int="1" data-col="total_amount">0</td>
                                        <td contenteditable data-col="remarks" class="text-start"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <span name="warning_item" class="text-danger text-center small d-none"><b>ITEM</b> is a
                                required field!</span>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty/Unit</b>, <b>Unit/Batch</b>, and
                                <b>Unit Cost</b> are required fields!</span>
                            <div class="row justify-content-end mb-3">
                                <button name="removeRow" class="btn btn-outline-secondary col-lg-1" disabled>-</button>
                                <button name="addRow" class="btn btn-outline-secondary col-lg-1">+</button>
                            </div>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-1">UNIT:</label>
                            <div class="col-lg-11 d-flex">
                                <div class="form-floating">
                                    <input id="iphase" name="phase" type="text" class="form-control" placeholder="">
                                    <label for="iphase">Phase</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input id="iblock" name="block" type="text" class="form-control" placeholder="">
                                    <label for="iblock">Block</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input id="ilot" name="lot" type="text" class="form-control" placeholder="">
                                    <label for="ilot">Lot</label>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-1">Status:</label>
                            <div class="col-lg-2">
                                <select class="form-select col-lg-3" name="istatus">
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Denied">Denied</option>
                                </select>
                            </div>
                            <div class="col-lg-9 text-end" style="font-size: 12px;">
                                <p class="p-0 m-0"><b>Total Qty</b> = Qty/Unit * 36</p>
                                <p class="p-0 m-0"><b>Amount/Unit</b> = Qty/Unit * Unit Cost</p>
                                <p class="p-0 m-0"><b>Total Amount</b> = Unit Cost * Total Qty</p>
                            </div>
                        </div>
                        <!-- 
                        <div class="row align-items-center text-end mb-2" >

                        </div> -->

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                    <button name="add" type="button" class="btn btn-warning">Add</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modalViewDetails" tabindex="-1" aria-labelledby="modalViewDetailsLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalViewDetailsLabel">Purchase Request Details</h1>
                </div>
                <div class="modal-body container">
                    <div class="container p-4" role="child">
                        <div class="row align-items-center pb-3">
                            <label class="col-lg-2" for="pr_num">Purchase Request No.:</label>
                            <div class="col-lg-3">
                                <form>
                                    <input class="form-control" id="pr_num" type="text" name="pr_num" placeholder="e.g. EA41-B9-001" disabled />
                                </form>
                            </div>
                            <span class="col-lg-2 small text-danger d-none" name="purchase_req_warning">This is a
                                required field!</span>
                        </div>
                        <div class="row">
                            <table id="table_details" class="table table-bordered table-responsive align-middle text-center">
                                <thead class="table-light">
                                    <th style="width: 14em;" class="text-start">Item</th>
                                    <th style="width: 4em;">Qty/Unit</th>
                                    <th style="width: 5em;">UOM</th>
                                    <th style="width: 5em;">Unit/Batch</th>
                                    <th style="width: 5em;">Unit Cost</th>
                                    <th style="width: 5em;">Total Qty</th>
                                    <th style="width: 5em;">Amount/Unit</th>
                                    <th style="width: 7em;">Total Amount</th>
                                    <th style="width: 10em;" class="text-start">Remarks</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td data-col="item" data-required="1" class="text-start"></td>
                                        <td data-int="1" data-col="qty_per_unit"></td>
                                        <td data-dropdown="1" data-col="uom"></td>
                                        <td data-int="1" data-col="unit_per_batch"></td>
                                        <td data-int="1" data-col="unitcost"></td>
                                        <td data-int="1" data-col="total_qty"></td>
                                        <td data-int="1" data-col="amount_per_unit"></td>
                                        <td data-int="1" data-col="total_amount"></td>
                                        <td data-col="remarks" class="text-start"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <span name="warning_item" class="text-danger text-center small d-none"><b>ITEM</b> is a
                                required field!</span>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty</b>, and
                                <b>Unit Cost</b> accepts NUMBERS ONLY!</span>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-1">UNIT:</label>
                            <div class="col-lg-11 d-flex">
                                <div class="form-floating">
                                    <input id="details_phase" name="details_phase" type="text" class="form-control" placeholder="" disabled />
                                    <label for="details_phase">Phase</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input id="details_block" name="details_block" type="text" class="form-control" placeholder="" disabled />
                                    <label for="details_block">Block</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input id="details_lot" name="details_lot" type="text" class="form-control" placeholder="" disabled />
                                    <label for="details_lot">Lot</label>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-1">Status:</label>
                            <div class="col-lg-2">
                                <select class="form-select col-lg-3" name="details_status" disabled>
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Denied">Denied</option>
                                </select>
                            </div>
                            <div class="col-lg-9 text-end" style="font-size: 12px;">
                                <p class="p-0 m-0"><b>Total Qty</b> = Qty/Unit * 36</p>
                                <p class="p-0 m-0"><b>Amount/Unit</b> = Qty/Unit * Unit Cost</p>
                                <p class="p-0 m-0"><b>Total Amount</b> = Unit Cost * Total Qty</p>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button name="cancel" type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button name="discard" class="btn btn-outline-secondary">Discard</button>
                    <button name="delete" type="button" class="btn btn-outline-danger">Delete</button>
                    <button name="modify" type="button" class="btn btn-warning">Modify</button>
                    <button name="saveChanges" type="button" class="btn btn-warning">Save Changes</button>
                </div>
            </div>
        </div>
    </div>


    <!-- TOASTS -->

    <div class="toast-container position-fixed top-0 end-0 p-3" data-bs-delay="5000" data-bs-autohide="false">
        <div id="toastSuccess" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-success">
                <!-- <img src="..." class="rounded me-2" alt="..."> -->
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check2-circle text-white" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z" />
                </svg>
                <strong class="ms-2 me-auto text-white">SUCCESS</strong>
                <!-- <small>11 mins ago</small> -->
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body" name="toast_success_msg"></div>
        </div>
    </div>

    <div class="toast-container position-fixed top-0 end-0 p-3" data-bs-delay="20000" data-bs-autohide="false">
        <div id="toastDelete" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-danger">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="white" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                    <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.15.15 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.2.2 0 0 1-.054.06.1.1 0 0 1-.066.017H1.146a.1.1 0 0 1-.066-.017.2.2 0 0 1-.054-.06.18.18 0 0 1 .002-.183L7.884 2.073a.15.15 0 0 1 .054-.057m1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767z" />
                    <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z" />
                </svg>
                <strong class="ms-2 me-auto text-white">WARNING!</strong>
                <!-- <small>11 mins ago</small> -->
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                <div name="toast_delete_msg"></div>
                <div class="mt-2 pt-2">
                    <button name="delete_confirm" type="button" class="btn btn-primary btn-sm">Yes</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">No</button>
                </div>
            </div>
        </div>
    </div>


    <script src="js/purchase-request.js"></script>

</body>

</html>