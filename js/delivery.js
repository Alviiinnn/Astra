//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
const toast_delete_id = document.getElementById("toastDelete");
const toast_delete = bootstrap.Toast.getOrCreateInstance(toast_delete_id);
var _selected_item;
var _selected_item_id;
var _rowdata;
var _datalist_items;
var _datalist_changed = false;
var _datalist_changed_item;

$(document).ready(function () {
    $("#table_main").DataTable({
        ajax: {
            url: "./includes/get_delivery.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "pr_number" },
            { data: "item" },
            { data: "qty" },
            { data: "uom" },
            { data: "date_of_delivery" },
            { data: "dr_number" },
            { data: "supplier" },
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
    }); //-- end of datatable

    $.get("./includes/get_purchase_request.php").done(function (data) {
        $("#table_form td[data-col=qty]").text(data[0].total_qty);
        $("#table_form td[data-col=uom] select").val(data[0].uom);
        for (var i of data) {
            if (i.status == "Approved") {
                $("select[name=itemlist]").append(
                    `<option value="${i.item}" data-pr="${i.pr_number}" data-qty="${i.total_qty}" data-uom="${i.uom}">${i.item} (${i.pr_number})</option>`
                );
                _datalist_items += `<option value="${i.item}" data-pr="${i.pr_number}" data-qty="${i.total_qty}" data-uom="${i.uom}">${i.item} (${i.pr_number})</option>`;
            }
        }
    });
});

$("li[name=logout]").click(() => {
    $.post("includes/logout.php");
});

// ON EVENTS
$(document)
    .on("keydown", "td[data-col=qty]", function (event) {
        var key = String.fromCharCode(event.which);
        var regex = /^\d+$/; // Regex for only digits

        // Allow backspace and delete keys
        if (
            event.keyCode === 8 ||
            event.keyCode === 46 ||
            event.keyCode === 190 ||    //Dot - keyboard
            event.keyCode === 110 ||    //Dot - num keys
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
    })
    .on("change", "select[name=itemlist], select[name=details_itemlist]", function () {
        var qty = $(this).find('option:selected').data('qty');
        var uom = $(this).find('option:selected').data('uom');
        $("#table_form td[data-col=qty]").text(qty);
        $("#table_form td[data-col=uom] select").val(uom);
        $("#table_details td[data-col=qty]").text(qty);
        $("#table_details td[data-col=uom] select").val(uom);

        _datalist_changed_item = $(this).val();
        _datalist_changed = true;
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
$("#addRequest").insertBefore("#table_main");
$("#statusFilter").insertBefore("#table_main");
$(".dt-search input").removeClass("form-control-sm");

$("button[name=addRow]").click(() => {
    // var ctr = $('#table_form tr:eq(5) td').eq(0).text();
    $("button[name=removeRow]").prop("disabled", false);
    var ctr = $("#table_form tr").length;
    var row = "<tr>";
    row += `<td>${ctr}</td>`;
    row += "<td contenteditable data-col='item' data-required='1' data-dropdown='1'>";
    row += `   <input class='form-control border-0' list='datalist_item${ctr}' placeholder='Type to search item...'>`;
    row += `   <datalist id='datalist_item${ctr}'></datalist>`;
    row += "</td>";
    row +=
        "<td contenteditable data-int='1' data-col='qty' data-required='1'></td>";
    row += "<td data-dropdown='1' data-col='uom'>";
    row += "    <select class='form-select border-0'>";
    row += "        <option>pcs</option>";
    row += "        <option>bags</option>";
    row += "        <option>kl</option>";
    row += "        <option>box</option>";
    row += "        <option>gal</option>";
    row += "        <option>tin</option>";
    row += "        <option>ltrs</option>";
    row += "    </select>";
    row += "</td>";
    row += "<td data-col='delivered_date' data-required='1'>";
    row +=
        " <input class='form-control border-0' type='date' name='delivered_date'/>";
    row += "</td>";
    row += "<td contenteditable data-required='1' data-col='dr_number'></td>";
    row += "<td contenteditable data-col='supplier'></td>";
    row += "<td data-col='status' data-dropdown='1'>";
    row += "<select class='form-select border-0'>";
    row += "    <option>Pending</option>";
    row += "    <option>In Transit</option>";
    row += "    <option>Received</option>";
    row += "    <option>Returned</option>";
    row += "    <option>Cancelled</option>";
    row += "</select>";
    row += "</td>";
    row += "</tr>";

    $("#table_form").append(row);
    $(`#datalist_item${ctr}`).append(_datalist_items);
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
    $("div[name=warning_general]").removeClass("d-block").addClass("d-none");
    $("span[name=warning_item]").removeClass("d-block").addClass("d-none");
    $("span[name=warning_numbers]").removeClass("d-block").addClass("d-none");

    var table = $("#table_form");
    var is_ready = true;
    var data_item = new Array();
    var data_pr = new Array();
    var data_qty = new Array();
    var data_uom = new Array();
    var data_date_of_delivery = new Array();
    var data_DR_number = new Array();
    var data_supplier = new Array();
    var data_status = new Array();

    // if (!purchase_num) {
    //     $("input[name=purchase_req_num]").addClass("border border-danger");
    //     $("span[name=purchase_req_warning]")
    //         .removeClass("d-none")
    //         .addClass("d-block");
    //     is_ready = false;
    // } else {
    //     $("input[name=purchase_req_num]").removeClass("border border-danger");
    //     $("span[name=purchase_req_warning]")
    //         .addClass("d-none")
    //         .removeClass("d-block");
    // }

    //Consolidate Table Data
    table.find("tr").each(function (index, row) {
        if (index) {
            var rowData = {};
            $(this)
                .find("td")
                .each(function (index, cell) {
                    switch ($(cell).data("col")) {
                        // case "item":
                        //     data_item.push($(cell).find("input").val());
                        //     break;
                        case "delivered_date":
                            data_date_of_delivery.push(
                                $(cell).find("input").val()
                            );
                            break;
                        case "qty":
                            data_qty.push($(cell).text());
                            break;
                        case "dr_number":
                            data_DR_number.push($(cell).text());
                            break;
                        case "supplier":
                            data_supplier.push($(cell).text());
                            break;
                        default:
                            break;
                    }

                    if ($(cell).data("dropdown")) {
                        switch ($(cell).data("col")) {
                            case "item":
                                data_item.push($(cell).find("select").val());
                                data_pr.push($(cell).find("select option:selected").data('pr'));
                                break;
                            case "uom":
                                data_uom.push($(cell).find("select").val());
                                break;
                            case "status":
                                data_status.push($(cell).find("select").val());
                                break;
                            default:
                                break;
                        }
                    }
                    //VALIDATIONS
                    $(cell).removeClass("border border-danger");

                    if ($(cell).data("required") && $(cell).text() == "") {
                        $(cell).addClass("border border-danger");
                        $("div[name=warning_general]")
                            .removeClass("d-none")
                            .addClass("d-block");
                        is_ready = false;
                    }

                    if (
                        $(cell).data("required") &&
                        $(cell).find("input").val() == ""
                    ) {
                        $(cell).addClass("border border-danger");
                        $("div[name=warning_general]")
                            .removeClass("d-none")
                            .addClass("d-block");
                        is_ready = false;
                        // console.log("Hello "+$(cell).find("input").val());
                    }
                });
        }
    });

    // FOR TESTING
    // console.log(is_ready);
    // console.log(data_item);
    // console.log(data_pr);
    // console.log(data_qty);
    // console.log(data_uom);
    // console.log(data_date_of_delivery);
    // console.log(data_DR_number);
    // console.log(data_supplier);
    // console.log(data_status);

    if (is_ready) {
        var json_item = JSON.stringify(data_item);
        var json_pr = JSON.stringify(data_pr);
        var json_qty = JSON.stringify(data_qty);
        var json_uom = JSON.stringify(data_uom);
        var json_date_of_delivery = JSON.stringify(data_date_of_delivery);
        var json_DR_number = JSON.stringify(data_DR_number);
        var json_supplier = JSON.stringify(data_supplier);
        var json_status = JSON.stringify(data_status);

        $.post(
            "./includes/insert.php",
            {
                requestType: "Add_Delivery",
                data_item: json_item,
                data_pr: json_pr,
                data_qty: json_qty,
                data_uom: json_uom,
                data_date_of_delivery: json_date_of_delivery,
                data_DR_number: json_DR_number,
                data_supplier: json_supplier,
                data_status: json_status
            },
            function (data, status) {
                var table = $("#table_main").DataTable();
                console.log(data);
                if (data.includes("Success")) {
                    $("div[name=toast_success_msg]").text(
                        "Delivered Items are added successfully!"
                    );
                    $("#modalAddDelivery").modal("hide");
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
    _datalist_changed = false;
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("#table_details td").removeAttr("contenteditable");

    var table = $("#table_main").DataTable();

    _rowdata = table.row(this).data();
    _selected_item = _rowdata.item;
    _selected_item_id = _rowdata.id;
    console.log(_rowdata);

    $("div[name=toast_delete_msg]").html(""); //Reset
    $("div[name=toast_delete_msg]").append(
        `Are you sure to delete <b>${_selected_item}?</b>`
    );

    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty]").text(_rowdata.qty);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=delivered_date]").text(
        _rowdata.date_of_delivery
    );
    $("#table_details td[data-col=dr_number]").text(_rowdata.dr_number);
    $("#table_details td[data-col=supplier]").text(_rowdata.supplier);
    $("#table_details td[data-col=status]").text(_rowdata.status);

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
                requestType: "Delivery",
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

    var item_datalist = `<select name="details_itemlist" class="form-select border-0"></select>`;
    var uom_dropdown = `<select class="form-select border-0">
        <option>pcs</option>
        <option>bags</option>
        <option>kl</option>
        <option>box</option>
        <option>gal</option>
        <option>tin</option>
        <option>ltrs</option>
    </select>`;

    var delivered_date = `<input class="form-control border-0" type="date" name="delivered_date" />`;

    var status_dropdown = `<select class="form-select border-0">
        <option>Pending</option>
        <option>In Transit</option>
        <option>Received</option>
        <option>Returned</option>
        <option>Cancelled</option>
    </select>`;

    $("#table_details td[data-col=item]").text("").append(item_datalist);
    $("#table_details td[data-col=uom]").text("").append(uom_dropdown);
    $("#table_details td[data-col=delivered_date]")
        .text("")
        .append(delivered_date);
    $("#table_details td[data-col=status]").text("").append(status_dropdown);

    $("#table_details td[data-col=uom] select").val(_rowdata.uom);
    $("#table_details td[data-col=delivered_date] input").val(
        _rowdata.date_of_delivery
    );
    $("#table_details td[data-col=status] select").val(_rowdata.status);
    $("select[name=details_itemlist]").append(_datalist_items);
    $("select[name=details_itemlist]").val(_rowdata.item);

    $("#table_details td[data-col=qty]").prop("contenteditable", true);
    $("#table_details td[data-col=dr_number]").prop("contenteditable", true);
    $("#table_details td[data-col=supplier]").prop("contenteditable", true);
});

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("#table_details td[data-col=item] input").remove();
    $("#table_details td[data-col=item] datalist").remove();
    $("#table_details td[data-col=uom] select").remove();
    $("#table_details td[data-col=status] select").remove();

    $("#table_details td[data-col=item]").removeAttr("contenteditable");
    $("#table_details td[data-col=qty]").removeAttr("contenteditable");

    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty]").text(_rowdata.qty);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("#table_details td[data-col=delivered_date]").text(
        _rowdata.date_of_delivery
    );
    $("#table_details td[data-col=dr_number]").text(_rowdata.dr_number);
    $("#table_details td[data-col=supplier]").text(_rowdata.supplier);
    $("#table_details td[data-col=status]").text(_rowdata.status);
});

// Save Modified Changes on Selected Item
$("button[name=saveChanges]").click(() => {
    var input_item = $("#table_details td[data-col=item] select").val();
    var input_pr = $("#table_details td[data-col=item] select option:selected").data('pr');
    var input_qty = $("#table_details td[data-col=qty]").text();
    var input_uom = $("#table_details td[data-col=uom] select").val();
    var input_date_delivered = $(
        "#table_details td[data-col=delivered_date] input"
    ).val();
    var input_dr_number = $("#table_details td[data-col=dr_number]").text();
    var input_supplier = $("#table_details td[data-col=supplier]").text();
    var input_status = $("#table_details td[data-col=status] select").val();

    // console.log("item: " + input_item);
    // console.log("pr: " + input_pr);
    // console.log("qty: " + input_qty);
    // console.log("uom: " + input_uom);
    // console.log("date_delivered : " + input_date_delivered);
    // console.log("dr_number : " + input_dr_number);
    // console.log("supplier : " + input_supplier);
    // console.log("status: " + input_status);

    $("#modalViewDetails").modal("hide");
    $("div[name=toast_success_msg]").html(
        `<b>${_selected_item}</b> updated successfully!`
    );

    var table = $("#table_main").DataTable();

    $.post(
        "./includes/update.php",
        {
            requestType: "Delivery",
            data_id: _selected_item_id,
            data_item: input_item,
            data_pr: input_pr,
            data_qty: input_qty,
            data_uom: input_uom,
            data_date_delivered: input_date_delivered,
            data_dr_number: input_dr_number,
            data_supplier: input_supplier,
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
