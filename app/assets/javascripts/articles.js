// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(
  function() {
    const pc = Number(document.querySelector('li.active a').innerText);
    if(pc > 1) $('#bs-carousel').hide();
  }
);
