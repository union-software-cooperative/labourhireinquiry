# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  
  $('.switch').bootstrapSwitch
    onSwitchChange: (e, data)->
      if data
        $('#'+e.currentTarget.id+'_comment').parent().hide()  
      else
        $('#'+e.currentTarget.id+'_comment').parent().show()
    

  
  $('.ac-select2-tags').each ->
    placeholder = $(this).data('placeholder')
    $(this).select2
      theme: "bootstrap"
      multiple: true
      placeholder: placeholder
      allowClear: false
      tags: true
    return

$(document).ready(ready);
$(document).on('page:load', ready);




