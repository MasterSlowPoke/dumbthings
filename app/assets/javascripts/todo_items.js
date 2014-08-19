// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//$(document).on('page:load', function() {
$( function() {
	var item = $('#todo_item_color');
	if (item.length) {
		item[0].disabled = !$('#todo_item_uses_color')[0].checked;
	}

	$('#todo_item_uses_color').change(function() {
		var checkbox = $('#todo_item_uses_color')[0];
		if(checkbox.checked) {
			$('label[for=todo_item_color').css('color', '#000000');
		} else {
			$('label[for=todo_item_color').css('color', '#888888');
		}
		$('#todo_item_color')[0].disabled = !checkbox.checked;
	});
})


// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// $( function() {
// 	// $('#todo_item_color')[0].disabled = !$('#todo_item_uses_color')[0].checked;

// 	$('html').on('change', '#todo_item_uses_color', function() {
// 		$('#todo_item_color')[0].disabled = !$('#todo_item_uses_color')[0].checked;
// 	});
// })