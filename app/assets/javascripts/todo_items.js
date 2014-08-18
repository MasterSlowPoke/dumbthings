// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( function() {
	$('#todo_item_uses_color').change(function() { 
		$('#todo_item_color')[0].disabled = !$('#todo_item_uses_color')[0].checked;
	});
})