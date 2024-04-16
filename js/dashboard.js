var blue = "rgba(43, 80, 170, 1)";
var green = "rgba(12, 135, 80, 1)";
var yellow = "rgba(255, 202, 33, 1)";
var red = "rgba(239, 49, 55, 1)";

var xValues = ["Maximum", "Safe", "Minimum", "Critical"];
// var yValues = [35, 90, 55, 25];
var yValues = [];
var barColors = [blue, green, yellow, red];

$(document).ready(function(){
    var user = $("input[name=username]").val();
    
    //USER ACCESS
    $.post("./includes/select.php", {
        requestType: "Access_Control",
        username: user
    }).done(function(data){
        var data_purchase = data[0].purchase;
        var data_withdrawal = data[0].withdrawal;
        var data_delivery = data[0].delivery;
        var data_inventory = data[0].inventory;
        var data_userAccess = data[0].user_access;
        var data_management = data[0].user_management;

        //For Testing
        // console.log("purchase:"+data_purchase);
        // console.log("withdrawal: "+data_withdrawal);
        // console.log("delivery: "+data_delivery);
        // console.log("inventory: "+data_inventory);
        // console.log("access: "+data_userAccess);
        // console.log("management: "+data_management);

        if(data_purchase != "None" || data_withdrawal != "None"){
            $('#link_requests').removeClass('d-none');
        }else{
            if(data_purchase != "None"){
                $('#link_pr').removeClass('d-none');
            }
            if(data_withdrawal != "None"){
                $('#link_withdrawal').removeClass('d-none');
            }
        }

        if(data_delivery != "None"){
            $('#link_delivery').removeClass('d-none');
        }
        if(data_inventory != "None"){
            $('#link_inventory').removeClass('d-none');
        }
        
        if(data_management != "None" || data_userAccess != "None"){
            $('#link_users').removeClass('d-none');
        }else{
            if(data_management != "None"){
                $('#link_management').removeClass('d-none');
            }
            if(data_userAccess != "None"){
                $('#link_accessControl').removeClass('d-none');
            }
        }
	}); //end of User Access

}); //end of ready document


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
