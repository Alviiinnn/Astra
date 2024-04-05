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

    var table = $("#table_main").DataTable();

    _rowdata = table.row(this).data();
    _selected_user_id = _rowdata.id;
    console.log(_rowdata);    

    $('#details_fname').val(_rowdata.first_name);
    $('#details_lname').val(_rowdata.last_name);
    $('#details_username').val(_rowdata.username);
    $('#details_password').val(_rowdata.password);
    $('select[name=details_status]').val(_rowdata.status);

    $("#modalUserDetails").modal("show");
});

// Delete Selected Item
$("button[name=delete]").click(() => {
    $('div[name=toast_delete_msg]').html(`Are you sure to delete user <b>${_rowdata.username}</b>?`);
    toast_delete.show();
    var table = $("#table_main").DataTable();

    $("button[name=delete_confirm]").click(() => {
        toast_delete.hide();
        $("#modalViewDetails").modal("hide");
        $("div[name=toast_success_msg]").html(
            `<b>${_selected_user}</b> deleted successfully!`
        );

        $.post(
            "./includes/delete.php",
            {
                requestType: "Purchase_Request",
                data_id: _selected_user_id,
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
    $("select[name=details_status]").prop('disabled', false);
});

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $('#details_fname').val(_rowdata.first_name);
    $('#details_lname').val(_rowdata.last_name);
    $('#details_username').val(_rowdata.username);
    $('#details_password').val(_rowdata.password);
    $('select[name=details_status]').val(_rowdata.status);

    $("#details_fname").prop('disabled', true);
    $("#details_lname").prop('disabled', true);
    $("#details_status").prop('disabled', true);
    $("#details_username").prop('disabled', true);
    $("#details_password").prop('disabled', true);
    $("select[name=details_status]").prop('disabled', true);
});

// Save Modified Changes on Selected Item
$("button[name=saveChanges]").click(() => {
    var input_pr_num = $("input[name=pr_num]").val();
    var input_item = $("#table_details td[data-col=item]").text();
    var input_qty_per_unit = $(
        "#table_details td[data-col=qty_per_unit]"
    ).text();
    var input_uom = $("#table_details td[data-col=uom] select").val();
    var input_unit_per_batch = $(
        "#table_details td[data-col=unit_per_batch]"
    ).text();
    var input_unitcost = $("#table_details td[data-col=unitcost]").text();
    var input_total_qty = $("#table_details td[data-col=total_qty]").text();
    var input_amount_per_unit = $(
        "#table_details td[data-col=amount_per_unit]"
    ).text();
    var input_total_amount = $(
        "#table_details td[data-col=total_amount]"
    ).text();
    var input_remarks = $("#table_details td[data-col=remarks]").text();
    var input_status = $("select[name=details_status]").val();
    var input_phase = $("input[name=details_phase]").val();
    var input_block = $("input[name=details_block]").val();
    var input_lot = $("input[name=details_lot]").val();

    // console.log("pr_num: "+input_pr_num);
    // console.log("item: "+input_item);
    // console.log("qty: "+input_qty_per_unit);
    // console.log("uom: "+input_uom);
    // console.log("unit_per_batch: "+input_unit_per_batch);
    // console.log("unitcost: "+input_unitcost);
    // console.log("total_qty: "+input_total_qty);
    // console.log("amount_per_unit: "+input_amount_per_unit);
    // console.log("total_amount: "+input_total_amount);
    // console.log("remarks: "+input_remarks);
    // console.log("status: "+input_status);
    // console.log("phase: "+input_phase);
    // console.log("block: "+input_block);
    // console.log("lot: "+input_lot);

    $("#modalViewDetails").modal("hide");
    $("div[name=toast_success_msg]").html(
        `<b>${_selected_user}</b> updated successfully!`
    );

    var table = $("#table_main").DataTable();

    $.post(
        "./includes/update.php",
        {
            requestType: "Purchase_Request",
            data_id: _selected_user_id,
            data_pr_num: input_pr_num,
            data_item: input_item,
            data_qty_per_unit: input_qty_per_unit,
            data_uom: input_uom,
            data_unit_per_batch: input_unit_per_batch,
            data_unitcost: input_unitcost,
            data_total_qty: input_total_qty,
            data_amount_per_unit: input_amount_per_unit,
            data_total_amount: input_total_amount,
            data_remarks: input_remarks,
            data_phase: input_phase,
            data_block: input_block,
            data_lot: input_lot,
            data_status: input_status,
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

//
