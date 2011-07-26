$ ->
	$("#reparaciones td").click ->
		reparacion = $(@).parent().children('.id').text()
		$.post 'getdatosreparacion',
			reparacion: reparacion,
			(rep) ->
				console.log rep
				rep = JSON.parse rep
				equipo = rep.equipo
				problema = "<div class='contentapprise'><h2>#{equipo.denominacion} " +
				"[#{equipo.codigoPatrimonial}]</h2>" +
				"<h4>Reparaci&oacute;n #{rep.id}</h4>" +
				"<h3>Diagn&oacute;stico</h3>" +
				"<p>#{rep.detalleSolicitud.problema}.</p></div>"
				apprise problema,
					verify: true
					textYes: 'Seleccionar'
					textNo: 'Cancelar'

	evaluarElementos = ->
		checked = $("#terceros").attr "checked"
		b = if checked then true else false
		$("input[type='text'], input[type='radio'], #diagnostico").attr "disabled", b

	($ '#terceros').click (e) ->
		if ($ "#terceros").attr("checked") is "checked"
			e.preventDefault()
			elements =
				"<div class='contentapprise'><h3>Sustentación de Solicitar Terceros</h3>" +
				"<textarea id='susterceros'></textarea></div>"
			apprise elements,
				verify: true
				textYes: 'Aceptar'
				textNo: 'Cancelar',
				(b) ->
					($ "#terceros").attr "checked", b
		evaluarElementos()
