var blue = "rgba(43, 80, 170, 1)";
var green = "rgba(12, 135, 80, 1)";
var yellow = "rgba(255, 202, 33, 1)";
var red = "rgba(239, 49, 55, 1)";

var xValues = ["Maximum", "Safe", "Minimum", "Critical"];
// var yValues = [35, 90, 55, 25];
var yValues = [];
var barColors = [blue, green, yellow, red];

$(document).ready(() => {
    var user = $("input[name=username]").val();

	$.post("./includes/select.php", {
        requestType: "Access_Control",
        username: user
    }, function(data){
        console.log(data);
        var data_purchase = data[0].purchase;
        var data_delivery = data[0].delivery;
        var data_inventory = data[0].inventory;
        var data_withdrawal = data[0].withdrawal;
        var data_userAccess = data[0].user_access;
        var data_management = data[0].user_management;

        fx_none(data_purchase, 'pr');
        fx_none(data_delivery, 'delivery');
        fx_none(data_inventory, 'inventory');
        fx_none(data_withdrawal, 'withdrawal');
        fx_none(data_userAccess, 'accessControl');
        fx_none(data_management, 'management');

        function fx_none(data, page){
            if(!data.includes('None')){
                $(`#link_${page}`).removeClass('d-none');
                if(page == ('pr' || 'withdrawal')){
                    $('#link_requests').removeClass('d-none');
                }
                if(page == ('accessControl' || 'management')){
                    $('#link_users').removeClass('d-none');
                }
            }
        }

        // if(data_purchase == "View"){

        // }

        // console.log(!(data[0].inventory).includes('None'));
        // if(!(data[0].inventory).includes('None')){
        //     $('#link_inventory').removeClass('d-none');
        // }
	});
});


$("li[name=logout]").click(() => {
    $.post("includes/logout.php");
});

$.get("./includes/get_inventory.php").done(function (data) {
    var crit_count = 0;
    var min_count = 0;
    var safe_count = 0;
    var max_count = 0;

    $.each(data, function (index, item) {
        if (item.stock_level == "Maximum") {
            max_count++;
        }
        if (item.stock_level == "Safe") {
            safe_count++;
        }
        if (item.stock_level == "Minimum") {
            min_count++;
        }
        if (item.stock_level == "Critical") {
            crit_count++;
        }
    });
    // console.log(typeof(yValues));
    // console.log(max_count);
    // console.log(safe_count);
    // console.log(min_count);
    // console.log(crit_count);
    // yValues[0] = max_count;
    // yValues[1] = safe_count;
    // yValues[2] = min_count;
    // yValues[3] = crit_count;

    $("#max_count").text(max_count);
    $("#safe_count").text(safe_count);
    $("#min_count").text(min_count);
    $("#crit_count").text(crit_count);

    yValues = [max_count, safe_count, min_count, crit_count];

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [
                {
                    backgroundColor: barColors,
                    data: yValues,
                },
            ],
        },
        options: {
            legend: {
                display: false,
            },
            title: {
                display: true,
                text: "Level of Stocks",
            },
        },
    });
});

// Cards Click Events
$("#card_max").click(() => {
    window.location.href =
        "inventory.php?filter=" + encodeURIComponent("Maximum");
});

$("#card_safe").click(() => {
    window.location.href = "inventory.php?filter=" + encodeURIComponent("Safe");
});

$("#card_min").click(() => {
    window.location.href =
        "inventory.php?filter=" + encodeURIComponent("Minimum");
});

$("#card_crit").click(() => {
    window.location.href =
        "inventory.php?filter=" + encodeURIComponent("Critical");
});
