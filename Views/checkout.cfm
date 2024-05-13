<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <cfinclude template="navbar.cfm">
  <cfset local.products = arrayNew(1)>
  <cfif !structKeyExists(session,"userid")>
    <cflocation url="login.cfm">
  </cfif>
  <cfset local.totalPrice = 0 >
  <cfset local.totalDicount = 0 >
  <div class="container mt-5">
    <h1 class="mb-4">Checkout</h1>
    <div class="row">
      <!-- Product Details Section -->
      <div class="col-md-6">
        <h2>Product Details</h2>
        <!-- Loop through cart items -->
        <cfset objCartService = createObject("component", "component.cart")>
        <cfset getallproducts = objCartService.getUserCartProductDetails(session.userid)>
        <cfif getallproducts.recordCount EQ 0>
          <div class="alert alert-info" role="alert">
            Your cart is empty. Please add some products.
          </div>
        <cfelse>
          <cfoutput>
            <cfset local.totalPrice = 0 >
            <cfset local.totalDicount = 0 >
            <cfloop query="getallproducts">
              <cfset  arrayAppend(local.products, product_id)>
              <cfset local.totalPrice += price>
              <cfset local.totalDicount += discountpercentage >

              <div class="card mb-3">
                <div class="row g-0">
                  <!-- Product image on the left -->
                  <div class="col-md-4">
                    <img src="#thumbnail#" class="img-fluid rounded-start" alt="#title#">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">#title#</h5>
                      <p class="card-text">Price: $#price#</p>
                      <p class="card-text">#description#</p>
                      <p class="card-text">Quantity: #quantity#</p>
                    </div>
                  </div>
                </div>
              </div>
            </cfloop>
          </cfoutput>
        </cfif>
      </div>
      <!-- Payment Details Section -->
      <div class="col-md-6">
        <h2>Payment Details</h2>
        <!-- Display total price, discount, etc. -->
        <!-- Add form fields for shipping and billing address -->
        <form id="checkoutForm">
          <cfoutput>             
            <div class="mb-3">
              <input type="hidden" id="productIds" name="productIds" value="#serializeJSON(local.products)#">
              <label for="totalPrice" class="form-label">Total Price</label>
              <input class="form-control" id="totalPrice" rows="3" readonly value=#dollarFormat(local.totalPrice)#>
            </div>
            <div class="mb-3">
              <label for="totalDiscount" class="form-label">Total Dicount</label>
              <input class="form-control" id="totalDiscount" rows="3" readonly value="#local.totalDicount# %">
            </div>
            <div class="mb-3">
              <label for="shippingAddress" class="form-label">Shipping Address</label>
              <textarea class="form-control" id="shippingAddress" rows="3"></textarea>
              <div class="text-danger d-none">
                Please enter valid shipping address.
              </div>
            </div>
            <div class="mb-3">
              <label for="billingAddress" class="form-label">Billing Address</label>
              <textarea class="form-control" id="billingAddress" rows="3"></textarea>
              <div class="text-danger d-none">
               Please enter valid billing address.
              </div>
            </div>
            <!-- Proceed to Buy Button -->
            <button type="submit" class="btn btn-primary">Proceed to Buy</button>
        </cfoutput>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="../js/checkout.js"></script>

</body>
</html>
