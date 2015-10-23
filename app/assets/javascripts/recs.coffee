# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

rec_ready = ->  
  $('.ac-select2-tags').each ->
    placeholder = $(this).data('placeholder')
    $(this).select2
      theme: "bootstrap"
      multiple: true
      placeholder: placeholder
      allowClear: false
      tags: true
    return

  if(!/iPhone|iPad|iPod|Safari/i.test(navigator.userAgent))
    $('.ios_video').hide()


$(document).ready(rec_ready);
$(document).on('page:load', rec_ready);




