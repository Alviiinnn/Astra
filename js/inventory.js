//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
const toast_delete_id = document.getElementById("toastDelete");
const toast_delete = bootstrap.Toast.getOrCreateInstance(toast_delete_id);
var _selected_item;
var _selected_item_id;
var _rowdata;

$(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const dashboard_card = urlParams.get("filter");

    $("#table_main").DataTable({
        // ajax: function (data, callback, settings) {
        //     $.getJSON("./includes/get_inventory.php", function (json) {
        //         // Check if the data array is empty
        //         console.log(data);
        //         console.log(callback);
        //         console.log(settings);
        //         if (json.data && json.data.length === 0) {
        //             // Handle empty data scenario (e.g., display a message)
        //             callback({
        //                 data: [], // Return an empty data array to prevent errors
        //             });
        //         } else {
        //             callback(json); // Process data as usual
        //         }
        //     });
        // },
        // oLanguage: {
        //     sEmptyTable: "My Custom Message On Empty Table",
        // },
        // language: {
        //     emptyTable: "Nooo data",
        //     infoEmpty: "No entries to show",
        // },
        ajax: {
            url: "./includes/get_inventory.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "item" },
            { data: "category" },
            { data: "stock_qty" },
            { data: "base_stock_uom" },
            { data: "percentage_level" },
            { data: "stock_level" },
        ],

        columnDefs: [
            // { targets: [2, 4], searchable: true }, //Column 2 = Category; Column 4 = Stock Level
            // { targets: "_all", searchable: false },
        ],
        initComplete: function () {
            var api = this.api();
            var filterCategory = $("#filter_category");
            var filterStockLevel = $("#filter_stocklevel");

            filterCategory.on("change", function () {
                var filterValue = $(this).val();
                api.search(filterValue).draw();
            });

            filterStockLevel.on("change", function () {
                var filterValue = $(this).val();
                api.search(filterValue).draw();
            });

            if (dashboard_card == "Maximum") {
                api.search("Maximum").draw();
            }
            if (dashboard_card == "Safe") {
                api.search("Safe").draw();
            }
            if (dashboard_card == "Minimum") {
                api.search("Minimum").draw();
            }
            if (dashboard_card == "Critical") {
                api.search("Critical").draw();
            }
        },
        layout: {
            bottom2End: {
                buttons: ["copy", "csv", "excel", "pdf", "print"],
            },
            // top2Start: 'pageLength',
            // top2End: 'search',
            // topStart: 'info',
            // topEnd: 'paging',
            // bottomStart: 'pageLength',
            // bottomCenter: {
            //     buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
            // },
            // bottom2End: 'paging'
        },

        // initComplete: function () {
        //     this.api()
        //         .columns()
        //         .every(function () {
        //             let column = this;

        //             // Create select element
        //             let select = document.createElement('select');
        //             select.classList.add('form-select');
        //             select.add(new Option(''));
        //             column.footer().replaceChildren(select);

        //             // Apply listener for user change in value
        //             select.addEventListener('change', function () {
        //                 column
        //                     .search(select.value, {exact: true})
        //                     .draw();
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
        // }
    });

    $.get("./includes/get_purchase_request.php").done(function (data) {
        // _data = data;
        console.log(data);
        // for (var i of data) {
        //     _arr_items.push(i.item);
        //     _arr_items_uom.push(i.uom);
        //     _arr_items_id.push(i.id);
        //     _str_items +=
        //         "<option value='" +
        //         i.id +
        //         "' data-uom='" +
        //         i.uom +
        //         "'>" +
        //         i.item +
        //         "</option>";
        // }
        // $("select[name=item_list]").append(_str_items);
    });

    //USER ACCESS
    var user = $("input[name=username]").val();

    $.post("./includes/select.php", {
        requestType: "Access_Control",
        username: user
    }).done(function (data) {
        var data_purchase = data[0].purchase;
        var data_delivery = data[0].delivery;
        var data_inventory = data[0].inventory;
        var data_withdrawal = data[0].withdrawal;
        var data_userAccess = data[0].user_access;
        var data_management = data[0].user_management;

        //FOR TESTING
        console.log("purchase:"+data_purchase);
        console.log("delivery: "+data_delivery);
        console.log("inventory: "+data_inventory);
        console.log("withdrawal: "+data_withdrawal);
        console.log("access: "+data_userAccess);
        console.log("management: "+data_management);

        if(data_inventory == "None"){
            location.href = "dashboard.php";
        }

        if (data_purchase != "None" || data_withdrawal != "None") {
            $("#link_requests").removeClass("d-none");
            if (data_purchase != "None") {
                $("#link_pr").removeClass("d-none");
            }
            if (data_withdrawal != "None") {
                $("#link_withdrawal").removeClass("d-none");
            }
        } else {

        }

        if (data_delivery != "None") {
            $("#link_delivery").removeClass("d-none");
        }
        if (data_inventory != "None") {
            $("#link_inventory").removeClass("d-none");
        }

        if (data_management != "None" || data_userAccess != "None") {
            $("#link_users").removeClass("d-none");
            if (data_management != "None") {
                $("#link_management").removeClass("d-none");
            }
            if (data_userAccess != "None") {
                $("#link_accessControl").removeClass("d-none");
            }
        } else {
            // if (data_management != "None") {
            //     $("#link_management").removeClass("d-none");
            // }
            // if (data_userAccess != "None") {
            //     $("#link_accessControl").removeClass("d-none");
            // }
        }

        if (!data_inventory.includes("Edit")) {
            $('button[name=modify]').remove();
        }
        if (!data_inventory.includes("Delete")) {
            $('button[name=delete]').remove();
        }

    }); //end of User Access

}); //end of ready document

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
// $(".dt-search").insertBefore("#table_main"); //combine with CSS Float

$("button[name=addRow]").click(() => {
    // var ctr = $('#table_form tr:eq(5) td').eq(0).text();
    $("button[name=removeRow]").prop("disabled", false);
    var ctr = $("#table_form tr").length;
    var row = "<tr>";
    row += `<td>${ctr}</td>`;
    row +=
        "<td contenteditable data-required='1' data-col='item' class='text-start'></td>";
    row += "<td data-dropdown='1' data-col='category'>";
    row += "    <select class='form-select border-0'>";
    row += "        <option>Electrical</option>";
    row += "        <option>Masonry</option>";
    row += "        <option>Plumbing</option>";
    row += "        <option>Carpentry</option>";
    row += "    </select>";
    row += "</td>";
    row += "<td contenteditable data-int='1' data-col='qty'>0</td>";
    row += "<td data-dropdown='1' data-col='uom'>";
    row += "    <select class='form-select border-0'>";
    row += "        <option>pcs</option>";
    row += "        <option>bags</option>";
    row += "        <option>kl</option>";
    row += "        <option>box</option>";
    row += "        <option>gal</option>";
    row += "        <option>tin</option>";
    row += "        <option>ltrs</option>";
    row += "        <option>cu. m</option>";
    row += "        <option>roll</option>";
    row += "        <option>can</option>";
    row += "        <option>set</option>";
    row += "    </select>";
    row += "</td>";
    row += "<td contenteditable data-int='1' data-col='unitcost'>0</td>";
    row += "<td contenteditable data-col='remarks' class='text-start'></td>";
    row += "</tr>";

    $("#table_form").append(row);
});

//

$("button[name=removeRow]").click(() => {
    var ctr = $("#table_form tr").length - 1;
    $("#table_form tr").eq(ctr).remove();
    if (ctr <= 2) {
        $("button[name=removeRow]").prop("disabled", true);
    }
});

//

$("button[name=add]").click(() => {
    //reset warnings
    $("span[name=warning_item]").removeClass("d-block").addClass("d-none");
    $("span[name=warning_numbers]").removeClass("d-block").addClass("d-none");

    var table = $("#table_form");
    var is_ready = true;
    var data_item = new Array();
    var data_category = new Array();
    var data_uom = new Array();
    var data_qty = new Array();
    var data_unitcost = new Array();
    var data_remarks = new Array();

    //Consolidate Table Data
    table.find("tr").each(function (index, row) {
        if (index) {
            $(this)
                .find("td")
                .each(function (index, cell) {
                    switch ($(cell).data("col")) {
                        case "item":
                            data_item.push($(cell).text());
                            break;
                        case "qty":
                            data_qty.push($(cell).text());
                            break;
                        case "unitcost":
                            data_unitcost.push($(cell).text());
                            break;
                        case "remarks":
                            data_remarks.push($(cell).text());
                            break;
                        default:
                            break;
                    }

                    if ($(cell).data("dropdown")) {
                        switch ($(cell).data("col")) {
                            case "category":
                                data_category.push(
                                    $(cell).find("select").val()
                                );
                                break;
                            case "uom":
                                data_uom.push($(cell).find("select").val());
                                break;
                            default:
                                break;
                        }
                    }

                    $(cell).removeClass("border border-danger");

                    //Validate numeric entries
                    if ($(cell).data("int")) {
                        if (!$.isNumeric($(cell).text())) {
                            $(cell).addClass("border border-danger");
                            $("span[name=warning_numbers]")
                                .removeClass("d-none")
                                .addClass("d-block");
                            is_ready = false;
                        }
                    }

                    if ($(cell).data("required") && $(cell).text() == "") {
                        $(cell).addClass("border border-danger");
                        $("span[name=warning_item]")
                            .removeClass("d-none")
                            .addClass("d-block");
                        is_ready = false;
                    }
                });
        }
    });

    // FOR TESTING
    // console.log(is_ready);
    // console.log(data_item);
    // console.log(data_category);
    // console.log(data_uom);
    // console.log(data_qty);
    // console.log(data_unitcost);
    // console.log(data_remarks);

    if (is_ready) {
        var json_item = JSON.stringify(data_item);
        var json_category = JSON.stringify(data_category);
        var json_uom = JSON.stringify(data_uom);
        var json_qty = JSON.stringify(data_qty);
        var json_unitcost = JSON.stringify(data_unitcost);
        var json_remarks = JSON.stringify(data_remarks);

        $.post(
            "./includes/insert.php",
            {
                requestType: "Add_Stock",
                data_item: json_item,
                data_category: json_category,
                data_uom: json_uom,
                data_qty: json_qty,
                data_unitcost: json_unitcost,
                data_remarks: json_remarks,
            },
            function (data, status) {
                var table = $("#table_main").DataTable();

                if (data.includes("Success")) {
                    $("div[name=toast_success_msg]").text(
                        "Stocks are added successfully!"
                    );
                    $("#modalAddStock").modal("hide");
                    toast_success.show();
                    table.ajax.reload();
                    // location.reload();
                }
            }
        );
    }
});

//Event to view the details modal
$("#table_main tbody").on("click", "tr", function () {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    var table = $("#table_main").DataTable();
    _rowdata = table.row(this).data();
    _selected_item = _rowdata.item;
    _selected_item_id = _rowdata.id;
    console.log(_rowdata);

    $("div[name=toast_delete_msg]").append(""); //Reset
    $("div[name=toast_delete_msg]")
        .html("")
        .append(`Are you sure to delete <b>${_selected_item}?</b>`);

    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=category]").text(_rowdata.category);
    $("#table_details td[data-col=qty]").text(_rowdata.quantity);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=unitcost]").text(_rowdata.unitcost);
    $("#table_details td[data-col=remarks]").text(_rowdata.remarks);

    $("#table_details td[data-col=item]").removeAttr("contenteditable");
    $("#table_details td[data-col=qty]").removeAttr("contenteditable");
    $("#table_details td[data-col=uom]").removeAttr("contenteditable");
    $("#table_details td[data-col=unitcost]").removeAttr("contenteditable");
    $("#table_details td[data-col=remarks]").removeAttr("contenteditable");

    // You can perform actions based on the data here
    // For example, open a modal with row details

    $("#modalViewDetails").modal("show");
});

// --

$("button[name=delete]").click(() => {
    toast_delete.show();
    var table = $("#table_main").DataTable();

    $("button[name=delete_confirm]").click(() => {
        toast_delete.hide();
        $("#modalViewDetails").modal("hide");
        $("div[name=toast_success_msg]").html(
            `<b>${_selected_item}</b> deleted successfully!`
        );

        $.post(
            "./includes/delete.php",
            {
                requestType: "Inventory",
                data_id: _selected_item_id,
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

// --

$("button[name=modify]").click(() => {
    $("button[name=cancel]").hide();
    $("button[name=delete]").hide();
    $("button[name=modify]").hide();
    $("button[name=discard]").show();
    $("button[name=saveChanges]").show();

    var category_dropdown = `<select class="form-select">
        <option>Electrical</option>
        <option>Masonry</option>
        <option>Plumbing</option>
        <option>Carpentry</option>
    </select>`;

    var uom_dropdown = `<select class="form-select">
        <option>pcs</option>
        <option>bags</option>
        <option>kl</option>
        <option>box</option>
        <option>gal</option>
        <option>tin</option>
        <option>ltrs</option>
        <option>cu. m</option>
        <option>roll</option>
        <option>can</option>
        <option>set</option>
    </select>`;

    $("#table_details td[data-col=category]")
        .text("")
        .append(category_dropdown);
    $("#table_details td[data-col=uom]").text("").append(uom_dropdown);

    $("#table_details td[data-col=category] select").val(_rowdata.category);
    $("#table_details td[data-col=uom] select").val(_rowdata.uom);

    $("#table_details td[data-col=item]").prop("contenteditable", true);
    $("#table_details td[data-col=qty]").prop("contenteditable", true);
    $("#table_details td[data-col=unitcost]").prop("contenteditable", true);
    $("#table_details td[data-col=remarks]").prop("contenteditable", true);
});

// --

$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("#table_details td[data-col=category] select").remove();
    $("#table_details td[data-col=uom] select").remove();

    $("#table_details td[data-col=category]").removeAttr("contenteditable");

    $("#table_details td[data-col=item]").removeAttr("contenteditable");
    $("#table_details td[data-col=qty]").removeAttr("contenteditable");
    $("#table_details td[data-col=unitcost]").removeAttr("contenteditable");
    $("#table_details td[data-col=remarks]").removeAttr("contenteditable");

    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=category]").text(_rowdata.category);
    $("#table_details td[data-col=qty]").text(_rowdata.quantity);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=unitcost]").text(_rowdata.unitcost);
    $("#table_details td[data-col=remarks]").text(_rowdata.remarks);
});

// --

$("button[name=saveChanges]").click(() => {
    var table = $("#table_main").DataTable();

    var input_item = $("#table_details td[data-col=item]").text();
    var input_qty = $("#table_details td[data-col=qty]").text();
    var input_unitcost = $("#table_details td[data-col=unitcost]").text();
    var input_remarks = $("#table_details td[data-col=remarks]").text();
    var input_category = $("#table_details td[data-col=category] select").val();
    var input_uom = $("#table_details td[data-col=uom] select").val();

    //Validation
    if (input_qty > _rowdata.requested_stock) {
        $("div[name=warning_general]")
            .html(
                "<b>Qty</b> must be less than or equal to <b>Requested Stock</b>!"
            )
            .removeClass("d-none")
            .addClass("d-block");
        $("#table_details td[data-col=qty]").addClass("border border-danger");
    } else {
        $("div[name=warning_general]")
            .removeClass("d-block")
            .addClass("d-none");
        $("#table_details td[data-col=qty]").removeClass(
            "border border-danger"
        );

        $.post(
            "./includes/update.php",
            {
                requestType: "Inventory",
                data_id: _selected_item_id,
                data_item: input_item,
                data_qty: input_qty,
                data_unitcost: input_unitcost,
                data_remarks: input_remarks,
                data_category: input_category,
                data_uom: input_uom,
            },
            function (data) {
                console.log(data);
                if (data.includes("Success")) {
                    toast_success.show();
                    table.ajax.reload();

                    $("#modalViewDetails").modal("hide");
                    $("div[name=toast_success_msg]").html(
                        `<b>${_selected_item}</b> updated successfully!`
                    );
                }
            }
        );
    }

    // console.log(input_item);
    // console.log(input_category);
    // console.log(input_qty);
    // console.log(input_uom);
    // console.log(input_unitcost);
    // console.log(input_remarks);
});
