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
    data["data"].forEach(function(order) {
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
}

function displayOrder(id) {
  $.getJSON(`https://localhost:3000/orders/${id}`, function(data) {
    console.log("the data for that order is: ", data)
  })
}

Order.prototype.orderHTML = function() {
  return (`
    <div>
      <strong><h3>Order # ${this.id}</h3></strong><button onclick="displayOrder(${this.id})" data-id="${this.id}">View Order Details</button>
    `)
}
