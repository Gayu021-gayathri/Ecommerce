<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
  <cfoutput>
  <!-- Redirect to login page if user is not logged in -->
  <cfif !structKeyExists(session,"userid")>
    <cflocation url="login.cfm">
  </cfif>
<cfinclude template="navbar.cfm">
  <cfset objCartService = createObject("component", "component.cart")>
  <cfset getallproducts = objCartService.getUserCartProductDetails(session.userid)>
  <div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center">
       <h1 class="mb-4">Shopping Cart</h1>
        <div class="">
          <a href="checkout.cfm">
           <button class="btn btn-success" id="checkoutBtn">
              <i class="bi bi-cart3 bi-lg"></i> 
              Checkout
            </button>
          </a>

        </div>
    </div>
   
    <div class="row">
      <!-- Loop through cart items -->
      

       <cfif getallproducts.recordCount EQ 0>
        <div class="alert alert-info" role="alert">
          Your cart is empty. Please add some products.
        </div>
      <cfelse>
        <cfloop query="getallproducts">
          <div class="col-12" id="product_#product_id#">
            <div class="card mb-3">
              <div class="row g-0">
                <!-- Product image on the left -->
                <div class="col-md-4">
                  <!-- Assuming you have an 'image' column in your cart query -->
                  <img src="#thumbnail#" class="img-fluid rounded-start" alt="#title#">
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <!-- Product information on the right -->
                    <h5 class="card-title">#title#</h5>
                    <p class="card-text">Price: $#price#</p>
                    <p class="card-text">#description#</p>
                    <p class="card-text">Quantity: <span id="quantity_#cart_id#">#quantity#</span></p>
                  </div>
                  <a href="javascript:;" class="btn btn-warning ms-2 cartbtn" id="product_#product_id#" onclick="removeFromCart(#product_id#)">Remove from Cart</a>
                  <div class="input-group mb-3 w-25 float-end">
                    <button class="btn btn-outline-secondary decreaseBtn" type="button" data-product="#cart_id#">-</button>
                    <input type="text" class="form-control text-center productCount" id="static_#cart_id#" value="#quantity#" readonly>
                    <button class="btn btn-outline-secondary increaseBtn" type="button" data-product="#cart_id#">+</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </cfloop>
        
      </cfif>
    </div>
   
  </div>
  </cfoutput>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/cart.js"></script>
<script>
  // JavaScript to disable or enable the button based on the server-side condition
  window.addEventListener('DOMContentLoaded', function() {
    var checkoutBtn = document.getElementById('checkoutBtn');
    var recordCount = <cfoutput>#getallproducts.recordCount#</cfoutput>; // Get the record count from ColdFusion

    // Disable or enable the button based on the record count
    if (recordCount === 0) {
      checkoutBtn.disabled = true;
    } else {
      checkoutBtn.disabled = false;
    }
  });
</script>
</body>
</html>
