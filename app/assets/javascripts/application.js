// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require chosen-jquery
//= require jquery.bracket
//= require_tree .

$(function () {
	$('input.date_picker').datetimepicker({dateFormat:"dd/mm/yy"});
	$('.chosen').chosen();
});

function load_i18n_js(locale) {
	var datatable_settings = {
		"sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		"sPaginationType":"bootstrap"
	};

	if (locale == "nl") {
		datatable_settings.oLanguage = {
			"sProcessing":"Bezig...",
			"sLengthMenu":"_MENU_ resultaten weergeven",
			"sZeroRecords":"Geen resultaten gevonden",
			"sInfo":"_START_ tot _END_ van _TOTAL_ resultaten",
			"sInfoEmpty":"Geen resultaten om weer te geven",
			"sInfoFiltered":" (gefilterd uit _MAX_ resultaten)",
			"sInfoPostFix":"",
			"sSearch":"Zoeken:",
			"sEmptyTable":"Geen resultaten aanwezig in de tabel",
			"sInfoThousands":".",
			"sLoadingRecords":"Een moment geduld aub - bezig met laden...",
			"oPaginate":{
				"sFirst":"Eerste",
				"sLast":"Laatste",
				"sNext":"Volgende",
				"sPrevious":"Vorige"
			}
		}
	}

	$('.datatable').dataTable(datatable_settings);
}
