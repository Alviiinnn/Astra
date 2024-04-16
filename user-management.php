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
    <title>User Management</title>
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

    <div class="row">
        <button id="addUser" class="btn btn-success col-lg-2" data-bs-toggle="modal" data-bs-target="#modalAddUser">Add User</button>

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
                        <a class="nav-link c-darkgreen dropdown-toggle c-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Users
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_accessControl" class="d-none"><a class="dropdown-item" href="access-control.php">Access Control</a></li>
                            <li id="link_management" class="d-none"><a class="dropdown-item" href="user-management.php">User Management</a></li>
                        </ul>
                    </li>
                    <li class="nav-item px-1"><?php echo $_SESSION['firstname'] . " " . $_SESSION['lastname']; ?></li>

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
        <h5 class="text-center mb-4">User Management</h5>
        <hr>
    </div>

    <div class="container c-bg-khaki">
        <table id="table_main" class="table table-hover table-searchable cell-border">
            <thead class="">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Username</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Password</th>
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

    <div class="modal fade" id="modalAddUser" tabindex="-1" aria-labelledby="modalAddUserLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 40em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalAddUserLabel">Add New User</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <form name="form_addUser">
                    <div class="modal-body container px-5 pt-4 pb-2">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="fname" placeholder="First Name" required>
                            <label for="fname">First Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="lname" placeholder="Last Name" required>
                            <label for="lname">Last Name</label>
                        </div>

                        <div class="d-flex">
                            <div class="form-floating mb-3 flex-fill me-1">
                                <input type="text" class="form-control" id="username" placeholder="User Name" required>
                                <label for="username">Username</label>
                                <div class="invalid-feedback">
                                    Username already exists!
                                </div>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="form-floating flex-fill ms-1">
                                <input type="password" class="form-control" id="password" placeholder="Password" required>
                                <label for="password">Temporary Password</label>
                            </div>
                        </div>

                        <!-- <div class="row mb-2 align-items-center">
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
                        </div> -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                        <button name="addUser" type="submit" class="btn btn-warning">Add</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


    <div class="modal fade" id="modalUserDetails" tabindex="-1" aria-labelledby="modalUserDetailsLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered " style="max-width: 40em;">
            <div class="modal-content">
                <div class="modal-header justify-content-center c-bg-yellow">
                    <h1 class="modal-title fs-5 text-center" id="modalUserDetailsLabel">User Details</h1>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <form name="form_userDetails">
                    <div class="modal-body container px-5 pt-4 pb-2">
                        <div class="d-flex">
                            <div class="form-floating mb-3 me-1 w-50">
                                <input type="text" class="form-control" id="details_fname" placeholder="First Name" disabled>
                                <label for="details_fname">First Name</label>
                            </div>
                            <div class="ms-1 w-50">
                                <select name="details_status" class="form-select py-3" disabled>
                                    <option value="0" selected disabled>- Select Status -</option>
                                    <option value="Active">Active</option>
                                    <option value="Disabled">Disabled</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="details_lname" placeholder="Last Name" disabled>
                            <label for="details_lname">Last Name</label>
                        </div>

                        <div class="d-flex">
                            <div class="form-floating mb-3 flex-fill me-1">
                                <input type="text" class="form-control" id="details_username" placeholder="User Name" disabled>
                                <label for="details_username">Username</label>
                                <div class="invalid-feedback">
                                    Username already exists!
                                </div>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <button id="reset_password" type="button" class="btn btn-outline-danger mb-3" disabled>Reset Password</button>
                            <div name="temp_password" class="form-floating flex-fill ms-1 d-none">
                                <input type="password" class="form-control" id="details_password" placeholder="Password" disabled>
                                <label for="details_password">Temporary Password</label>
                            </div>
                        </div>

                        <div class="row mb-2 align-items-center">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button name="cancel" type="button" class="btn btn-outline" data-bs-dismiss="modal">Cancel</button>
                        <button name="delete" type="button" class="btn btn-danger">Delete</button>
                        <button name="modify" type="button" class="btn btn-warning">Modify</button>
                        <button name="discard" type="button" class="btn btn-secondary">Discard</button>
                        <button name="saveChanges" type="button" class="btn btn-warning">Save Changes</button>
                    </div>
                </form>

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
    <script src="js/user-management.js"></script>

</body>

</html>