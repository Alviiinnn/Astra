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
    <title>Dashboard</title>
    <link href="libraries/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <script src="libraries/bootstrap.bundle.min.js"></script>
    <script src="libraries/jquery-uncompressed.js"></script>
    <script src="libraries/chart.js"></script>

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
                    <li class="nav-item px-1"><a href="dashboard.php" class="nav-link c-darkgreen c-bold" aria-current="page">Dashboard</a></li>
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
                    <li id="link_users" class="nav-item px-1 dropdown ">
                        <a class="nav-link c-darkgreen dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Users
                        </a>
                        <ul class="dropdown-menu">
                            <li id="link_accessControl" class="d-none"><a class="dropdown-item" href="access-control.php">Access Control</a></li>
                            <li id="link_management" class="d-none"><a class="dropdown-item" href="user-management.php">User Management</a></li>
                        </ul>
                    </li>
                    <li class="nav-item px-1"><?php echo $_SESSION['firstname'] ." ".$_SESSION['lastname']; ?></li>

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

    <div class="container mb-5">
        <div class="d-flex justify-content-between text-white c-text-shadow-1">
            <div id="card_max" class="c-bg-blue rounded flex-fill mx-2 p-4 c-card-shadow" role="button">
                <h1 id="max_count" class="">0</h1>
                <p class="m-0">materials</p>
                <hr style="border: 1px solid white;" />
                <p class="m-0 text-end">Maximum</p>
            </div>
            <div id="card_safe" class="c-bg-green rounded flex-fill mx-2 p-4 c-card-shadow" role="button">
                <h1 id="safe_count" class="">0</h1>
                <p class="m-0">materials</p>
                <hr style="border: 1px solid white;" />
                <p class="m-0 text-end">Safe</p>
            </div>
            <div id="card_min" class="c-bg-yellow rounded flex-fill mx-2 p-4 c-card-shadow" role="button">
                <h1 id="min_count" class="">0</h1>
                <p class="m-0">materials</p>
                <hr style="border: 1px solid white;" />
                <p class="m-0 text-end">Minimum</p>
            </div>
            <div id="card_crit" class="c-bg-red rounded flex-fill mx-2 p-4 c-card-shadow" role="button">
                <h1 id="crit_count" class="">0</h1>
                <p class="m-0">materials</p>
                <hr style="border: 1px solid white;" />
                <p class="m-0 text-end">Critical</p>
            </div>
        </div>

    </div>

    <div class="container mb-5">
        <canvas id="myChart" style="width:100%;max-width:82em;font-family: inherit!important;"></canvas>
    </div>



    <script src="./js/dashboard.js"></script>

</body>

</html>