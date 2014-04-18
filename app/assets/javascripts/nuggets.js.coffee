# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$().ready ->
  $("#q").keyup ->
    re = new RegExp($("#q").val(), "i")
    $('tr.nugget').each ->
      if $(this).children().text().match(re)
        $(this).show()
      else
        $(this).hide()
  $('#location-add-button').click ->
    $('#location-add-button').hide()