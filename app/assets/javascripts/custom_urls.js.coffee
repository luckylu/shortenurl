# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
 $("#customurlbutton").on("click",checkCustomUrl)

checkCustomUrl = -> 
 $ ->
  customlongurl = $("#customlongurl").val()
  customshorturl = $("#customshorturl").val()
  if customlongurl.length is 0
   $("#customlongurl").focus()
   $("#customlongurl").css("border-color" : "red")
   alertify.alert("Origin Url can not be blank")
  else if customshorturl.length is 0
   $("#customshorturl").focus()
   $("#customshorturl").css("border-color" : "red")
   $("#customlongurl").css("border-color" : "#CCCCCC")
   alertify.alert("Custom Url can not be blank")
  else
   $("#customshorturl").css("border-color" : "#CCCCCC")
   $("#customlongurl").css("border-color" : "#CCCCCC")
 
 
  