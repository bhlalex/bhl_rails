# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# $('check10').click(function() {
# alert(1); 
#}

$(document).ready ->
  $('.check10').on "click", ->
    reload_map()
  $('.check20').on "click", ->
    reload_map()
  $('.check30').on "click", ->
    reload_map()
  $('.check40').on "click", ->
    reload_map()
  $('.check50').on "click", ->
    reload_map()
  
  reload_map = ->
    checked_values = []
    if $('.check10').prop("checked") == true
      checked_values.push(10)
    if $('.check20').prop("checked") == true
      checked_values.push(20)
    if $('.check30').prop("checked") == true
      checked_values.push(30)
    if $('.check40').prop("checked") == true
      checked_values.push(40)
    if $('.check50').prop("checked") == true
      checked_values.push(50)
    $(location).attr("href",'/geographics/index/'+checked_values.toString())
    