# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.ac-select2').each ->
    url = $(this).data('url')
    placeholder = $(this).data('placeholder')
    $(this).select2
      theme: "bootstrap"
      minimumInputLength: 2
      maximumSelectionLength:1
      multiple: true
      placeholder: placeholder
      allowClear: true
      ajax:
        url: url
        dataType: 'json'
        quietMillis: 500
        data: (params) ->
          { name_like: params.term }
        processResults: (data, page) ->
          formatted = []
          data.forEach (item) ->
            formatted.push
              id: item['id']
              text: item['name']
            return
          { 
            results: formatted 
          }
      formatResult: (item, page) ->
        item.name
      formatSelection: (item, page) ->
        item.name
    return
  return