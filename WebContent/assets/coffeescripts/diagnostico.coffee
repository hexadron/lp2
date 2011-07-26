$ ->
	$("#reparaciones td").click ->
		row = $(@).parent()
		reparacion = row.children('.id').text()
		$.post 'getDatosReparacion',
			reparacion: reparacion,
			(rep) ->
				rep = JSON.parse rep
				equipo = rep.equipo
				problema = "<div class='contentapprise'><h2>#{equipo.denominacion} " +
				"[#{equipo.codigoPatrimonial}]</h2>" +
				"<h4>Reparaci&oacute;n #{rep.id}</h4>" +
				"<h3>Problema</h3>" +
				"<p>#{rep.detallesolicitud.problema}.</p></div>"
				apprise problema,
					verify: true
					textYes: 'Seleccionar'
					textNo: 'Cancelar',
					(r) ->
						if r
							($ '.eqselected').removeClass 'eqselected'
							row.addClass 'eqselected'
							evaluarGuardar()
	
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
		
	evaluarGuardar = ->
		b = ($.trim($('#diagnostico').val()) is "") or ($ ":radio:checked").length is 0 or ($ ".eqselected").length is 0
		($ '#guardar').attr "disabled", b
	
	($ '#diagnostico').keyup -> evaluarGuardar()
	
	($ ':radio').change -> evaluarGuardar()

	($ '#guardar').live 'click', (e) ->
		e.preventDefault();
		reparacion = ($ '.repid').text()
		diagnostico = ($ '#diagnostico').val()
		prioridad = ($ ':radio:checked').val()
		console.log $('#susterceros').val()
		if ($ "#terceros").attr("checked") is 'checked'
			$.post 'registrarTerceros',
				reparacion: reparacion
				diagnostico: diagnostico
				prioridad: prioridad,
				sustentacion: $('#susterceros').val()
				(r) ->
					apprise 'Orden de Solicitud a Terceros generada',
						textOk: 'Aceptar',
						(b) ->
							window.location = ''
		else
			$.post 'registrarDiagnostico',
				reparacion: reparacion
				diagnostico: diagnostico
				prioridad: prioridad,
				(r) ->
					apprise 'Diagn&oacute;stico guardado',
						textOk: 'Aceptar',
						(b) ->
							window.location = ''
		