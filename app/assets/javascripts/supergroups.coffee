# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

resize = ->
	if $("body").width() < 768
		$('.banner-link').text($('.banner-link').data("short-name"))
	else
		$('.banner-link').text($('.banner-link').data("name"))

	$('.union_list_switch').bootstrapSwitch
		readonly: true
		size: 'mini'

	$('.union_switch').bootstrapSwitch
		onSwitchChange: (e,data) ->
			if data
				configure_url_display
				$("#union_urls").slideDown();
			else
				$("#union_urls").slideUp();
				

		
$( window ).resize ->
	resize()

supergroup_ready = ->
	#alert('here')
	#(".colorpicker").colorpicker()
	resize()

$(document).ready(supergroup_ready);
$(document).on('page:load', supergroup_ready);