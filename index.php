<?php
session_start();

if (isset($_SESSION['username'])) {
    header("Location: dashboard.php");
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Astra</title>
    <link href="libraries/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <script src="libraries/bootstrap.bundle.min.js"></script>
    <script src="libraries/jquery-uncompressed.js"></script>

</head>

<body>

    <div class="container-fluid text-center">
        <div class="row align-items-center">

            <div class="col c-bg-darkgreen slant-div">
                <div class="row justify-content-center" style="margin-top: 15rem;">
                    <div class="col-md-6 mt-5">
                        <h1 class="text-start text-white c-font-login mb-5">Inventory<br>Management <br>System</h1>

                        <form id="login" method="POST" action="">
                            <div class="mb-3">
                                <input type="text" class="form-control rounded-1" id="username" name="username" placeholder="Username" required>
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control rounded-1" id="password" name="password" placeholder="Password" required>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn c-bg-green text-white shadow">LOGIN</button>
                                <label><a href="#" class="text-white">Forgot Password</a></label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col">
                <img style="width: 15rem;" src="img/logo.jpg" alt="Astra Logo" />
            </div>
        </div>
    </div>

    <script src="js/login.js"></script>

</body>

</html>