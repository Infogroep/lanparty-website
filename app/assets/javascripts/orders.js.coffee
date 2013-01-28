# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

hook_order_ajax_onto = (jObject) ->
	jObject.on('ajax:success', (evt, data, status, xhr) ->
	                             $('#order-item-table').html(data)
	                             hook_order_ajax_onto_updating())
	       .on('ajax:error',   (evt, xhr, status, error) ->
	                             $('#flash-messages').html(xhr.responseText))

hook_order_ajax_onto_updating = () ->
	hook_order_ajax_onto($('[data-remote]:not([data-static])'))

$(() ->
	hook_order_ajax_onto_updating()
	hook_order_ajax_onto($('[data-remote][data-static]')))