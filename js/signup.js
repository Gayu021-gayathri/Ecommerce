
$(document).ready(function(){
  $('#Loginform').submit(function(e){
    e.preventDefault();
    var userEmail = document.getElementById('userEmail').value.trim();
    var userPassworrd = document.getElementById('userPassworrd').value.trim();
    var formvalidate = true;
    if (!isValidEmail(userEmail)) {
      console.log("one")
      $("#userEmail").next(".text-danger").removeClass("d-none");
      formvalidate = false;
    }else{
      console.log("else")
      $("#userEmail").next(".text-danger").addClass("d-none");
    }
    if (userPassworrd == '') {
      console.log("one")
      $("#userPassworrd").next(".text-danger").removeClass("d-none");
      formvalidate = false;
    }else{
      console.log("else")
      $("#userPassworrd").next(".text-danger").addClass("d-none");
    }
    if(!formvalidate){
      return;
    }
    $.ajax({
      type: 'POST',
      url: '../components/user.cfc?method=loginUser', 
      data: {
        email: userEmail,
        password: userPassworrd
      },
      dataType: 'json', 
      success: function(response){
        console.log(response)
        if(response.SUCCESS){
          window.location.href = "../views/product.cfm";
        }
        else{
          $("#alertbox").html(response.MESSAGE);
          $("#alertbox").removeClass("d-none");
        }
      },
      error: function(xhr, status, error){
          console.error(error);
      }
  });
  });


  $('#signupForm').submit(function(e){
    e.preventDefault();
    var firstName = document.getElementById('firstname').value.trim();
    var lastName = document.getElementById('lastname').value.trim();
    var email = document.getElementById('email').value.trim();
    var password = document.getElementById('password').value.trim();
      var formData = $(this).serialize();
      var formvalidate = true;
        if (firstName == '') {
          console.log("one")
          $("#firstname").next(".text-danger").removeClass("d-none");
          formvalidate = false;
        }else{
          console.log("else")
          $("#firstname").next(".text-danger").addClass("d-none");
        }
        if(lastName == ''){
          $("#lastname").next(".text-danger").removeClass("d-none");
          formvalidate = false;
        }else{
          $("#lastname").next(".text-danger").addClass("d-none");
        }
         if(!isValidEmail(email)){
          $("#email").next(".text-danger").removeClass("d-none");
          formvalidate = false;
         }else{
          $("#email").next(".text-danger").addClass("d-none");
        }
       if(!isValidpassword(password)){
          $("#password").next(".text-danger").removeClass("d-none");
          formvalidate = false;
       }else{
        $("#password").next(".text-danger").addClass("d-none");
      }
      if(!formvalidate){
        return;
      }
      $.ajax({
          type: 'POST',
          url: '../components/user.cfc?method=insertUser',
          data: {
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password
          },
          dataType: 'json', 
          success: function(response){
            console.log(response)
            if(response.SUCCESS){
              window.location.href = "../views/product.cfm";
            }
            else{
              $("#alertbox").html(response.MESSAGE);
              $("#alertbox").removeClass("d-none");
            }
          },
          error: function(xhr, status, error){
              console.error(error);
          }
      });
  });
});



function isValidEmail(email) {
  console.log(email,"email")
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}



function isValidpassword(password) {
  var passwordregex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  return passwordregex.test(password);
}

