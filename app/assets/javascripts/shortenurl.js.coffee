# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this

root.copied = ->
	      alertify.alert "Short Url has been copied";
root.checkUrl = ->
    $ -> 
     @longurls = $('#longurlvalue').val();
    if @longurls.length is 0
      alertify.alert("Url can not be blank");
    else
      alertify.success("Shorten Url Successfully!");
      

