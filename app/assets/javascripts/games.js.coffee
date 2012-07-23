# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# to load ajax request when a dropdow-toggle is clicked
# first remove data-toggle=dropdown in the html
# when the ajax request success, it's add it dynamically
# meaning it will load it only once

remoteDropdown = () ->
  $(this).attr("data-toggle", "dropdown").click()

$(".dropdown-toggle").bind('ajax:success', remoteDropdown);
