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