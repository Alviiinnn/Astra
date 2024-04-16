$("#login").on("submit", function (e) {
    e.preventDefault();
    alert();
    $.post(
        "./includes/login.php",
        $("#login").serialize(),
        function (data, status) {
            console.log(data);
            console.log(status);

            if (data.includes("Username_Not_Exists")) {
                alert("Username does not exists!");
            }

            if (data.includes("Disabled_User")) {
                alert("Sorry, your account is disabled by the Admin.");
            }

            if (data.includes("Incorrect_Password")) {
                alert("Username or Password is incorrect!");
            }

            if (data.includes("Password_Accepted")) {
                alert("Password Accepted!");
                window.location.href = "dashboard.php";
            }
        }
    );
});

$("#forgotPassword").click(() => {
    $("#username").hide();
    $("#password").hide();
    $("#forgotPassword").hide();
    $("#btnlogin").hide();

    $("#resetPass").removeClass("d-none");
    $("#resetpass_username").removeClass("d-none").val("");
    $("#cancel").removeClass("d-none");
});

$("#cancel").click(() => {
    $("#username").show();
    $("#password").show();
    $("#forgotPassword").show();
    $("#btnlogin").show();

    $("#resetPass").addClass("d-none");
    $("#resetpass_username").addClass("d-none");
    $("#cancel").addClass("d-none");
});

$("#resetPass").click(() => {
    var user_name = $("input[name=resetpass_username]").val();

    if (user_name) {
        $.post(
            "./includes/reset_password.php",
            {
                username: user_name,
            },
            function (data) {
                console.log(data);
                if (data.includes("Not_Existing")) {
                    alert("Username does not exists!");
                }
                if (data.includes("Success")) {
                    alert(
                        "Request Submitted Successfully!\nAdmin will contact you once your password is reset."
                    );

                    $("#username").show();
                    $("#password").show();
                    $("#forgotPassword").show();
                    $("#btnlogin").show();

                    $("#resetPass").addClass("d-none");
                    $("#resetpass_username").addClass("d-none");
                    $("#cancel").addClass("d-none");
                }
            }
        );
    } else {
        alert("Please input username!");
    }
});
