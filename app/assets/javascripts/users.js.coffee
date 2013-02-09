# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#user_clan_tag').autocomplete
		source: $('#user_clan_tag').data('autocomplete-source')

$(() ->
	$('#sound-selector').on('change',(evt) ->
		me = $(evt.target)
		$.ajax(me.data("soundtestpath"),
			data:
				sound: me.val()
			success: (data,status,xhr) -> $('#sound-test-area').html(data)
		)))