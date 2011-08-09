terceros = undefined

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
		$("input[type='text']:not(.aTextbox), input[type='radio'], #diagnostico").attr "disabled", b
	
	($ '#terceros').click (e) ->
		if ($ "#terceros").attr("checked") is "checked"
			e.preventDefault()
			elements =
				"<div class='contentapprise'><h3>Sustentaci&oacute;n de Solicitar Terceros</h3>"
			apprise elements,
				verify: true
				input: true
				textYes: 'Aceptar'
				textNo: 'Cancelar',
				(b) ->
					terceros = b
					($ '#guardar').attr 'disabled', false
					($ "#terceros").attr "checked", b?
		evaluarElementos()
		
	evaluarGuardar = ->
		b = ($.trim($('#diagnostico').val()) is "") or ($ ":radio:checked").length is 0 or ($ ".eqselected").length is 0
		($ '#guardar').attr "disabled", b
	
	($ '#diagnostico').keyup -> evaluarGuardar()
	
	($ ':radio').change -> evaluarGuardar()

	($ '#guardar').click (e) ->
		e.preventDefault();
		reparacion = ($ '.eqselected .repid').text()
		if terceros
			$.post 'registrarOrdenTerceros',
				reparacion: reparacion
				terceros: terceros,
				(rep) ->
					apprise 'Orden de terceros guardada',
						confirm: true
						textOk: 'Aceptar'
						textCancel: 'Aceptar',
						(b) ->
							window.location = ''
		else
			diagnostico = ($ '#diagnostico').val()
			prioridad = ($ ':radio:checked').val()
			$.post 'registrarDiagnostico',
				reparacion: reparacion
				diagnostico: diagnostico
				prioridad: prioridad,
				(r) ->
					apprise 'Diagn&oacute;stico guardado',
						confirm: true
						textOk: 'Aceptar'
						textCancel: 'Aceptar',
						(b) ->
							window.location = ''