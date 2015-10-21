
app_helper_ready = ->
	$('input[type=file]').bind 'change', ->
	  size_in_megabytes = Math.round(@files[0].size / 1024 / 1024)
	  upload_time = Math.round(@files[0].size / 1024 / (1024/8))
	  if size_in_megabytes > 1
	    alert 'Warning: This file is large (' + size_in_megabytes + ' megabytes) and would take ' + upload_time + ' seconds to upload on a typical internet connection. So when you click submit, the system may appear to stall for a while.'
	  return

  $('.ac-select2').each ->
    url = $(this).data('url')
    #placeholder = $(this).data('placeholder')
    $(this).select2
      theme: "bootstrap"
      minimumInputLength: 0
      maximumSelectionLength:1
      #placeholder: placeholder
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

$(document).ready(app_helper_ready);
$(document).on('page:load', app_helper_ready);

