$ ->
	# set the autocomplete data on the clan name box
	$('#user_clan_tag').autocomplete
		source: $('#user_clan_tag').data('autocomplete-source')

	# play a sound test when a user selects a sound in his control panel
	$('#sound-selector').on 'change', (evt) ->
		me = $(evt.target)

		# get the sound test HTML snippet using the URL in the data-soundtestpath attribute
		$.ajax me.data("soundtestpath"),
			data:
				sound: me.val()

			# when the request succeeds, place the received audio HTML in the sound test area
			success: (data,status,xhr) -> $('#sound-test-area').html(data)
