$(document).ready(function() {
  $("button#user-orders").click(function(e) {
    e.preventDefault();
    console.log("default prevented!")
    getOrders()
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
  }

  static orderReviewForm() {
    return (`
      <strong>Review This Order</strong>
      `)
  }
}

function displayOrder(id) {
  $.getJSON(`https://localhost:3000/orders/${id}`, function(data) {
    console.log("the data is: ", data)
    let orderDate = `<p><strong>Order Placed: </strong>` + new Date(data["order"]["created_at"]) + `</p>`;
    let vendor = `<p><strong>Vendor: </strong>` + data["order"]["vendor"]["name"] + `</p>`
    let itemsHTML = `<p><strong>Items:</strong></p>`;
    data["order"]["items"].forEach(function(item) {
      let itemInfo = `<p>${item["name"]} | $ ${item["price"]}</p>`
      itemsHTML += itemInfo + `\n`
    })
    $(`div#${id}`).html(vendor + itemsHTML + orderDate)
  })
}

Order.prototype.orderHTML = function() {
  return (`
    <div>
      <strong><h3>Order # ${this.id}</h3></strong><button onclick="displayOrder(${this.id})">View Order Details</button><div class="order-info" id="${this.id}">
    </div>
    `)
}
