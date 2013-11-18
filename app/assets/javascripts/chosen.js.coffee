$ ->
	# enable chosen on all selects in all chosen enabled forms (all main forms)
	$('.chosen-enabled-form select').each ->

		# view creators can specify a data-attribute to specify initialization data to be passed to chosen
		$(@).chosen $(@).data("chosenparams")
