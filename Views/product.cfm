<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product List</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    
    .card {
      height: 100%;
    }
  </style>
</head>
<body>
<cfinclude template="navbar.cfm">
<!-- Include your ColdFusion component -->
<cfset objProductService = createObject("component", "component.product")>
<cfset getallproducts = objProductService.getAllProducts()>
<cfset userProduct = []>
<cfset objcartService = createObject("component", "component.cart")>
<cfif structKeyExists(session, "isLoggedin") && session.isLoggedin>
    <cfset userProduct = objcartService.getProductIdsForUser(session.userid)>
</cfif>
<div class="container">
  <h1 class="mt-5 mb-4">Product List</h1>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <cfoutput query="getallproducts" startrow="1">
      <div class="col">
        <div class="card h-100 rounded-4">
          <img src="#thumbnail#" class="p-2 m-2 img-fluid" alt="#title#">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title">#title#</h5>
            <p class="card-text flex-grow-1">#description#</p>
            <p class="card-text">#(price)#</p>
            <a  href="productDetail.cfm?id=#product_id#" class="btn btn-primary mt-auto">View</a>
            <cfif structKeyExists(session, "isLoggedin") && session.isLoggedin>
              <cfif arrayLen(userProduct) GT 0 AND arrayFind(userProduct, product_id) GT 0>
                 <a class="btn btn-warning mt-2" href="cart.cfm" id="product_#product_id#">Go to Cart</a>
              <cfelse>
                 <a  class="btn btn-success mt-2" id="product_#product_id#" onclick="addToCart(#product_id#)">Add to Cart</a>                
              </cfif>             
            <cfelse>
              <a href="login.cfm" class="btn btn-warning mt-2">Login to Add to Cart</a>
            </cfif>
          </div>
        </div>
      </div>
    </cfoutput>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="../js/cart.js"></script>
</body>
</html>
