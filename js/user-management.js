//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
const toast_delete_id = document.getElementById("toastDelete");
const toast_delete = bootstrap.Toast.getOrCreateInstance(toast_delete_id);
var _selected_user;
var _selected_user_id;
var _rowdata;

$(document).ready(function () {
    $("#table_main").DataTable({
        ajax: {
            url: "./includes/get_users.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "username" },
            { data: "first_name" },
            { data: "last_name" },
            { data: "password" },
            { data: "status" },
        ],
        columnDefs: [
            // { targets: [11], searchable: true }, //Column 11 = Status
            // { targets: "_all", searchable: false },
        ],
        initComplete: function () {
            var api = this.api();
            var filterSelect = $("#statusFilter");

            filterSelect.on("change", function () {
                var filterValue = $(this).val();
                api.search(filterValue).draw();
            });
        },
        // layout: {
        //     bottom2End: {
        //         buttons: ["copy", "csv", "excel", "pdf", "print"],
        //     },
        // },
    });
});

$("li[name=logout]").click(() => {
    $.post("includes/logout.php");
});


// $("#table_main").DataTable({
//     paging: false,
//     info: false,
//     searching: true,
//     ordering: true,
//     columnDefs: [
//         {
//             orderable: true,
//             targets: 1,
//         },
//     ],
// });

// Move the search element
$(".dt-search").insertBefore("#table_main"); //combine with CSS Float
$("#addUser").insertBefore("#table_main");
$("#statusFilter").insertBefore("#table_main");
$(".dt-search input").removeClass("form-control-sm");

// --

$("form[name=form_addUser]").submit((event) => {
    //Reset Warnings
    event.preventDefault();
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var username = $("#username").val();
    var password = $("#password").val();

    var table = $("#table_main").DataTable();
    $('#username').removeClass('is-invalid');

    $.post(
        "./includes/validate.php",
        {
            fname: fname,
            lname: lname,
            username: username,
            password: password,
        },
        function (data, status) {
            console.log(data);
            if (data.includes("Success") && !data.includes("already_exists")) {
                $("div[name=toast_success_msg]").text(
                    "User added successfully!"
                );
                $("#modalAddUser").modal("hide");
                toast_success.show();
                table.ajax.reload();
                // location.reload();
            }
            if(data.includes("already_exists")){
                $('#username').addClass('is-invalid');
            }
        }
    );
});

//Event to view the details modal
$("#table_main tbody").on("click", "tr", function () {
    $('button[name=discard]').hide();
    $('button[name=saveChanges]').hide();
    $('button[name=cancel]').show();
    $('button[name=delete]').show();
    $('button[name=modify]').show();
    $('div[name=temp_password]').addClass('d-none');

    $("#details_fname").prop('disabled', true);
    $("#details_lname").prop('disabled', true);
    $("#details_status").prop('disabled', true);
    $("#details_username").prop('disabled', true);
    $("#details_password").prop('disabled', true);
    $("#reset_password").prop('disabled', true).show();
    $("select[name=details_status]").prop('disabled', true);

    var table = $("#table_main").DataTable();

    _rowdata = table.row(this).data();
    _selected_user_id = _rowdata.id;
    _selected_user = _rowdata.username;
    console.log(_rowdata);    

    $('#details_fname').val(_rowdata.first_name);
    $('#details_lname').val(_rowdata.last_name);
    $('#details_username').val(_rowdata.username);
    $('select[name=details_status]').val(_rowdata.status);
    $('#details_password').val("");

    $("#modalUserDetails").modal("show");
});

// Delete Selected Item
$("button[name=delete]").click(() => {
    $('div[name=toast_delete_msg]').html(`Are you sure to delete user <b>${_rowdata.username}</b>?`);
    toast_delete.show();
    var table = $("#table_main").DataTable();

    $("button[name=delete_confirm]").click(() => {
        toast_delete.hide();
        $("#modalUserDetails").modal("hide");
        $("div[name=toast_success_msg]").html(
            `<b>${_selected_user}</b> deleted successfully!`
        );

        $.post(
            "./includes/delete.php",
            {
                requestType: "User_Management",
                data_id: _selected_user_id,
                data_username: _selected_user
            },
            function (data) {
                console.log(data);
                if (data.includes("Success")) {
                    toast_success.show();
                    table.ajax.reload();
                }
            }
        );
    });
});

// Modify Selected Item
$("button[name=modify]").click(() => {
    $("button[name=cancel]").hide();
    $("button[name=modify]").hide();
    $("button[name=delete]").hide();
    $("button[name=discard]").show();
    $("button[name=saveChanges]").show();

    $("#details_fname").prop('disabled', false);
    $("#details_lname").prop('disabled', false);
    $("#details_status").prop('disabled', false);
    $("#details_username").prop('disabled', false);
    $("#details_password").prop('disabled', false);
    $("#reset_password").prop('disabled', false);
    $("select[name=details_status]").prop('disabled', false);
});

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("#reset_password").show();
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();
    $("div[name=temp_password]").addClass('d-none');

    $('#details_fname').val(_rowdata.first_name);
    $('#details_lname').val(_rowdata.last_name);
    $('#details_username').val(_rowdata.username);
    $('#details_password').val("");
    $('select[name=details_status]').val(_rowdata.status);

    $("#details_fname").prop('disabled', true);
    $("#details_lname").prop('disabled', true);
    $("#details_status").prop('disabled', true);
    $("#details_username").prop('disabled', true);
    $("#details_password").prop('disabled', true);
    $("#reset_password").prop('disabled', true);
    $("select[name=details_status]").prop('disabled', true);
});

// Save Modified Changes on Selected Item
$("button[name=saveChanges]").click(() => {
    var firstname = $('#details_fname').val();
    var lastname = $('#details_lname').val();
    var status = $('select[name=details_status]').val();
    var username = $('#details_username').val();
    var password = $('#details_password').val();

    // console.log("firstname: "+firstname);
    // console.log("lastname: "+lastname);
    // console.log("status: "+status);
    // console.log("username: "+username);
    console.log("password: "+password);

    $("div[name=toast_success_msg]").html(
        `<b>${_selected_user}</b> updated successfully!`
    );

    var table = $("#table_main").DataTable();

    $.post(
        "./includes/update.php",
        {
            requestType: "User_Management",
            data_id: _selected_user_id,
            data_fname: firstname,
            data_lname: lastname,
            data_status: status,
            data_username: username,
            data_password: password
        },
        function (data) {
            console.log(data);
            if (data.includes("Success")) {
                $('#display_name').html(firstname +" "+lastname);
                $("#modalUserDetails").modal("hide");
                toast_success.show();
                table.ajax.reload();
                
            }
        }
    );
});


$("#reset_password").click(function(){
    $(this).hide();
    $('div[name=temp_password]').removeClass('d-none');
});

//