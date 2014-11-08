$ ->
	guest = $('body').attr('data-guest') == "true"
	if guest
		$('#sign-in-modal').modal('show')

	$('.try-guest').click ->
		$('#sign-in-modal').modal('hide')

	$('.sign-in-link').click ->
		$('#pre-sign-in, #sign-up-content').addClass('hidden')
		$('#sign-in-content').removeClass('hidden')

	$('.sign-up-link').click ->
		$('#pre-sign-in, #sign-in-content').addClass('hidden')
		$('#sign-up-content').removeClass('hidden')