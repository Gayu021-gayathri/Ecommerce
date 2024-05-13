$(document).ready(function(){

  $("#addToCartBtn").click(function() {
    console.log("one")
    addToCart(product_id);
  });

  $("#removeFromCartBtn").click(function() {
    console.log("remove")
    removeFromCart(product_id);
  });

 $(".increaseBtn, .decreaseBtn").on("click", function() {
    var cartId = $(this).data("product");
    var action = $(this).hasClass("increaseBtn") ? "increase" : "decrease";
    var currentQuantity = parseInt($("#quantity_" + cartId).text());
    var newQuantity = action === "increase" ? currentQuantity + 1 : Math.max(1, currentQuantity - 1);
    updateQuantity(cartId, newQuantity);
  });

});

function addToCart(product_id) {
  $.ajax({
    type: "POST",
    url: "../components/cart.cfc?method=insertIntoCart",
    data: {
        productid: product_id
    },
    success: function(response) {
        var jsonResponse = JSON.parse(response);
        console.log(jsonResponse.SUCCESS);
        // if (jsonResponse.SUCCESS) {
        //     alert("Product added to cart successfully!");
        // } else {
        //     alert("Failed to add product to cart. Please try again.");
        // }
        if (jsonResponse.ACTION === 1) {
          $('#product_' + product_id).removeClass('btn-success').addClass('btn-warning').text('Remove from Cart');
        }
        else{
          $('#product_' + product_id).removeClass('btn-warning').addClass('btn-success').text('Add to Cart');
        }
    },
    error: function(xhr, textStatus, errorThrown) {
        alert("AJAX error: " + errorThrown);
        // Handle error if needed
    }
  });
}

function removeFromCart(product_id) {
  $.ajax({
    type: "POST",
    url: "../components/cart.cfc?method=insertIntoCart",
    data: {
        productid: product_id
    },
    success: function(response) {
        var jsonResponse = JSON.parse(response);
        console.log(jsonResponse.SUCCESS);
        
        $('#product_' + product_id).hide();
    },
    error: function(xhr, textStatus, errorThrown) {
        alert("AJAX error: " + errorThrown);
    }
  });
}

function updateQuantity(cartId, quantity) {
    $.ajax({
      type: "POST",
      url: "../components/cart.cfc?method=updateQuantity",
      data: {
        cart_id: cartId,
        quantity: quantity
      },
      success: function(response) {
        if (response) {
          $("#quantity_" + cartId).text(quantity);
           $("#static_" + cartId).val(quantity);
        } else {
          alert("Failed to update quantity. Please try again.");
        }
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("AJAX error: " + errorThrown);
      }
    });
  }
