<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Detail</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<cfinclude template="navbar.cfm">
<!-- Include your ColdFusion component to get product details -->
<cfset objProductService = createObject("component", "component.product")>
<cfset productDetail = objProductService.getProductDetailsByID(url.id)>

<cfoutput>
  <div class="container mt-5">
    <h1 class="mb-4">Product Detail</h1>
    <div class="card">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="#productDetail.thumbnail#" class="img-fluid rounded-start" alt="#productDetail.title#">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">#productDetail.title#</h5>
            <p class="card-text">#productDetail.description#</p>
            <p class="card-text">#productDetail.price#</p>
            <p class="card-text">#productDetail.price#</p>
            <p class="card-text">Brand : #productDetail.brand#</p>
            <p class="card-text">Rating : #productDetail.rating#</p>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</cfoutput>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Your custom JavaScript file for adding products to the cart -->
<script type="text/javascript" src="../js/cart.js"></script>

</body>
</html>
