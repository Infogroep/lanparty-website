$ ->
	# General settings
	datatable_settings =
		# "sDom":"<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
		sPaginationType: "bootstrap"
		oLanguage:
			sProcessing: "<%= t(".processing") %>"
			sLengthMenu: "<%= t(".length_menu") %>"
			sZeroRecords: "<%= t(".zero_records") %>"
			sInfo: "<%= t(".info") %>"
			sInfoEmpty: "<%= t(".info_empty") %>"
			sInfoFiltered: "<%= t(".info_filtered") %>"
			sInfoPostFix: "<%= t(".info_post_fix") %>"
			sSearch: "<%= t(".search") %>"
			sEmptyTable: "<%= t(".empty_table") %>"
			sInfoThousands: "<%= t(".info_thousands") %>"
			sLoadingRecords: "<%= t(".loading_records") %>"
			oPaginate:
				sFirst: "<%= t(".paginate.first") %>"
				sLast: "<%= t(".paginate.last") %>"
				sNext: "<%= t(".paginate.next") %>"
				sPrevious: "<%= t(".paginate.previous") %>"

	# Iterate over all datatables
	$('.datatable').each ->
		t = $(@)

		# Make the table a datatable
		dt = t.dataTable datatable_settings

		# Notify other scripts
		t.trigger 'after-datatable', datatable: dt

	# Do some hacks to introduce form-control classes the length selector and filter field.
	# The datatables gem already prepares these settings but DataTables doesn't do anything with it yet.
	# TODO: Remove this when DataTables fix their code.
	$('.dataTables_length select').addClass('form-control input-sm')
	$('.dataTables_filter input').addClass('form-control input-sm')
