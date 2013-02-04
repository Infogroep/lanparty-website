# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# AJAX Updating of item list
hook_order_ajax_onto = (jObject) ->
	jObject.on('ajax:beforeSend', (evt, xhr, settings) ->
	                                lock_order())
	       .on('ajax:success',    (evt, data, status, xhr) ->
	                                $('#order-item-table').html(data)
	                                hook_order_ajax_onto_updating()
	                                unlock_order())
	       .on('ajax:error',      (evt, xhr, status, error) ->
	                                $('#flash-messages').html(xhr.responseText)
	                                unlock_order())

hook_onchange = (jObject) ->
	jObject.on('change', (evt) ->
		$(evt.delegateTarget).submit())

hook_order_ajax_onto_updating = () ->
	updating = $('[data-remote]:not([data-static])')
	hook_order_ajax_onto(updating)
	hook_onchange(updating)

$(() ->
	hook_order_ajax_onto_updating()
	hook_order_ajax_onto($('[data-remote][data-static]')))


# Submit protection
lock_count = 0
lock_order = () ->
	$('.order-submit-button').addClass('disabled').on('click.orderlock', () -> false)
	$('.order-lock-indicator').show()
	++lock_count

unlock_order = () ->
	if --lock_count == 0
		$('.order-submit-button').removeClass('disabled').off('click.orderlock')
		$('.order-lock-indicator').hide()

$(() ->
	$('.order-lock-indicator').hide())