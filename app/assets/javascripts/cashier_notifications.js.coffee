play_pending_sound = () ->
	$('#pending-order-audio audio')[0].play()

load_ajax_response = (data) ->
	$('#pending-order-container').html(data)

showing_alert = false
check_for_pending_orders = () ->
	$.ajax($('#pending-order-container').data('updatepath'),
		statusCode:
			200: ((data,status,xhr) ->
							console.log("200, sa = " + showing_alert)
							load_ajax_response(data)
							if(!showing_alert)
								play_pending_sound()
								set_sound_interval()
								showing_alert = true)
			204: (() ->
							console.log("204, sa = " + showing_alert)
							load_ajax_response("")
							if(showing_alert)
								clear_sound_interval()
								showing_alert = false)
		)

sound_interval = null
clear_sound_interval = () ->
	console.log("clear, si = " + sound_interval)
	if(sound_interval != null)
		window.clearInterval(sound_interval)
		sound_interval = null

set_sound_interval = () ->
	console.log("set, si = " + sound_interval)
	clear_sound_interval()
	sound_interval = window.setInterval(play_pending_sound,60000)

set_pending_order_check_interval = () ->
	window.setInterval(check_for_pending_orders,20000)

$(() ->
	if($('#pending-order-container').length > 0)
		showing_alert = $('#pending-order-message').length > 0
		set_pending_order_check_interval()
		if(showing_alert)
			set_sound_interval())