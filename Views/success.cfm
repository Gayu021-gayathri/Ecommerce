<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout Success</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
  <cfif !structKeyExists(session,"userid") OR !structKeyExists(session,"orderedItems") >
    <cflocation url="login.cfm">
  </cfif>
  
  <div class="container mt-5">
    <!-- Success Icon -->
    <div class="text-center mb-4">
        <i class="bi bi-check-circle-fill text-success" style="font-size: 80px;"></i>
    </div>
    <!-- Success Message -->
    <h1 class="text-center mb-4">Order Placed Successfully!</h1>
    <!-- List of Products -->
    <div class="card mb-3">
      <div class="card-body">
        <h5 class="card-title">Your Ordered Products</h5>
        <ul class="list-group list-group-flush">
          <cfoutput>
          <cfloop array="#session.orderedItems#" index="product">
            <li class="list-group-item">#product#</li>
          </cfloop>
        </cfoutput>
        </ul>
      </div>
    </div>
    <div class="d-flex justify-content-center">
        <a href="product.cfm" class="mt-2">
          <button class="btn btn-success">
              Go to Home
          </button>
        </a>
    </div>
    
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
