$(document).ready ->
$('div#custom_phase2 form').submit (event) ->
event.preventDefault()
url = $(this).attr('action')
custom_decomp = $('div#custom_phase2 #form_decomp').val()
$.ajax
type: 'put'
url: url
data: { form: { decomp: custom_decomp } }
dataType: 'json'
success: (json) ->
$('#decomp').text(json.decomp).effect('highlight')
$('div#custom_phase2').fadeOut() if json.decomp == "Dead (again)"