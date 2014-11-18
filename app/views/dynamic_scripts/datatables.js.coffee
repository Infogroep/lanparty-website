$ ->
	# General settings
	datatable_settings =
		# "sDom":"<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
		language:
			processing: "<%= t(".processing") %>"
			lengthMenu: "<%= t(".length_menu") %>"
			zeroRecords: "<%= t(".zero_records") %>"
			info: "<%= t(".info") %>"
			infoEmpty: "<%= t(".info_empty") %>"
			infoFiltered: "<%= t(".info_filtered") %>"
			infoPostFix: "<%= t(".info_post_fix") %>"
			search: "<%= t(".search") %>"
			emptyTable: "<%= t(".empty_table") %>"
			thousands: "<%= t(".info_thousands") %>"
			loadingRecords: "<%= t(".loading_records") %>"
			paginate:
				first: "<%= t(".paginate.first") %>"
				last: "<%= t(".paginate.last") %>"
				next: "<%= t(".paginate.next") %>"
				previous: "<%= t(".paginate.previous") %>"

	# Iterate over all datatables
	$('.datatable').each ->
		t = $(@)

		# Make the table a datatable
		dt = t.DataTable datatable_settings

		# Notify other scripts
		t.trigger 'after-datatable', datatable: dt

	# Do some hacks to introduce form-control classes the length selector and filter field.
	# The datatables gem already prepares these settings but DataTables doesn't do anything with it yet.
	# TODO: Remove this when DataTables fix their code.
	$('.dataTables_length select').addClass('form-control input-sm')
	$('.dataTables_filter input').addClass('form-control input-sm')
