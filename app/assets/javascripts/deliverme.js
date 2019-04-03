$(document).ready(function() {
  $("button#user-orders").click(function(e) {
    e.preventDefault();
    console.log("default prevented!");
    getOrders();
  })
  $("button#new-order").click(function(e) {
    e.preventDefault();
    console.log("default prevented!");
    listVendors();
  })

})

function getOrders() {
  $.getJSON( 'https://localhost:3000/orders', function(data){
    console.log("the data is: ", data)
    data["orders"].forEach(function(order) {
      let userOrder = new Order(order);
      let userOrderHTML = userOrder.orderHTML();
      document.getElementById("user-orders-list").innerHTML += userOrderHTML
    })
  })
}

class Order {
  constructor(obj) {
    this.id = obj.id
    this.items = obj.items
    this.vendor = obj.vendor
  }
}

Order.prototype.orderHTML = function() {
  return (`
    <div>
      <strong><h3>Order # ${this.id}</h3></strong><button onclick="displayOrder(${this.id})">View Order Details</button><div class="order-info" id="${this.id}">
    </div>
    `)
}

function displayOrder(id) {
  $.getJSON(`https://localhost:3000/orders/${id}`, function(data) {
    console.log("the data is: ", data)
    let vendor = `<p><strong>Vendor: </strong>` + data["order"]["vendor"]["name"] + `</p>`
    let itemsHTML = `<p><strong>Items:</strong></p>`;
    data["order"]["items"].forEach(function(item) {
      let itemInfo = `<p>${item["name"]} | $ ${item["price"]}</p>`
      itemsHTML += itemInfo + `\n`
    })
    let orderDate = `<p><strong>Order Placed: </strong>` + new Date(data["order"]["created_at"]) + `</p>`;
    $(`div#${id}`).html(vendor + itemsHTML + orderDate)
  })
}

function listVendors() {
  $.getJSON(`https://localhost:3000/vendors`, function(data){
    let vendorNames = `<br><strong>Choose A Vendor</strong><br>`
    let itemButtons = `<form id="new-order-form"><br><strong>Choose Your Item(s)</strong><br>`
    document.querySelector("#new-order-div").innerHTML = "<br><strong>Choose A Vendor</strong><br>"
    data["vendors"].forEach(function(vendor) {
      vendorName = `<br><button id="${vendor.name}" class="vendor-button"><strong>${vendor.name}</strong></button><br>`
      vendorNames += vendorName
      $("#new-order-div").html(vendorNames)
      if (document.querySelectorAll(".vendor-button").length === data["vendors"].length) {
        document.querySelector(".vendor-button").addEventListener("click", function() {
          let vendor = data["vendors"].find(vendor => vendor.name == `${this.id}`)
          vendor.items.forEach(function(item) {
            itemButton = `<br><input type="checkbox" id="${item.name}" class="vendor-button"><strong>${item.name}: $${item.price}</strong></input><br>`
            itemButtons += itemButton
            $("#new-order-div").html(itemButtons + `<br><input type="submit" value="Place Your Order"></input></form>`)
            $("#new-order-form").on("submit", function() {
              debugger
            })
          })
        })
      }
    })
  })
}
