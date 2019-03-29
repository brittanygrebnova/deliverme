// $(function () {
//   console.log("deliverme.js is loaded")
//   listenForClick()
// })
//
// function listenForClick() {
//   const userOrderButton =
//   $(document).on("click", "button#user-orders", function (event) {
//     event.preventDefault
//     console.log("heyyyyy")
//   })
// }

$(document).ready(function() {
  $("button#user-orders").click(function(e) {
    e.preventDefault();
    console.log("default prevented!")
    getOrders()
  })
})

function getOrders() {
  $.ajax({
    url: 'https://localhost:3000/orders',
    method: 'get',
    dataType: 'json'
  }).done(function(data) {
    console.log("the data is: ", data)
  })
}
