//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
const toast_delete_id = document.getElementById("toastDelete");
const toast_delete = bootstrap.Toast.getOrCreateInstance(toast_delete_id);
var _selected_item;
var _selected_item_id;
var _rowdata;

//Initialize Tooltip
const tooltipTriggerList = document.querySelectorAll(
    '[data-bs-toggle="tooltip"]'
);
const tooltipList = [...tooltipTriggerList].map(
    (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl)
);

$(document).ready(function () {
    $("#table_main").DataTable({
        ajax: {
            url: "./includes/get_purchase_request.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "pr_number" },
            { data: "item" },
            { data: "qty_per_unit" },
            { data: "uom" },
            { data: "unit_per_batch" },
            { data: "unitcost" },
            { data: "total_qty" },
            { data: "phase" },
            { data: "block" },
            { data: "lot" },
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
        layout: {
            bottom2End: {
                buttons: ["copy", "csv", "excel", "pdf", "print"],
            },
        },

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
        username: user,
    }).done(function (data) {
        var data_purchase = data[0].purchase;
        var data_delivery = data[0].delivery;
        var data_inventory = data[0].inventory;
        var data_withdrawal = data[0].withdrawal;
        var data_userAccess = data[0].user_access;
        var data_management = data[0].user_management;

        //FOR TESTING
        // console.log("purchase:" + data_purchase);
        // console.log("delivery: " + data_delivery);
        // console.log("inventory: " + data_inventory);
        // console.log("withdrawal: " + data_withdrawal);
        // console.log("access: " + data_userAccess);
        // console.log("management: " + data_management);

        if(data_purchase == "None"){
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

        //Specific for PR Page
        if (!data_purchase.includes("Add")) {
            $("#addRequest").prop('disabled', true);
            // $("#addRequest").css('visibility', 'hidden');

            // $("#addRequest")
            //     .removeAttr("data-bs-target")
            //     .removeAttr("data-bs-toggle")
            //     .attr({
            //         "data-bs-toggle": "tooltip",
            //         "data-bs-placement": "top",
            //         "data-bs-title": "This button are disabled by admin"
            //     });
        }
        if (!data_purchase.includes("Edit")) {
            $("button[name=modify]").remove();
        }
        if (!data_purchase.includes("Delete")) {
            $("button[name=delete]").remove();
        }
    }); //end of User Access
}); //end of document ready

$("li[name=logout]").click(() => {
    $.post("includes/logout.php");
});

// ON EVENTS
$(document)
    .on(
        "keydown",
        "td[data-col=qty_per_unit], td[data-col=unit_per_batch], td[data-col=unitcost]",
        function (event) {
            var key = String.fromCharCode(event.which);
            var regex = /^\d+$/; // Regex for only digits

            // Allow backspace and delete keys
            if (
                event.keyCode === 8 ||
                event.keyCode === 46 ||
                event.keyCode === 190 ||
                event.keyCode === 110 ||
                event.keyCode === 9
            ) {
                return true;
            }

            if (event.keyCode > 95 && event.keyCode < 106) {
                return true;
            }

            // Allow only digits and prevent default action for others
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }
    )

    .on("keyup", "td[data-col=qty_per_unit]", function () {
        var qtyperunit = $(this).text();
        var unitperbatch = $(this).next().next().text();
        var unitcost = $(this).next().next().next().text();
        var total_qty = qtyperunit * unitperbatch;
        var amountperunit = qtyperunit * unitcost;

        $(this).next().next().next().next().text(total_qty);
        $(this).next().next().next().next().next().text(amountperunit);
    })

    .on("keyup", "td[data-col=unit_per_batch]", function () {
        var unitperbatch = $(this).text();
        var qtyperunit = $(this).prev().prev().text();
        var total_qty = qtyperunit * unitperbatch;

        $(this).next().next().text(total_qty);
    })

    .on("keyup", "td[data-col=unitcost]", function () {
        var unitcost = $(this).text();
        var qtyperunit = $(this).prev().prev().prev().text();
        var totalqty = $(this).next().text();
        var amountperunit = qtyperunit * unitcost;
        var totalamount = unitcost * totalqty;

        $(this).next().next().text(amountperunit);
        $(this).next().next().next().text(totalamount);
    });

// .on("keyup", "td[data-col=unitcost]", function () {
//     var qty = $(this).prev().prev().text();
//     var unitcost = $(this).text();
//     var amount = qty * unitcost;
//     $(this).next().text(amount);
// });
// ON EVENTS end

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
$("#addRequest").insertBefore("#table_main");
$("#statusFilter").insertBefore("#table_main");
$(".dt-search input").removeClass("form-control-sm");

$("button[name=addRow]").click(() => {
    // var ctr = $('#table_form tr:eq(5) td').eq(0).text();
    $("button[name=removeRow]").prop("disabled", false);
    var ctr = $("#table_form tr").length;
    var row = "<tr>";
    row += `<td>${ctr}</td>`;
    row +=
        "<td contenteditable data-col='item' data-required='1' class='text-start'></td>";
    row += "<td contenteditable data-int='1' data-col='qty_per_unit'></td>";
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
    row += "<td contenteditable data-int='1' data-col='unit_per_batch'></td>";
    row += "<td contenteditable data-int='1' data-col='unitcost'></td>";
    row += "<td data-int='1' data-col='total_qty'>0</td>";
    row += "<td data-int='1' data-col='amount_per_unit'>0</td>";
    row += "<td data-int='1' data-col='total_amount'>0</td>";
    row += "<td contenteditable data-col='remarks' class='text-start'></td>";
    row += "</tr>";

    $("#table_form").append(row);
});

$("button[name=removeRow]").click(() => {
    var ctr = $("#table_form tr").length - 1;

    $("#table_form tr").eq(ctr).remove();

    if (ctr <= 2) {
        $("button[name=removeRow]").prop("disabled", true);
    }
});

// --

$("button[name=add]").click(() => {
    //Reset Warnings
    $("span[name=warning_item]").removeClass("d-block").addClass("d-none");
    $("span[name=warning_numbers]").removeClass("d-block").addClass("d-none");

    var table = $("#table_form");
    var is_ready = true;
    const purchase_num = $("input[name=purchase_req_num]").val();
    var data_item = new Array();
    var data_qty_per_unit = new Array();
    var data_unit_per_batch = new Array();
    var data_uom = new Array();
    var data_unitcost = new Array();
    var data_total_qty = new Array();
    var data_amount_per_unit = new Array();
    var data_total_amount = new Array();
    var data_remarks = new Array();
    const phase = $("input[name=phase]").val();
    const block = $("input[name=block]").val();
    const lot = $("input[name=lot]").val();
    const status = $("select[name=istatus]").val();

    if (!purchase_num) {
        $("input[name=purchase_req_num]").addClass("border border-danger");
        $("span[name=purchase_req_warning]")
            .removeClass("d-none")
            .addClass("d-block");
        is_ready = false;
    } else {
        $("input[name=purchase_req_num]").removeClass("border border-danger");
        $("span[name=purchase_req_warning]")
            .addClass("d-none")
            .removeClass("d-block");
    }

    //Consolidate Table Data
    table.find("tr").each(function (index, row) {
        if (index) {
            var rowData = {};
            $(this)
                .find("td")
                .each(function (index, cell) {
                    switch ($(cell).data("col")) {
                        case "item":
                            data_item.push($(cell).text());
                            break;
                        case "qty_per_unit":
                            data_qty_per_unit.push($(cell).text());
                            break;
                        case "unit_per_batch":
                            data_unit_per_batch.push($(cell).text());
                            break;
                        case "unitcost":
                            data_unitcost.push($(cell).text());
                            break;
                        case "total_qty":
                            data_total_qty.push($(cell).text());
                            break;
                        case "amount_per_unit":
                            data_amount_per_unit.push($(cell).text());
                            break;
                        case "total_amount":
                            data_total_amount.push($(cell).text());
                            break;
                        case "remarks":
                            data_remarks.push($(cell).text());
                            break;
                        default:
                            break;
                    }

                    if ($(cell).data("dropdown")) {
                        switch ($(cell).data("col")) {
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
    // console.log(purchase_num);
    // console.log(data_item);
    // console.log(data_qty_per_unit);
    // console.log(data_uom);
    // console.log(data_unit_per_batch);
    // console.log(data_unitcost);
    // console.log(data_total_qty);
    // console.log(data_amount_per_unit);
    // console.log(data_total_amount);
    // console.log(data_remarks);
    // console.log(phase);
    // console.log(block);
    // console.log(lot);
    // console.log(status);

    if (is_ready) {
        var json_item = JSON.stringify(data_item);
        var json_qty_per_unit = JSON.stringify(data_qty_per_unit);
        var json_uom = JSON.stringify(data_uom);
        var json_unit_per_batch = JSON.stringify(data_unit_per_batch);
        var json_unitcost = JSON.stringify(data_unitcost);
        var json_total_qty = JSON.stringify(data_total_qty);
        var json_amount_per_unit = JSON.stringify(data_amount_per_unit);
        var json_total_amount = JSON.stringify(data_total_amount);
        var json_remarks = JSON.stringify(data_remarks);

        $.post(
            "./includes/insert.php",
            {
                requestType: "Add_Purchase_Request",
                data_purchase_num: purchase_num,
                data_item: json_item,
                data_qty_per_unit: json_qty_per_unit,
                data_uom: json_uom,
                data_unit_per_batch: json_unit_per_batch,
                data_unitcost: json_unitcost,
                data_total_qty: json_total_qty,
                data_amount_per_unit: json_amount_per_unit,
                data_total_amount: json_total_amount,
                data_remarks: json_remarks,
                data_phase: phase,
                data_block: block,
                data_lot: lot,
                data_status: status,
            },
            function (data, status) {
                var table = $("#table_main").DataTable();
                console.log(data);
                if (data.includes("Success")) {
                    $("div[name=toast_success_msg]").text(
                        "Stocks are added successfully!"
                    );
                    $("#modalPurchaseReq").modal("hide");
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

    $("#table_details td").removeAttr("contenteditable");
    $("input[name=pr_num]").prop("disabled", true);
    $("input[name=details_phase]").prop("disabled", true);
    $("input[name=details_block]").prop("disabled", true);
    $("input[name=details_lot]").prop("disabled", true);
    $("select[name=details_status]").prop("disabled", true);

    var table = $("#table_main").DataTable();

    _rowdata = table.row(this).data();
    _selected_item = _rowdata.item;
    _selected_item_id = _rowdata.id;
    console.log(_rowdata);

    $("div[name=toast_delete_msg]").html(""); //Reset
    $("div[name=toast_delete_msg]").append(
        `Are you sure to delete <b>${_selected_item}?</b>`
    );

    $("input[name=pr_num]").val(_rowdata.pr_number);
    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty_per_unit]").text(_rowdata.qty_per_unit);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=unit_per_batch]").text(
        _rowdata.unit_per_batch
    );
    $("#table_details td[data-col=unitcost]").text(_rowdata.unitcost);
    $("#table_details td[data-col=total_qty]").text(_rowdata.total_qty);
    $("#table_details td[data-col=amount_per_unit]").text(
        _rowdata.amount_per_unit
    );
    $("#table_details td[data-col=total_amount]").text(_rowdata.total_amount);
    $("#table_details td[data-col=remarks]").text(_rowdata.remarks);
    $("input[name=details_phase]").val(_rowdata.phase);
    $("input[name=details_block]").val(_rowdata.block);
    $("input[name=details_lot]").val(_rowdata.lot);
    $("select[name=details_status]").val(_rowdata.status);

    $("#modalViewDetails").modal("show");
});

// Delete Selected Item
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
                requestType: "Purchase_Request",
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

// Modify Selected Item
$("button[name=modify]").click(() => {
    $("button[name=cancel]").hide();
    $("button[name=delete]").hide();
    $("button[name=modify]").hide();
    $("button[name=discard]").show();
    $("button[name=saveChanges]").show();

    var uom_dropdown = `<select class="form-select border-0">
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

    $("#table_details td[data-col=uom]").text("").append(uom_dropdown);
    $("#table_details td[data-col=uom] select").val(_rowdata.uom);

    $("input[name=pr_num]").prop("disabled", false);
    $("#table_details td[data-col=item]").prop("contenteditable", true);
    $("#table_details td[data-col=qty_per_unit]").prop("contenteditable", true);
    $("#table_details td[data-col=unit_per_batch]").prop(
        "contenteditable",
        true
    );
    $("#table_details td[data-col=unitcost]").prop("contenteditable", true);
    $("#table_details td[data-col=remarks]").prop("contenteditable", true);
    $("input[name=details_phase]").prop("disabled", false);
    $("input[name=details_block]").prop("disabled", false);
    $("input[name=details_lot]").prop("disabled", false);
    $("select[name=details_status]").prop("disabled", false);
});

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("#table_details td[data-col=uom] select").remove();
    $("#table_details td[data-col=status] select").remove();

    $("input[name=pr_num]").prop("disabled", true);
    $("#table_details td[data-col=item]").removeAttr("contenteditable");
    $("#table_details td[data-col=qty_per_unit]").removeAttr("contenteditable");
    $("#table_details td[data-col=unit_per_batch]").removeAttr(
        "contenteditable"
    );
    $("#table_details td[data-col=unitcost]").removeAttr("contenteditable");
    $("#table_details td[data-col=remarks]").removeAttr("contenteditable");
    $("input[name=details_phase]").prop("disabled", true);
    $("input[name=details_block]").prop("disabled", true);
    $("input[name=details_lot]").prop("disabled", true);
    $("select[name=details_status]").prop("disabled", true);

    $("input[name=pr_num]").val(_rowdata.pr_number);
    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty_per_unit]").text(_rowdata.qty_per_unit);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=unit_per_batch]").text(
        _rowdata.unit_per_batch
    );
    $("#table_details td[data-col=unitcost]").text(_rowdata.unitcost);
    $("#table_details td[data-col=total_qty]").text(_rowdata.total_qty);
    $("#table_details td[data-col=amount_per_unit]").text(
        _rowdata.amount_per_unit
    );
    $("#table_details td[data-col=total_amount]").text(_rowdata.total_amount);
    $("#table_details td[data-col=remarks]").text(_rowdata.remarks);
    $("input[name=details_phase]").val(_rowdata.phase);
    $("input[name=details_block]").val(_rowdata.block);
    $("input[name=details_lot]").val(_rowdata.lot);
    $("select[name=details_status] option:selected").text(_rowdata.status);
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
        `<b>${_selected_item}</b> updated successfully!`
    );

    var table = $("#table_main").DataTable();

    $.post(
        "./includes/update.php",
        {
            requestType: "Purchase_Request",
            data_id: _selected_item_id,
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
