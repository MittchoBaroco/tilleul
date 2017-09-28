# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  impacted_service = $('#ticket_impacted_service :selected').text()
  if impacted_service == "Other"
    $("#other_service").fadeIn()

  $('#ticket_impacted_service').change ->
    impacted_service = $('#ticket_impacted_service :selected').text()
    if impacted_service == "Other"
      $("#other_service").fadeIn()
    else
      $("#other_service").fadeOut()
  
  $('.open_section').click ->
    button = this
    table = $(button).closest('h3').next('table')
    table.fadeToggle ->
      if $(table).is(":visible")
        $(button).attr('class', 'fa fa-caret-up dim open_section');
      else
        $(button).attr('class', 'fa fa-caret-down dim open_section');
