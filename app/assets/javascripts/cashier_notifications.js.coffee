play_pending_sound = ->
	$('#pending-order-audio audio')[0].play()

load_ajax_response = (data) ->
	$('#pending-order-container').html(data)

# This flag remembers if an alert is already being shown
showing_alert = false
check_for_pending_orders = ->
	# We perform an ajax request using the update path provided as a
	# data attribute on the pending order container.
	$.ajax $('#pending-order-container').data('updatepath'),
		statusCode:
			# If the request returns with content to be placed in the
			# pending order container, we load the received data into the container and
			# play a sound if there wasn't already something pending earlier.
			# We also set a timer to periodically play the sound again.
			200: (data,status,xhr) ->
				console.log("200, sa = " + showing_alert)
				load_ajax_response(data)
				if not showing_alert
					play_pending_sound()
					set_sound_interval()
					showing_alert = true
			# If we received a 204 No Content status, we clear the alert and clear our sound
			# timer.
			204: ->
				console.log("204, sa = " + showing_alert)
				load_ajax_response("")
				if showing_alert
					clear_sound_interval()
					showing_alert = false


sound_interval = null
clear_sound_interval = ->
	console.log("clear, si = " + sound_interval)
	if sound_interval?
		window.clearInterval(sound_interval)
		sound_interval = null

set_sound_interval = ->
	console.log("set, si = " + sound_interval)
	clear_sound_interval()
	sound_interval = window.setInterval(play_pending_sound,60000)

set_pending_order_check_interval = ->
	window.setInterval(check_for_pending_orders,20000)

$ ->
	if $('#pending-order-container').length > 0
		showing_alert = $('#pending-order-message').length > 0
		set_pending_order_check_interval()
		set_sound_interval() if showing_alert