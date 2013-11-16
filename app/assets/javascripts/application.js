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
//= require dataTables/jquery.dataTables.bootstrap3
//= require chosen-jquery
//= require jquery.bracket
//= require ckeditor/init
//= require cashier_notifications
//= require_tree .

$(function () {
	$('input.date_picker').datetimepicker({dateFormat:"dd/mm/yy"});
	$('.chosen-enabled-form select').each(function () {
		var data = $(this).data("chosenparams");

		if(data)
			$(this).chosen(data);
		else
			$(this).chosen();
	});
	render_bracket();
});
