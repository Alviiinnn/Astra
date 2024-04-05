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
    <title>Inventory</title>
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
    </style>
</head>

<body class="c-bg-khaki">
    <input type="hidden" name="dashboard_clicked" value="" />

    <div class="container-fluid c-header-shadow bg-white">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center mb-4">
                <a href="dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img class="pt-1 pb-2" width="90" src="img/logo.jpg" alt="Astra Logo" />
                    <h4 class="ms-5 mb-0 c-darkgreen">Inventory Management System</h4>
                </a>

                <ul class="nav nav-pills align-items-center">
                    <li class="nav-item px-2"><a href="dashboard.php" class="nav-link c-darkgreen" aria-current="page">Dashboard</a></li>
                    <li class="nav-item px-2 dropdown">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Requests
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="purchase-requests.php">Purchase Requests</a></li>
                            <li><a class="dropdown-item" href="material-requests.php">Withdrawal Requests</a></li>
                        </ul>
                    </li>
                    <li class="nav-item px-2"><a href="delivery.php" class="nav-link c-darkgreen">Delivery</a></li>
                    <li class="nav-item px-2"><a href="inventory.php" class="nav-link c-darkgreen c-bold">Inventory</a></li>
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
        <h5 class="text-center mb-4">Warehouse Stock</h5>
        <hr>
    </div>


    <div class="container c-bg-khaki">
        <div class="row">
            <!-- <button class="btn btn-success col-lg-1" data-bs-toggle="modal" data-bs-target="#modalAddStock">Add Stock</button> -->

            <div class="col-lg-2 offset-lg-8 pe-0">
                <select id="filter_category" class="form-select">
                    <option value="" selected>- Category -</option>
                    <option value="electrical">Electrical</option>
                    <option value="masonry">Masonry</option>
                    <option value="plumbing">Plumbing</option>
                    <option value="carpentry">Carpentry</option>
                    <option value="paints">Paint</option>
                    <option value="ribars">Ribars</option>
                </select>
            </div>

            <div class="col-lg-2">
                <select id="filter_stocklevel" class="form-select">
                    <option value="" selected>- Stock Level -</option>
                    <option value="crit">Critical</option>
                    <option value="min">Minimum</option>
                    <option value="safe">Safe</option>
                    <option value="max">Maximum</option>
                </select>
            </div>
        </div>

        <table id="table_main" class="table table-hover table-searchable">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Item</th>
                    <th scope="col">Category</th>
                    <th scope="col">Current Stock</th>
                    <th scope="col">Requested Stock</th>
                    <th scope="col">Stock %</th>
                    <th scope="col">Stock Level</th>
                </tr>
            </thead>
            <tbody></tbody>
            <!-- <tfoot>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Item</th>
                    <th scope="col">Category</th>
                    <th scope="col">Stock Qty</th>
                    <th scope="col">Level</th>
                </tr>
            </tfoot> -->
        </table>
    </div>


    <!-- MODALS -->

    <div class="modal fade" id="modalAddStock" tabindex="-1" aria-labelledby="modalAddStockLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalAddStockLabel">Add New Stock</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body container p-5">
                    <div class="container" role="child">
                        <!-- <div class="row align-items-center mb-2">
                            <label class="col-lg-3">Purchase Request No.:</label>
                            <div class="col-lg-3">
                                <select class="form-select" name="pr_num_list">
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
                            <table id="table_form" class="table table-bordered table-responsive align-middle text-center">
                                <thead class="table-light">
                                    <th style="width: 3em;">#</th>
                                    <th class="text-start" style="width: 20em;">Item</th>
                                    <th style="width: 10em;">Category</th>
                                    <th style="width: 5em;">Qty</th>
                                    <th style="width: 8em;">UOM</th>
                                    <th style="width: 8em;">Unit Cost</th>
                                    <th class="text-start">Remarks</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="text-start" contenteditable data-required="1" data-col="item"></td>
                                        <td data-dropdown="1" data-col="category">
                                            <select class="form-select border-0">
                                                <option>Electrical</option>
                                                <option>Masonry</option>
                                                <option>Plumbing</option>
                                                <option>Carpentry</option>
                                                <option>Paint</option>
                                                <option>Ribars</option>
                                            </select>
                                        </td>
                                        <td contenteditable data-int="1" data-col="qty">0</td>
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
                                        <td contenteditable data-int="1" data-col="unitcost">0</td>
                                        <td class="text-start" contenteditable data-col="remarks"></td>
                                    </tr>
                                </tbody>
                            </table>
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
                    <h1 class="modal-title fs-5 text-center" id="modalViewDetailsLabel">Item Details</h1>
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
                                    <th style="width: 3em;">#</th>
                                    <th style="width: 20em;" class="text-start">Item</th>
                                    <th style="width: 10em;">Category</th>
                                    <th style="width: 5em;">Qty</th>
                                    <th style="width: 7em;">UOM</th>
                                    <th style="width: 8em;">Unit Cost</th>
                                    <th class="text-start">Remarks</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td data-required="1" data-col="item" class="text-start"></td>
                                        <td data-dropdown="1" data-col="category">
                                            <!-- <select class="form-select">
                                                <option>Electrical</option>
                                                <option>Masonry</option>
                                                <option>Plumbing</option>
                                                <option>Carpentry</option>
                                            </select> -->
                                        </td>
                                        <td data-int="1" data-col="qty">0</td>
                                        <td data-dropdown="1" data-col="uom">
                                            <!-- <select class="form-select">
                                                <option>pieces</option>
                                                <option>bags</option>
                                            </select> -->
                                        </td>
                                        <td data-int="1" data-col="unitcost">0</td>
                                        <td data-col="remarks" class="text-start"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div name="warning_general" class="text-danger text-center small d-none"></div>
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


    <script src="js/inventory.js"></script>

</body>

</html>