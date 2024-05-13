$(document).ready(function(){

	$('#checkoutForm').submit(function(e){
	    e.preventDefault();
	    var shipping = document.getElementById('shippingAddress').value.trim();
	    var billing = document.getElementById('billingAddress').value.trim();	    
	    var price = document.getElementById('totalPrice').value.trim();
	    var products = JSON.parse(document.getElementById('productIds').value);
	    var jsonData = JSON.stringify(products);
	    var numericPrice = parseFloat(price.replace('$', ''));

      	var formData = $(this).serialize();
      	var formvalidate = true;

        if (shipping == '') {
          $("#shippingAddress").next(".text-danger").removeClass("d-none");
          formvalidate = false;
        }else{
          $("#shippingAddress").next(".text-danger").addClass("d-none");
        }
        if(billing == ''){
          $("#billingAddress").next(".text-danger").removeClass("d-none");
          formvalidate = false;
        }else{
          $("#billingAddress").next(".text-danger").addClass("d-none");
        }
         
      	if(!formvalidate){
       	 return;
      	}
      	$.ajax({
	      type: 'POST',
	      url: '../components/checkout.cfc?method=proceedToBuy',
	      data: {
	        billing: billing,
	        shipping: shipping,
	        totalamount:numericPrice,
	        productIds: jsonData
	      },
	      dataType: 'json', 
	      success: function(response){
	        if(response){
	          window.location.href = "../views/success.cfm";
	        }
	        else{
	          alert("some error happened")
	        }
	      },
	      error: function(xhr, status, error){
	          console.error(error);
	      }
      	});
  });
});