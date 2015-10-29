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

  $(".ellipsis").each ->
    t = $(this).html()
    if (t.length > 250)
      $(this).html(t.substring(1, 250) + '...')
      $(this).data('text', t)
      $(this).append("<a href='#' class='readmore'>more</a>")
      
  $('a.readmore').on 'click', (event) ->
    event.preventDefault()
    old_text = $(this).parent().data('text')
    $(this).parent().html(old_text)

  return

$(document).ready(rec_ready);
$(document).on('page:load', rec_ready);




