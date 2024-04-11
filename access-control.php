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
    <title>User Access</title>
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

        .cbx {
            width: 25px;
            height: 25px;
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
                    <li id="link_requests" class="nav-item px-1 dropdown d-none">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Requests
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_pr" class="d-none"><a class="dropdown-item" href="purchase-requests.php">Purchase Requests</a></li>
                            <li id="link_withdrawal" class="d-none"><a class="dropdown-item" href="material-requests.php">Withdrawal Requests</a></li>
                        </ul>
                    </li>
                    <li id="link_delivery" class="nav-item px-1 d-none"><a href="delivery.php" class="nav-link c-darkgreen">Delivery</a></li>
                    <li id="link_inventory" class="nav-item px-1 d-none"><a href="inventory.php" class="nav-link c-darkgreen">Inventory</a></li>
                    <li id="link_users" class="nav-item px-1 dropdown d-none">
                        <a class="nav-link c-darkgreen c-bold dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Users
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_accessControl" class="d-none"><a class="dropdown-item" href="access-control.php">Access Control</a></li>
                            <li id="link_management" class="d-none"><a class="dropdown-item" href="user-management.php">User Management</a></li>
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
        <h5 class="text-center mb-4">Access Control</h5>
        <hr>
    </div>

    <div class="container c-bg-khaki pt-1">
        <!-- <div class="row">
            <button id="addRequest" class="btn btn-success col-lg-2" data-bs-toggle="modal" data-bs-target="#modalAddRequest">Add Request</button>

            <div class="col-lg-2">
                <select id="statusFilter" class="form-select c-float-right" style="width: 10em;">
                    <option value="0" selected disabled>- Status Filter -</option>
                    <option value="pending">Pending</option>
                    <option value="processing">Processing</option>
                    <option value="released">Released</option>
                    <option value="denied">Denied</option>
                </select>
            </div>
        </div> -->

        <table id="table_main" class="table table-hover table-searchable cell-border">
            <thead class="">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Username</th>
                    <th scope="col">Purchase Request</th>
                    <th scope="col">Delivery</th>
                    <th scope="col">Inventory</th>
                    <th scope="col">Withdrawal Request</th>
                    <th scope="col">Access Control</th>
                    <th scope="col">User Management</th>
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

    <div class="modal fade" id="modalModifyAccess" tabindex="-1" aria-labelledby="modalModifyAccessLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 80em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalModifyAccessLabel">Modify Access</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body row m-5">
                    <div class="col-lg-2">
                        <p class="fw-bold">Purchase Request</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_pr_view" value="View" type="checkbox" class="cbx cbx_pr me-2" role="button" disabled />
                                <label role="button" for="cbx_pr_view">View</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_pr_add" value="Add" type="checkbox" class="cbx cbx_pr me-2" role="button" disabled />
                                <label role="button" for="cbx_pr_add">Add</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_pr_edit" value="Edit" type="checkbox" class="cbx cbx_pr me-2" role="button" disabled />
                                <label role="button" for="cbx_pr_edit">Edit</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_pr_delete" value="Delete" type="checkbox" class="cbx cbx_pr me-2" role="button" disabled />
                                <label role="button" for="cbx_pr_delete">Delete</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p class="fw-bold">Delivery</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_delivery_view" value="View" type="checkbox" class="cbx cbx_delivery me-2" role="button" disabled />
                                <label role="button" for="cbx_delivery_view">View</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_delivery_add" value="Add" type="checkbox" class="cbx cbx_delivery me-2" role="button" disabled />
                                <label role="button" for="cbx_delivery_add">Add</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_delivery_edit" value="Edit" type="checkbox" class="cbx cbx_delivery me-2" role="button" disabled />
                                <label role="button" for="cbx_delivery_edit">Edit</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_delivery_delete" value="Delete" type="checkbox" class="cbx cbx_delivery me-2" role="button" disabled />
                                <label role="button" for="cbx_delivery_delete">Delete</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p class="fw-bold">Inventory</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_inventory_view" value="View" type="checkbox" class="cbx cbx_inventory me-2" role="button" disabled />
                                <label role="button" for="cbx_inventory_view">View</label>
                            </div>
                            <!-- <div class="d-flex pb-2">
                                <input id="cbx_inventory_add" value="Add" type="checkbox" class="cbx cbx_inventory me-2" role="button" disabled />
                                <label role="button" for="cbx_inventory_add">Add</label>
                            </div> -->
                            <div class="d-flex pb-2">
                                <input id="cbx_inventory_edit" value="Edit" type="checkbox" class="cbx cbx_inventory me-2" role="button" disabled />
                                <label role="button" for="cbx_inventory_edit">Edit</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_inventory_delete" value="Delete" type="checkbox" class="cbx cbx_inventory me-2" role="button" disabled />
                                <label role="button" for="cbx_inventory_delete">Delete</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p class="fw-bold">Withdrawal Request</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_withdrawal_view" value="View" type="checkbox" class="cbx cbx_withdrawal me-2" role="button" disabled />
                                <label role="button" for="cbx_withdrawal_view">View</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_withdrawal_add" value="Add" type="checkbox" class="cbx cbx_withdrawal me-2" role="button" disabled />
                                <label role="button" for="cbx_withdrawal_add">Add</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_withdrawal_edit" value="Edit" type="checkbox" class="cbx cbx_withdrawal me-2" role="button" disabled />
                                <label role="button" for="cbx_withdrawal_edit">Edit</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_withdrawal_delete" value="Delete" type="checkbox" class="cbx cbx_withdrawal me-2" role="button" disabled />
                                <label role="button" for="cbx_withdrawal_delete">Delete</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p class="fw-bold">Access Control</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_accesscontrol_view" value="View" type="checkbox" class="cbx cbx_accesscontrol me-2" role="button" disabled />
                                <label role="button" for="cbx_accesscontrol_view">View</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_accesscontrol_edit" value="Edit" type="checkbox" class="cbx cbx_accesscontrol me-2" role="button" disabled />
                                <label role="button" for="cbx_accesscontrol_edit">Edit</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p class="fw-bold">User Management</p>
                        <div class="d-flex flex-column">
                            <div class="d-flex pb-2">
                                <input id="cbx_management_view" value="View" type="checkbox" class="cbx cbx_management me-2" role="button" disabled />
                                <label role="button" for="cbx_management_view">View</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_management_add" value="Add" type="checkbox" class="cbx cbx_management me-2" role="button" disabled />
                                <label role="button" for="cbx_management_add">Add</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_management_edit" value="Edit" type="checkbox" class="cbx cbx_management me-2" role="button" disabled />
                                <label role="button" for="cbx_management_edit">Edit</label>
                            </div>
                            <div class="d-flex pb-2">
                                <input id="cbx_management_delete" value="Delete" type="checkbox" class="cbx cbx_management me-2" role="button" disabled />
                                <label role="button" for="cbx_management_delete">Delete</label>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button name="cancel" type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button name="discard" class="btn btn-outline-secondary">Discard</button>
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

    <script src="./js/general.js"></script>
    <script src="js/acs.js"></script>

</body>

</html>