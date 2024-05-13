<!DOCTYPE html>
<html class="h-100">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width,height=device-height, initial-scale=1"
    />
    <title>Hello World</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body class="h-100">
    <cfif structKeyExists(session, "userid") AND structKeyExists(session, "isLoggedin")>
        <cflocation  url="Views/product.cfm">
    <cfelse>
      <cflocation  url="Views/login.cfm">
    </cfif>
  </body>
</html>