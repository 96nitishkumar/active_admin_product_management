// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
//= require chartkick
//= require Chart.bundle

document.addEventListener("DOMContentLoaded", function () {
  var orderChart = document.getElementById("order-chart");
  var productChart = document.getElementById("product-chart");

  if (orderChart && productChart) {
    orderChart.style.display = "inline-block";
    productChart.style.display = "inline-block";
  }
});
