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
    <title>Delivery</title>
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
    <input type="hidden" name="username" value="<?php echo $_SESSION['username']; ?>" />

    <div class="container-fluid c-header-shadow bg-white">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center mb-4">
                <a href="dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img class="pt-1 pb-2" width="90" src="img/logo.jpg" alt="Astra Logo" />
                    <h4 class="ms-5 mb-0 c-darkgreen">Inventory Management System</h4>
                </a>

                <ul class="nav nav-pills align-items-center">
                    <li class="nav-item px-1"><a href="dashboard.php" class="nav-link c-darkgreen" aria-current="page">Dashboard</a></li>
                    <li id="link_requests" class="nav-item px-1 dropdown ">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Requests
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_pr" class=""><a class="dropdown-item" href="purchase-requests.php">Purchase Requests</a></li>
                            <li id="link_withdrawal" class=""><a class="dropdown-item" href="material-requests.php">Withdrawal Requests</a></li>
                        </ul>
                    </li>
                    <li id="link_delivery" class="nav-item px-1 "><a href="delivery.php" class="nav-link c-darkgreen c-bold">Delivery</a></li>
                    <li id="link_inventory" class="nav-item px-1 "><a href="inventory.php" class="nav-link c-darkgreen">Inventory</a></li>
                    <li id="link_users" class="nav-item px-1 dropdown ">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Users
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_accessControl" class=""><a class="dropdown-item" href="access-control.php">Access Control</a></li>
                            <li id="link_management" class=""><a class="dropdown-item" href="user-management.php">User Management</a></li>
                        </ul>
                    </li>
                    <li class="nav-item px-1"><?php echo $_SESSION['firstname'] . " " . $_SESSION['lastname']; ?></li>

                    <!-- <i class="bi bi-box-arrow-right"></i> -->
                    <li class="nav-item px-1" name="logout">
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
        <h5 class="text-center mb-4">Received Items</h5>
        <hr>
    </div>

    <div class="container c-bg-khaki">
        <div class="row">
            <button id="addRequest" class="btn btn-success w-10" data-bs-toggle="modal" data-bs-target="#modalAddDelivery">Add Delivery</button>

            <!-- <div class="col-lg-2">
                <select id="statusFilter" class="form-select c-float-right" style="width: 10em;">
                    <option value="0" selected disabled>- Status Filter -</option>
                    <option value="pending">Pending</option>
                    <option value="processing">Processing</option>
                    <option value="released">Released</option>
                    <option value="denied">Denied</option>
                </select>
            </div> -->
        </div>

        <table id="table_main" class="table table-hover table-searchable">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">PR Number</th>
                    <th scope="col">Item</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">UOM</th>
                    <th scope="col">Date of Delivery</th>
                    <th scope="col">DR Number</th>
                    <th scope="col">Supplier</th>
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

    <div class="modal fade" id="modalAddDelivery" tabindex="-1" aria-labelledby="modalAddDeliveryLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalAddDeliveryLabel">Add New Delivery</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body container p-5">
                    <div class="container" role="child">
                        <div class="row">
                            <table id="table_form" class="table table-bordered table-responsive text-center align-middle">
                                <thead class="table-light">
                                    <th style="width: 3em;">#</th>
                                    <th class="text-start" style="width: 20em;">Item</th>
                                    <th style="width: 5em;">Qty</th>
                                    <th style="width: 6em;">UOM</th>
                                    <th style="width: 8em;">Date of Delivery</th>
                                    <th style="width: 8em;">DR Number</th>
                                    <th style="width: 8em;">Supplier</th>
                                    <th style="width: 8em;">Status</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="text-start" contenteditable data-required="1" data-dropdown="1" data-col="item">
                                            <!-- <input class="form-control border-0" list="datalist_item1" placeholder="Type to search items...">
                                            <datalist id="datalist_item1"></datalist> -->
                                            <select name="itemlist" class="form-select border-0"></select>
                                        </td>
                                        <td contenteditable data-int="1" data-col="qty" data-required="1"></td>
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
                                        <td data-col="delivered_date" data-required="1">
                                            <input class="form-control border-0" type="date" name="delivered_date" />
                                        </td>
                                        <td contenteditable data-required="1" data-col="dr_number"></td>
                                        <td contenteditable data-col="supplier"></td>
                                        <td data-col="status" data-dropdown="1">
                                            <select class="form-select border-0">
                                                <option>Pending</option>
                                                <option>In Transit</option>
                                                <option>Received</option>
                                                <option>Returned</option>
                                                <option>Cancelled</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div name="warning_general" class="text-danger text-center small d-none"><b>Please complete the required fields!</b></div>
                            <span name="warning_item" class="text-danger text-center small d-none"><b>ITEM</b> is a
                                required field!</span>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty</b>,
                                <b>Unit</b>, <b>Cost</b>, and <b>Amount</b> accepts NUMBERS ONLY!</span>
                            <button name="removeRow" class="btn btn-outline-secondary col-lg-1" disabled>-</button>
                            <button name="addRow" class="btn btn-outline-secondary col-lg-1">+</button>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button name="add" type="button" class="btn btn-warning">Add</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="modalViewDetails" tabindex="-1" aria-labelledby="modalViewDetailsLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalViewDetailsLabel">Delivery Details</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body container p-5">
                    <div class="container" role="child">
                        <!-- <div class="row align-items-center mb-2">
                            <label class="col-lg-3">Purchase Request No.:</label>
                            <div class="col-lg-3">
                                <select class="form-select" disabled>
                                    <option value="0" selected>- Select One -</option>
                                    <option value="0">EA41 - B9 - 001</option>
                                    <option value="0">EA41 - B9 - 002</option>
                                    <option value="0">EA41 - B9 - 003</option>
                                    <option value="0">EA41 - B9 - 004</option>
                                    <option value="0">EA41 - B9 - 005</option>
                                </select>
                            </div>
                        </div> -->

                        <div class="row">
                            <table id="table_details" class="table table-bordered table-responsive align-middle text-center">
                                <thead class="table-light">
                                    <th style="width: 15em;" class="text-start">Item</th>
                                    <th style="width: 5em;">Qty</th>
                                    <th style="width: 6em;">UOM</th>
                                    <th style="width: 7em;">Date of Delivery</th>
                                    <th style="width: 7em;">DR Number</th>
                                    <th style="width: 7em;">Supplier</th>
                                    <th style="width: 7em;">Status</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-start" contenteditable data-required="1" data-col="item"></td>
                                        <td contenteditable data-int="1" data-col="qty" data-required="1"></td>
                                        <td data-dropdown="1" data-col="uom"></td>
                                        <td data-col="delivered_date" data-required="1"></td>
                                        <td contenteditable data-required="1" data-col="dr_number"></td>
                                        <td contenteditable data-col="supplier"></td>
                                        <td data-col="status" data-dropdown="1"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <span name="warning_item" class="text-danger text-center small d-none"><b>ITEM</b> is a
                                required field!</span>
                            <span name="warning_numbers" class="text-danger text-center small d-none"><b>Qty</b>,
                                <b>Unit</b>, <b>Cost</b>, and <b>Amount</b> accepts NUMBERS ONLY!</span>
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

    <script src="./js/general.js"></script>
    <script src="js/delivery.js"></script>

</body>

</html>