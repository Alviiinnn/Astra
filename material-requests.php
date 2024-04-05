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
    <title>Withdrawal Requests</title>
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
                    </li>
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
                    <li class="nav-item px-2"><a href="inventory.php" class="nav-link c-darkgreen">Inventory</a>
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
        <h5 class="text-center mb-4">Withdrawal Requests</h5>
        <hr>
    </div>

    <div class="container c-bg-khaki">
        <div class="row">
            <button id="addRequest" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalAddRequest">Add Request</button>

            <div class="col-lg-2">
                <select id="statusFilter" class="form-select c-float-right" style="width: 10em;">
                    <option value="0" selected disabled>- Status Filter -</option>
                    <option value="pending">Pending</option>
                    <option value="processing">Processing</option>
                    <option value="released">Released</option>
                    <option value="denied">Denied</option>
                </select>
            </div>
        </div>

        <table id="table_main" class="table table-hover table-searchable cell-border">
            <thead class="">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Request Slip No.</th>
                    <th scope="col">Item</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">UOM</th>
                    <th scope="col">Remarks</th>
                    <th scope="col">Phase</th>
                    <th scope="col">Block</th>
                    <th scope="col">Lot</th>
                    <th scope="col">Requested By</th>
                    <th scope="col">Date Requested</th>
                    <th scope="col">Approved By</th>
                    <th scope="col">Date Approved</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot>
                <!-- <tr>
                    <th scope="col">#</th>
                    <th scope="col">Request Slip No.</th>
                    <th scope="col">Item</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">UOM</th>
                    <th scope="col">Remarks</th>
                    <th scope="col">Phase</th>
                    <th scope="col">Block</th>
                    <th scope="col">Lot</th>
                    <th scope="col">Requested By</th>
                    <th scope="col">Date Requested</th>
                    <th scope="col">Approved By</th>
                    <th scope="col">Date Approved</th>
                    <th scope="col">Status</th>
                </tr> -->
            </tfoot>
        </table>
    </div>


    <!-- MODALS -->

    <div class="modal fade" id="modalAddRequest" tabindex="-1" aria-labelledby="modalAddRequestLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 50em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalAddRequestLabel">Withdrawal Request Form</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body container p-4 pb-3">
                    <div class="container" role="child">
                        <div class="row align-items-center justify-content-end">
                            <label class="col-lg-3 text-end">Request Slip No:</label>
                            <div class="col-lg-3">
                                <input name="request_slip_num" class="form-control" data-required="1" type="text" />
                            </div>
                        </div>
                        <div class="row justify-content-end mb-2">
                            <span class="col-lg-3 small text-danger d-none" name="request_slip_num_warning">This is a
                                required field!</span>
                        </div>

                        <div class="row m-0">
                            <table id="table_form" class="table table-bordered mb-2 align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col" style="width: 30em;">Requested Items</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">UOM</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td data-dropdown="1" data-col="item" data-required="1">
                                            <select name="item_list" class="form-select border-0" data-required="1">
                                                <option value="0" selected disabled>- Select an Item -</option>
                                            </select>
                                        </td>
                                        <td contenteditable data-required="1" data-col="qty" data-int="1">0</td>
                                        <td data-col="uom"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div name="warning_qty" class="text-danger text-center small d-none"><b>Quantity</b> input is greater than current stocks!</div>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty</b>,
                                and <b>Unit Cost</b>, accepts NUMBERS ONLY!</span>
                            <div class="row justify-content-end mb-2 mx-0">
                                <button name="removeRow" class="btn btn-outline-secondary col-lg-1" disabled>-</button>
                                <button name="addRow" class="btn btn-outline-secondary col-lg-1">+</button>
                            </div>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-2">Remarks:</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="remarks" />
                            </div>
                        </div>

                        <!-- <div class="row align-items-center mb-2">
                            <label class="col-lg-1">UNIT:</label>
                            <div class="col-lg-11 d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                                    <label class="">Phase:</label>
                                    <input class="form-control ms-2" type="text"/>
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Block:</label>
                                    <input class="form-control ms-2" type="text"/>
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Lot:</label>
                                    <input class="form-control ms-2" type="text"/>
                                </div>
                            </div>
                        </div> -->

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-2">UNIT:</label>
                            <div class="col-lg-10 d-flex justify-content-between">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="phase" data-required="1" placeholder="">
                                    <label for="phase">Phase</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input type="text" class="form-control" id="block" data-required="1" placeholder="">
                                    <label for="block">Block</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input type="text" class="form-control" id="lot" data-required="1" placeholder="">
                                    <label for="lot">Lot</label>
                                </div>

                            </div>
                        </div>


                        <div class="row mb-2">
                            <label class="col-lg-2">Requested by:</label>
                            <div class="col-lg-10 justify-content-between d-flex">
                                <div class="">
                                    <input name="requested_by" class="form-control" type="text" />
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Date:</label>
                                    <input name="date_requested" class="form-control ms-2" type="date" />
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <label class="col-lg-2">Approved by:</label>
                            <div class="col-lg-10 justify-content-between d-flex">
                                <div class="">
                                    <input name="approved_by" class="form-control" type="text" />
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Date:</label>
                                    <input name="date_approved" class="form-control ms-2" type="date" />
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2 align-items-center">
                            <label class="col-lg-2">Intended for:</label>
                            <div class="col-lg-8 d-flex">
                                <input type="radio" class="btn-check" name="intended_for" id="villas" value="villas" />
                                <label class="btn btn-outline-secondary flex-fill" for="villas">Villas</label>

                                <input type="radio" class="btn-check" name="intended_for" id="manors" value="manors" />
                                <label class="btn btn-outline-secondary flex-fill" for="manors">Manors</label>

                                <input type="radio" class="btn-check" name="intended_for" id="residences" value="residences" />
                                <label class="btn btn-outline-secondary flex-fill" for="residences">Residences</label>
                            </div>
                        </div>

                        <div class="row mb-2 align-items-center">
                            <label class="col-lg-2">Status:</label>
                            <div class="col-lg-3 justify-content-between">
                                <select name="status" class="form-select" data-required="1">
                                    <option value="0" selected disabled>- Select Status -</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Released">Released</option>
                                    <option value="Denied">Denied</option>
                                </select>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                    <button name="submit" type="button" class="btn btn-warning">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalViewDetails" tabindex="-1" aria-labelledby="modalViewDetailsLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 50em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalViewDetailsLabel">Withdrawal Request Details</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body container p-4 pb-3">
                    <div class="container" role="child">
                        <div class="row align-items-center justify-content-end">
                            <label class="col-lg-3 text-end">Request Slip No:</label>
                            <div class="col-lg-3">
                                <input name="details_req_slip_num" class="form-control" data-required="1" type="text" />
                            </div>
                        </div>
                        <div class="row justify-content-end mb-2">
                            <span class="col-lg-3 small text-danger d-none" name="request_slip_num_warning">This is a
                                required field!</span>
                        </div>

                        <div class="row m-0">
                            <table id="table_details" class="table table-bordered mb-2 align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <!-- <th scope="col">#</th> -->
                                        <th scope="col" style="width: 30em;">Requested Items</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">UOM</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- <td>1</td> -->
                                        <td data-dropdown="1" data-col="item" data-required="1">
                                            <select name="details_itemlist" class="form-select border-0" data-required="1">
                                                <option value="0" selected disabled>- Select an Item -</option>
                                            </select>
                                        </td>
                                        <td contenteditable data-required="1" data-col="qty" data-int="1">0</td>
                                        <td data-col="uom"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty</b>,
                                and <b>Unit Cost</b>, accepts NUMBERS ONLY!</span>
                            <!-- <div class="row justify-content-end mb-2 mx-0">
                                <button name="removeRow" class="btn btn-outline-secondary col-lg-1" disabled>-</button>
                                <button name="addRow" class="btn btn-outline-secondary col-lg-1">+</button>
                            </div> -->
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-2">Remarks:</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="details_remarks" />
                            </div>
                        </div>

                        <div class="row align-items-center mb-2">
                            <label class="col-lg-2">UNIT:</label>
                            <div class="col-lg-10 d-flex justify-content-between">
                                <div class="form-floating">
                                    <input name="details_phase" type="text" class="form-control" id="details_phase" data-required="1" placeholder="">
                                    <label for="phase">Phase</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input name="details_block" type="text" class="form-control" id="details_block" data-required="1" placeholder="">
                                    <label for="block">Block</label>
                                </div>
                                <div class="form-floating ms-1">
                                    <input name="details_lot" type="text" class="form-control" id="details_lot" data-required="1" placeholder="">
                                    <label for="lot">Lot</label>
                                </div>
                            </div>
                        </div>


                        <div class="row mb-2">
                            <label class="col-lg-2">Requested by:</label>
                            <div class="col-lg-10 justify-content-between d-flex">
                                <div class="">
                                    <input name="details_requested_by" class="form-control" type="text" />
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Date:</label>
                                    <input name="details_date_requested" class="form-control ms-2" type="date" />
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <label class="col-lg-2">Approved by:</label>
                            <div class="col-lg-10 justify-content-between d-flex">
                                <div class="">
                                    <input name="details_approved_by" class="form-control" type="text" />
                                </div>
                                <div class="d-flex align-items-center">
                                    <label class="">Date:</label>
                                    <input name="details_date_approved" class="form-control ms-2" type="date" />
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2 align-items-center">
                            <label class="col-lg-2">Intended for:</label>
                            <div class="col-lg-8 d-flex">
                                <input type="radio" class="btn-check" name="details_intended_for" id="details_villas" value="villas" />
                                <label class="btn btn-outline-secondary flex-fill" for="details_villas">Villas</label>

                                <input type="radio" class="btn-check" name="details_intended_for" id="details_manors" value="manors" />
                                <label class="btn btn-outline-secondary flex-fill" for="details_manors">Manors</label>

                                <input type="radio" class="btn-check" name="details_intended_for" id="details_residences" value="residences" />
                                <label class="btn btn-outline-secondary flex-fill" for="details_residences">Residences</label>
                            </div>
                            <!-- <div class="col-lg-2">
                            <input type="text" class="form-control" id="intended_others" placeholder="Others">
                        </div> -->
                        </div>

                        <div class="row mb-2 align-items-center">
                            <label class="col-lg-2">Status:</label>
                            <div class="col-lg-3 justify-content-between">
                                <select name="details_status" class="form-select" data-required="1" disabled>
                                    <option value="0" selected disabled>- Select Status -</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Released">Released</option>
                                    <option value="Denied">Denied</option>
                                </select>
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


    <script src="js/material-request.js"></script>

</body>

</html>