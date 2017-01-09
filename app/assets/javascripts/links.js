
function ajax_shorten() {

	var form = $("form[name=shorten]");

	$.ajax({
		url: '/api/shorten',
		type: 'POST',
		data: form.serialize()
	}).done(function(response) {
		$("#result").html("<a href='"+response.data+"'>"+response.data+"</a>");
	});
}

$(document).on('page:change', function() {	

	var form = $("form[name=shorten]");
	form.submit(function() {
		ajax_shorten();
		return false;
	});
});