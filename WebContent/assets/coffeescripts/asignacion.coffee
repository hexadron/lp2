evaluarAsignar = ->
	b1 = (($ '.selected').length != 0)
	b2 = (($ '.tselected').length != 0)
	b3 = (($ '.eqselected').length != 0)
	($ '#asignar').attr "disabled", !(b1 and b2 and b3)

evaluarConfirmaryQuitar = ->
	isEmptyTable = (($ '#asignados tbody').html() is "")
	isAsignSelected = (($ '#asignados tbody').find('.aselected').length == 0)
	$('#confirmar').attr 'disabled', (isEmptyTable)
	$('#quitar').attr 'disabled', (isEmptyTable or isAsignSelected)

isInTable = (e) ->
	$('#asignados tbody').find("##{e}").length != 0

$ ->
	($ '#solicitudes td').click (e)->
		e.preventDefault()
		($ '.selected').removeClass 'selected'
		$(@).parent().addClass 'selected'
		sol = $(@).parent().find('.solid').text()
		$.post 'detallesolicitud',
			solicitud: sol,
			(r) ->
				det = JSON.parse r
				($ '#equipos tbody').html ''
				((d)->
					if not isInTable(d.equipo)
						$.post '/proyecto/api/equipo',
							id: d.equipo,
							(eq) ->
								eq = JSON.parse eq
								console.log eq
								($ '#equipos tbody').append("<tr><td class='cp'>#{d.equipo}</td>" +
									"<td class='denom'>#{eq.denominacion}</td><td class='fab'>#{eq.fabricante}" +
									"</td><td class='problema' style='display: none;'>#{d.problema}</td></tr>")
				)(d) for d in det
				evaluarAsignar()

	($ '#equipos td').live 'click', ->
		row = $(@).parent()
		p = row.find('.problema').html()
		d = row.find('.denom').html()
		cp = row.find('.cp').html()
		sol = ($ '.selected').find('.solid').text()
		problema = "<h2>#{d} [#{cp}]</h2><h4>Solicitud ##{sol}</h4><p>#{p}</p>"
		apprise problema,
			verify: true
			textYes: 'seleccionar'
			textNo: 'cancelar',
			(r) ->
				if r
					($ '.eqselected').removeClass 'eqselected'
				row.addClass 'eqselected'
				evaluarAsignar()

	($ '#tecnicos td').live 'click', ->
		($ '.tselected').removeClass 'tselected'
		$(@).parent().addClass 'tselected'
		evaluarAsignar()

	($ '#asignar').click (e)->
		e.preventDefault()
		sol = ($ '.selected').find('.solid').text()
		eq = ($ '.eqselected').find('.cp').text()
		den = ($ '.eqselected').find('.denom').text()
		tec = ($ '.tselected').find('.tnombre').text()
		row = "<tr id='#{eq}'><td>#{sol}</td><td>#{eq}</td><td>#{den}</td><td>#{tec}</td></tr>"
		($ '#asignados tbody').append row
		($ '.eqselected').remove()
		evaluarAsignar()
		evaluarConfirmaryQuitar()

	($ '#asignados td').live 'click', ->
		($ '.aselected').removeClass 'aselected'
		$(@).parent().addClass 'aselected'
		evaluarConfirmaryQuitar()

	($ '#quitar').click (e) ->
		e.preventDefault()
		($ '.aselected').remove()

	($ '#confirmar').click (e) ->
		e.preventDefault()

