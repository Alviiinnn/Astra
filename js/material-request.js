//INITIALIZE

const toast_success_id = document.getElementById("toastSuccess");
const toast_success = bootstrap.Toast.getOrCreateInstance(toast_success_id);
const toast_delete_id = document.getElementById("toastDelete");
const toast_delete = bootstrap.Toast.getOrCreateInstance(toast_delete_id);
var _selected_item;
var _selected_item_id;
var _rowdata;

var _arr_items = new Array();
var _arr_items_uom = new Array();
var _arr_items_id = new Array();
let _str_items;
var _data = "";

$(document).ready(function () {
    $("#table_main").DataTable({
        ajax: {
            url: "./includes/get_material_request.php", // URL of your server-side script
            dataSrc: "", // No additional data source parsing needed (since response is already an array)
        },
        columns: [
            { data: "ctr" },
            { data: "request_slip_num" },
            { data: "item" },
            { data: "qty" },
            { data: "uom" },
            { data: "remarks" },
            { data: "phase" },
            { data: "block" },
            { data: "lot" },
            { data: "requested_by" },
            { data: "date_requested" },
            { data: "approved_by" },
            { data: "date_approved" },
            { data: "status" },
        ],
        columnDefs: [
            // { targets: [13], searchable: true },  //Column 13 = Status
            // { targets: "_all", searchable: false }
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
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
            }
        }

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

    $.get("./includes/get_inventory.php").done(function (data) {
        _data = data;
        for (var i of data) {
            _arr_items.push(i.item);
            _arr_items_uom.push(i.uom);
            _arr_items_id.push(i.id);
            _str_items +=
                "<option value='" +
                i.id +
                "' data-uom='" +
                i.uom +
                "'>" +
                i.item +
                "</option>";
        }
        $("select[name=item_list]").append(_str_items);
    });

    // console.log(_arr_items);
    // console.log(_arr_items[0]);

    // for(var i of _arr_items){
    //     console.log(i);
    // }

    // console.log(_str_items);
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
$("#addRequest").insertBefore("#table_main");
$("#statusFilter").insertBefore("#table_main");
$(".dt-search input").removeClass("form-control-sm");

/* Global var for counter */
let ctr = 1;
// const table = new DataTable("#table_main");

$("button[name=addRow]").click(() => {
    // var ctr = $('#table_form tr:eq(5) td').eq(0).text();

    $("button[name=removeRow]").prop("disabled", false);
    // console.log(_arr_items);
    // console.log(_arr_items_uom);
    var ctr = $("#table_form tr").length;
    var row = "<tr>";
    row += `<td>${ctr}</td>`;
    row += "<td data-dropdown='1' data-col='item' data-required='1'>";
    row += "  <select class='form-select border-0'>";
    row +=
        "    <option value='0' selected disabled>- Select an Item -</option>";
    row += _str_items;
    row += "  </select>";
    row += "</td>";
    row += "<td contenteditable data-int='1' data-col='qty'>0</td>";
    row += "<td data-col='uom'></td>";
    row += "</tr>";

    $("#table_form").append(row);
});

// ---

$("button[name=removeRow]").click(() => {
    var ctr = $("#table_form tr").length - 1;

    $("#table_form tr").eq(ctr).remove();

    if (ctr <= 2) {
        $("button[name=removeRow]").prop("disabled", true);
    }
});

// ---

$(document).on("change", "td[data-col=item] select", function () {
    var uom = $(this).find("option:selected").data("uom");
    $(this).parent().next().next().text(uom);
});

// ---

$("button[name=submit]").click(() => {
    //Reset Warnings
    $("span[name=warning_item]").removeClass("d-block").addClass("d-none");
    $("span[name=warning_numbers]").removeClass("d-block").addClass("d-none");

    var table = $("#table_form");
    var is_ready = true;
    var data_item = new Array();
    var data_item_id = new Array();
    var data_qty = new Array();
    var data_uom = new Array();
    const request_num = $("input[name=request_slip_num]").val();
    const remarks = $("input[name=remarks]").val();
    const phase = $("#phase").val();
    const block = $("#block").val();
    const lot = $("#lot").val();
    const requested_by = $("input[name=requested_by]").val();
    const approved_by = $("input[name=approved_by]").val();
    const date_requested = $("input[name=date_requested]").val();
    const date_approved = $("input[name=date_approved]").val();
    var intended_for = $("input[name=intended_for]:checked").val();

    if (!request_num) {
        $("input[name=request_slip_num]").addClass("border border-danger");
        $("span[name=request_slip_num_warning]")
            .removeClass("d-none")
            .addClass("d-block");
        is_ready = false;
    } else {
        $("input[name=request_slip_num]").removeClass("border border-danger");
        $("span[name=request_slip_num_warning]")
            .addClass("d-none")
            .removeClass("d-block");
    }

    // Consolidate Table Data
    table.find("tr").each(function (index, row) {
        if (index) {
            $(this)
                .find("td")
                .each(function (index, cell) {
                    switch ($(cell).data("col")) {
                        case "qty":
                            data_qty.push($(cell).text());
                            break;
                        case "uom":
                            data_uom.push($(cell).text());
                            break;
                        default:
                            break;
                    }

                    if ($(cell).data("dropdown")) {
                        switch ($(cell).data("col")) {
                            case "item":
                                data_item_id.push($(cell).find("select").val());
                                data_item.push(
                                    $(cell)
                                        .find("select option:selected")
                                        .text()
                                );
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
    // console.log(request_num);
    console.log(data_item_id);
    console.log(data_item);
    // console.log(data_qty);
    // console.log(data_uom);
    // console.log(remarks);
    // console.log(phase);
    // console.log(block);
    // console.log(lot);
    // console.log(requested_by);
    // console.log(date_requested);
    // console.log(approved_by);
    // console.log(date_approved);
    // console.log(intended_for);

    if (is_ready) {
        var json_item_id = JSON.stringify(data_item_id);
        var json_item = JSON.stringify(data_item);
        var json_qty = JSON.stringify(data_qty);
        var json_uom = JSON.stringify(data_uom);

        $.post(
            "./includes/insert.php",
            {
                requestType: "Add_Material_Request",
                data_request_num: request_num,
                data_item_id: json_item_id,
                data_item: json_item,
                data_qty: json_qty,
                data_uom: json_uom,
                data_remarks: remarks,
                data_phase: phase,
                data_block: block,
                data_lot: lot,
                data_requested_by: requested_by,
                data_date_requested: date_requested,
                data_approved_by: approved_by,
                data_date_approved: date_approved,
                data_intended_for: intended_for,
            },
            function (data, status) {
                var table = $("#table_main").DataTable();
                console.log(data);
                if (data.includes("Success")) {
                    $("#modalAddRequest").modal("hide");
                    $("div[name=toast_success_msg]").html(
                        "Material Request Added Successfully!"
                    );
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

    $("div[name=toast_delete_msg]").html(""); //Reset
    $("div[name=toast_delete_msg]").append(
        `Are you sure to delete <b>${_selected_item}?</b>`
    );

    // Disable Fields
    $("input[name=details_req_slip_num]").prop("disabled", true);
    $("#table_details td[data-col=item]").prop("contenteditable", false);
    $("#table_details td[data-col=qty]").prop("contenteditable", false);
    $("#table_details td[data-col=uom]").prop("contenteditable", false);
    $("input[name=details_remarks]").prop("disabled", true);
    $("input[name=details_phase]").prop("disabled", true);
    $("input[name=details_block]").prop("disabled", true);
    $("input[name=details_lot]").prop("disabled", true);
    $("input[name=details_requested_by]").prop("disabled", true);
    $("input[name=details_date_requested]").prop("disabled", true);
    $("input[name=details_approved_by]").prop("disabled", true);
    $("input[name=details_date_approved]").prop("disabled", true);
    $("input[name=details_intended_for]").prop("disabled", true);
    $("select[name=details_status]").prop("disabled", true);

    //Set Field Data
    $("input[name=details_req_slip_num]").val(_rowdata.request_slip_num);
    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty]").text(_rowdata.qty);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("input[name=details_remarks]").val(_rowdata.remarks);
    $("input[name=details_phase]").val(_rowdata.phase);
    $("input[name=details_block]").val(_rowdata.block);
    $("input[name=details_lot]").val(_rowdata.lot);
    $("input[name=details_requested_by]").val(_rowdata.requested_by);
    $("input[name=details_date_requested]").val(_rowdata.date_requested);
    $("input[name=details_approved_by]").val(_rowdata.approved_by);
    $("input[name=details_date_approved]").val(_rowdata.date_approved);
    $(`input[name=details_intended_for][value=${_rowdata.intended_for}]`).prop(
        "checked",
        true
    );
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
        console.log(_selected_item_id);
        $.post(
            "./includes/delete.php",
            {
                requestType: "Material_Request",
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

// Discard Changes on Selected Item
$("button[name=discard]").click(() => {
    $("button[name=cancel]").show();
    $("button[name=delete]").show();
    $("button[name=modify]").show();
    $("button[name=discard]").hide();
    $("button[name=saveChanges]").hide();

    $("#table_details td[data-col=item] select").remove();

    //Set Field Data
    $("input[name=details_req_slip_num]").val(_rowdata.request_slip_num);
    $("#table_details td[data-col=item]").text(_rowdata.item);
    $("#table_details td[data-col=qty]").text(_rowdata.qty);
    $("#table_details td[data-col=uom]").text(_rowdata.uom);
    $("input[name=details_remarks]").val(_rowdata.remarks);
    $("input[name=details_phase]").val(_rowdata.phase);
    $("input[name=details_block]").val(_rowdata.block);
    $("input[name=details_lot]").val(_rowdata.lot);
    $("input[name=details_requested_by]").val(_rowdata.requested_by);
    $("input[name=details_date_requested]").val(_rowdata.date_requested);
    $("input[name=details_approved_by]").val(_rowdata.approved_by);
    $("input[name=details_date_approved]").val(_rowdata.date_approved);
    $(`input[name=details_intended_for][value=${_rowdata.intended_for}]`).prop(
        "checked",
        true
    );
    $("select[name=details_status]").val(_rowdata.status);

    // Disable Fields
    $("input[name=details_req_slip_num]").prop("disabled", true);
    $("input[name=details_remarks]").prop("disabled", true);
    $("#table_details td[data-col=qty]").prop("contenteditable", false);
    $("input[name=details_phase]").prop("disabled", true);
    $("input[name=details_block]").prop("disabled", true);
    $("input[name=details_lot]").prop("disabled", true);
    $("input[name=details_requested_by]").prop("disabled", true);
    $("input[name=details_date_requested]").prop("disabled", true);
    $("input[name=details_approved_by]").prop("disabled", true);
    $("input[name=details_date_approved]").prop("disabled", true);
    $("input[name=details_intended_for]").prop("disabled", true);
    $("select[name=details_status]").prop("disabled", true);
});

// Modify Selected Item
$("button[name=modify]").click(() => {
    $("button[name=cancel]").hide();
    $("button[name=delete]").hide();
    $("button[name=modify]").hide();
    $("button[name=discard]").show();
    $("button[name=saveChanges]").show();

    var item_dropdown = `
        <select class="form-select border-0" data-required="1">
            <option value="0" selected disabled>- Select an Item -</option>
    </select>`;

    // Don't change the sequence of this block
    $("#table_details td[data-col=item]").text("").append(item_dropdown);
    $("#table_details td[data-col=item] select").append(_str_items);
    // $("#table_details td[data-col=item] select option[value="+_rowdata.item_id+"]").attr('selected', 'selected');    //alternative
    $("#table_details td[data-col=item] select").val(_rowdata.item_id);

    $("input[name=details_req_slip_num]").prop("disabled", false);
    $("input[name=details_remarks]").prop("disabled", false);
    $("#table_details td[data-col=qty]").prop("contenteditable", true);
    $("input[name=details_phase]").prop("disabled", false);
    $("input[name=details_block]").prop("disabled", false);
    $("input[name=details_lot]").prop("disabled", false);
    $("input[name=details_requested_by]").prop("disabled", false);
    $("input[name=details_date_requested]").prop("disabled", false);
    $("input[name=details_approved_by]").prop("disabled", false);
    $("input[name=details_date_approved]").prop("disabled", false);
    $("input[name=details_intended_for]").prop("disabled", false);
    $("select[name=details_status]").prop("disabled", false);
});

// Save Modified Changes on Selected Item
$("button[name=saveChanges]").click(() => {
    var input_req_slip_num = $("input[name=details_req_slip_num]").val();
    var input_item_id = $("#table_details td[data-col=item] select").val();
    var input_item = $(
        "#table_details td[data-col=item] select option:selected"
    ).text();
    var input_qty = $("#table_details td[data-col=qty]").text();
    var input_uom = $("#table_details td[data-col=uom]").text();
    var input_remarks = $("input[name=details_remarks]").val();
    var input_phase = $("input[name=details_phase]").val();
    var input_block = $("input[name=details_block]").val();
    var input_lot = $("input[name=details_lot]").val();
    var input_requested_by = $("input[name=details_requested_by]").val();
    var input_date_requested = $("input[name=details_date_requested]").val();
    var input_approved_by = $("input[name=details_approved_by]").val();
    var input_date_approved = $("input[name=details_date_approved]").val();
    var input_intended_for = $(
        "input[name=details_intended_for]:checked"
    ).val();
    var input_status = $("select[name=details_status]").val();

    // console.log("row id: "+_selected_item_id);
    // console.log("mat_req_num: "+input_req_slip_num);
    // console.log("item_id: "+input_item_id);
    // console.log("item: "+input_item);
    // console.log("qty: "+input_qty);
    // console.log("uom: "+input_uom);
    // console.log("remarks: "+input_remarks);
    // console.log("phase: "+input_phase);
    // console.log("block: "+input_block);
    // console.log("lot: "+input_lot);
    // console.log("requested_by: "+input_requested_by);
    // console.log("date_requested: "+input_date_requested);
    // console.log("approved_by: "+input_approved_by);
    // console.log("date_approved: "+input_date_approved);
    // console.log("intended_for: "+input_intended_for);
    console.log("status: "+input_status);

    $("#modalViewDetails").modal("hide");
    $("div[name=toast_success_msg]").html(
        `<b>${_selected_item}</b> updated successfully!`
    );

    var table = $("#table_main").DataTable();

    $.post(
        "./includes/update.php",
        {
            requestType: "Material_Request",
            data_id: _selected_item_id,
            data_req_slip_num: input_req_slip_num,
            data_item_id: input_item_id,
            data_item: input_item,
            data_qty: input_qty,
            data_uom: input_uom,
            data_remarks: input_remarks,
            data_phase: input_phase,
            data_block: input_block,
            data_lot: input_lot,
            data_requested_by: input_requested_by,
            data_date_requested: input_date_requested,
            data_approved_by: input_approved_by,
            data_date_approved: input_date_approved,
            data_intended_for: input_intended_for,
            data_status: input_status
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
