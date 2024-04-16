$("#login").on("submit", function (e) {
    e.preventDefault();
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

            if (data.includes("Not_Yet_Reset")) {
                alert(
                    "You submitted a request to reset your password.\nWait for the Admin to give your temporary password."
                );
            }

            if (data.includes("Reset_Password")) {
                alert("You used the temporary password given by the Admin.\nChange your password now!");
                $("form[name=login]").hide();
                $("form[name=setNewPassword]").removeClass("d-none");
                $('#ims').text('Create New Password');
                $('input[name=username_changepass]').val($('#username').val());
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

$("form[name=setNewPassword]").on("submit", function (e) {
    e.preventDefault();
    var new_pass = $("#new_password").val();
    var confirm_pass = $("#confirm_newpass").val();

    if (new_pass != confirm_pass) {
        alert("Password not matched!");
    } else {
        $.post(
            "./includes/change_pass.php",
            $("form[name=setNewPassword]").serialize(),
            function (data) {
                if(data.includes('Success')){
                    alert('Password Changed Successfully!\nYou may try to login now');
                    location.reload();
                }
            }
        );
    }
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
