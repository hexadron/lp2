evaluarAsignar = ->
	b1 = (($ '.selected').length != 0)
	b2 = (($ '.tselected').length != 0)
	b3 = (($ '.eqselected').length != 0)
	($ '#asignar').attr "disabled", !(b1 and b2 and b3)

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
				((d)-> ($ '#equipos tbody').append("<tr><td class='cp'>#{d.equipo.codigoPatrimonial}</td>" + 
						"<td class='denom'>#{d.equipo.denominacion}</td><td class='fab'>#{d.equipo.fabricante}" +
						"</td><td class='problema' style='display: none;'>#{d.problema}</td></tr>"))(d) for d in det
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