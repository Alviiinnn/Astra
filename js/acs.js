//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
var _selected_item;
var _rowdata;

$(document).ready(function () {
    $("#table_main").DataTable({
        ajax: {
            url: "./includes/get_user_access.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "username" },
            { data: "purchase" },
            { data: "withdrawal" },
            { data: "delivery" },
            { data: "inventory" },
            { data: "user_access" },
            { data: "user_management" },
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
        paging: false,
        info: false,

        // initComplete: function () {
        //     this.api()
        //         .columns()
        //         .every(function () {
        //             let column = this;
        //             // Create select element
        //             let select = document.createElement("select");
        //             select.classList.add("form-select");
        //             select.add(new Option(""));
        //             column.footer().replaceChildren(select);
        //             // Apply listener for user change in value
        //             select.addEventListener("change", function () {
        //                 column.search(select.value, { exact: true }).draw();
        //             });
        //             // Add list of options
        //             column
        //                 .data()
        //                 .unique()
        //                 .sort()
        //                 .each(function (d, j) {
        //                     select.add(new Option(d));
        //                 });
        //         });
        // },
    });

    //USER ACCESS
    var user = $("input[name=username]").val();

    $.post("./includes/select.php", {
        requestType: "Access_Control",
        username: user
    }).done(function (data) {
        var data_purchase = data[0].purchase;
        var data_withdrawal = data[0].withdrawal;
        var data_delivery = data[0].delivery;
        var data_inventory = data[0].inventory;
        var data_userAccess = data[0].user_access;
        var data_management = data[0].user_management;

        console.log("purchase:" + data_purchase);
        console.log("withdrawal: " + data_withdrawal);
        console.log("delivery: " + data_delivery);
        console.log("inventory: " + data_inventory);
        console.log("access: " + data_userAccess);
        console.log("management: " + data_management);

        if(data_userAccess == "None"){
            location.href = "dashboard.php";
        }

        if (data_purchase != "None" || data_withdrawal != "None") {
            $("#link_requests").removeClass("d-none");
        } else {
            if (data_purchase != "None") {
                $("#link_pr").removeClass("d-none");
            }
            if (data_withdrawal != "None") {
                $("#link_withdrawal").removeClass("d-none");
            }
        }

        if (data_delivery != "None") {
            $("#link_delivery").removeClass("d-none");
        }
        if (data_inventory != "None") {
            $("#link_inventory").removeClass("d-none");
        }

        if (data_management != "None" || data_userAccess != "None") {
            $("#link_users").removeClass("d-none");
        } else {
            if (data_management != "None") {
                $("#link_management").removeClass("d-none");
            }
            if (data_userAccess != "None") {
                $("#link_accessControl").removeClass("d-none");
            }
        }

        if (!data_userAccess.includes("Edit")) {
            $('button[name=modify]').remove();
        }
    }); //end of User Access

}); //end of document ready

$("li[name=logout]").click(() => {
    $.post("includes/logout.php");
});

// Move the search element
$(".dt-search").insertBefore("#table_main"); //combine with CSS Float
$("#addRequest").insertBefore("#table_main");
$("#statusFilter").insertBefore("#table_main");
$(".dt-search input").removeClass("form-control-sm");

//Event to view the details modal
$("#table_main tbody").on("click", "tr", function () {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("input.cbx_pr:checkbox").prop("checked", false);
    $("input.cbx_delivery:checkbox").prop("checked", false);
    $("input.cbx_inventory:checkbox").prop("checked", false);
    $("input.cbx_withdrawal:checkbox").prop("checked", false);
    $("input.cbx_accesscontrol:checkbox").prop("checked", false);
    $("input.cbx_management:checkbox").prop("checked", false);

    $("input.cbx_pr:checkbox").prop("disabled", true);
    $("input.cbx_delivery:checkbox").prop("disabled", true);
    $("input.cbx_inventory:checkbox").prop("disabled", true);
    $("input.cbx_withdrawal:checkbox").prop("disabled", true);
    $("input.cbx_accesscontrol:checkbox").prop("disabled", true);
    $("input.cbx_management:checkbox").prop("disabled", true);

    var table = $("#table_main").DataTable();

    _rowdata = table.row(this).data();
    _selected_item = _rowdata.username;
    console.log(_rowdata);
    // fx_check(_rowdata.purchase);
    $("div[name=toast_success_msg]").html(""); //Reset

    fx_check(_rowdata.purchase, "pr");
    fx_check(_rowdata.delivery, "delivery");
    fx_check(_rowdata.inventory, "inventory");
    fx_check(_rowdata.withdrawal, "withdrawal");
    fx_check(_rowdata.user_access, "accesscontrol");
    fx_check(_rowdata.user_management, "management");

    function fx_check(data, page) {
        if (data.includes("View")) {
            $(`#cbx_${page}_view`).prop("checked", true);
        }
        if (data.includes("Add")) {
            $(`#cbx_${page}_add`).prop("checked", true);
        }
        if (data.includes("Edit")) {
            $(`#cbx_${page}_edit`).prop("checked", true);
        }
        if (data.includes("Delete")) {
            $(`#cbx_${page}_delete`).prop("checked", true);
        }
    }

    $("#modalModifyAccess").modal("show");
});

// Modify Selected Item
$("button[name=modify]").click(() => {
    $("button[name=cancel]").hide();
    $("button[name=modify]").hide();
    $("button[name=discard]").show();
    $("button[name=saveChanges]").show();

    $("input.cbx_pr:checkbox").prop("disabled", false);
    $("input.cbx_delivery:checkbox").prop("disabled", false);
    $("input.cbx_inventory:checkbox").prop("disabled", false);
    $("input.cbx_withdrawal:checkbox").prop("disabled", false);
    $("input.cbx_accesscontrol:checkbox").prop("disabled", false);
    $("input.cbx_management:checkbox").prop("disabled", false);
});

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("input.cbx_pr:checkbox").prop("disabled", true);
    $("input.cbx_delivery:checkbox").prop("disabled", true);
    $("input.cbx_inventory:checkbox").prop("disabled", true);
    $("input.cbx_withdrawal:checkbox").prop("disabled", true);
    $("input.cbx_accesscontrol:checkbox").prop("disabled", true);
    $("input.cbx_management:checkbox").prop("disabled", true);

    fx_check(_rowdata.purchase, "pr");
    fx_check(_rowdata.delivery, "delivery");
    fx_check(_rowdata.inventory, "inventory");
    fx_check(_rowdata.withdrawal, "withdrawal");
    fx_check(_rowdata.user_access, "accesscontrol");
    fx_check(_rowdata.user_management, "management");

    function fx_check(data, page) {
        if (data.includes("View")) {
            $(`#cbx_${page}_view`).prop("checked", true);
        }
        if (data.includes("Add")) {
            $(`#cbx_${page}_add`).prop("checked", true);
        }
        if (data.includes("Edit")) {
            $(`#cbx_${page}_edit`).prop("checked", true);
        }
        if (data.includes("Delete")) {
            $(`#cbx_${page}_delete`).prop("checked", true);
        }
    }
});

// Save Modified Changes on Selected Item
$("button[name=saveChanges]").click(() => {
    var checked_pr = fx_getChecked("pr");
    var checked_delivery = fx_getChecked("delivery");
    var checked_inventory = fx_getChecked("inventory");
    var checked_withdrawal = fx_getChecked("withdrawal");
    var checked_accesscontrol = fx_getChecked("accesscontrol");
    var checked_management = fx_getChecked("management");

    function fx_getChecked(page) {
        var checkedItems = [];
        $(`.cbx_${page}:checkbox:checked`).each(function () {
            checkedItems.push($(this).val());
        });
        return JSON.stringify(checkedItems);
    }

    // FOR TESTING
    // console.log(checked_pr);
    // console.log(checked_delivery);
    // console.log(checked_inventory);
    // console.log(checked_withdrawal);
    // console.log(checked_accesscontrol);
    // console.log(checked_management);

    var table = $("#table_main").DataTable();

    var json_pr = JSON.parse(checked_pr);
    var json_delivery = JSON.parse(checked_delivery);
    var json_inventory = JSON.parse(checked_inventory);
    var json_withdrawal = JSON.parse(checked_withdrawal);
    var json_accesscontrol = JSON.parse(checked_accesscontrol);
    var json_management = JSON.parse(checked_management);

    $("div[name=toast_success_msg]").html(
        `<b>${_selected_item}</b>'s access was updated`
    );

    $.post(
        "./includes/update.php",
        {
            requestType: "Access_Control",
            data_username: _selected_item,
            data_pr: json_pr,
            data_delivery: json_delivery,
            data_inventory: json_inventory,
            data_withdrawal: json_withdrawal,
            data_accesscontrol: json_accesscontrol,
            data_management: json_management,
        },
        function (data) {
            console.log(data);
            if (data.includes("Success")) {
                toast_success.show();
                table.ajax.reload();
                $("#modalModifyAccess").modal("hide");
                location.reload();
            }
        }
    );
});
