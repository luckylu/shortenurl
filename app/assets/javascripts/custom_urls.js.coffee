# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this
root.checkCustomUrl = ->
 $ ->
  @customlongurl = $("#customlongurl").val()
  @customshorturl = $("#customshorturl").val()
 if @customlongurl.length is 0 
  $("#customlongurl").focus( ->
   $("#customlongurl").css({'border-color' : 'red'})
  )
  alertify.alert("Origin Url can not be blank")
  
 else if @customshorturl.length is 0
  $("#customshorturl").focus()
  alertify.alert("Short Url can not be blank")
  
 
  