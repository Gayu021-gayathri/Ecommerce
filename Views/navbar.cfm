<!-- Include Bootstrap Icons CSS file from CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="https://image.similarpng.com/very-thumbnail/2020/11/Online-shopping-logo-template-on-transparent-background-PNG.png" alt="" width="30" height="24">
      My Website</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-center p1">
        <li class="nav-item mx-3">
          <a class="nav-link" href="product.cfm">Home</a>
        </li>
        <li class="nav-item fs-4 mx-3">
          <a class="nav-link position-relative" href="cart.cfm">
            <i class="bi bi-cart3 bi-lg"></i> 
            <!--- <span class="badge bg-secondary position-absolute top-0 start-100 translate-middle" id="counter">1</span>  --->
          </a>
        </li>
        <cfif structKeyExists(session, "isLoggedin") && session.isLoggedin == true>
          <li class="nav-item dropdown fs-4">
            <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-person bi-lg"></i> 
            </a>
            <ul class="dropdown-menu" aria-labelledby="accountDropdown">
              <li><a class="dropdown-item" href="">Welcome, <span id="userName">
                <cfoutput>
                  #session.username#
                </cfoutput>
              </span>!</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" onclick="logout()" type = "button">Logout</a></li>
            </ul>
          </li>
        <cfelse>
          <li class="nav-item mx-3">
            <a class="nav-link" href="login.cfm">Login</a>
          </li>
        </cfif>
      </ul>
    </div>
  </div>
</nav>

<script>
  function logout() {
    $.ajax({
      url: '../components/logout.cfc?method=logout',
      method: 'POST',
      success: function(response) {
        window.location.href = 'login.cfm'; 
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  }
</script>




