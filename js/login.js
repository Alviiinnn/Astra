
$('#login').on('submit', function(e){
    e.preventDefault();

    $.post('./includes/login.php', $('#login').serialize(), 
    function(data, status){
        console.log(data);
        console.log(status);

        if(data.includes('Username_Not_Exists')){
            alert("Username does not exists!");
        }

        if(data.includes('Incorrect_Password')){
            alert("Username or Password is incorrect!");
        }

        if(data.includes('Password_Accepted')){
            alert("Password Accepted!");
            window.location.href = "dashboard.php";
        }
        
    });
    
});