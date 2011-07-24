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
<<<<<<< HEAD
	
	
=======

>>>>>>> 58d06fbe9922d38b615727d234e602c671302efd
isInTable = (e) ->
	$('#asignados tbody').find("##{e}").length != 0

$ ->
	($ '#solicitudes td').click (e)->
		e.preventDefault()
		($ '.selected').removeClass 'selected'
		$(@).parent().addClass 'selected'
		sol = $(@).parent().find('.solid').text()
<<<<<<< HEAD
		$.post 'detallesolicitud',
			solicitud: sol,
			(r) ->
				det = JSON.parse r
				($ '#equipos tbody').html ''
				((d)->
					if not isInTable(d.equipo.codigoPatrimonial)
						($ '#equipos tbody').append("<tr><td class='cp'>#{d.equipo.codigoPatrimonial}</td>" +
							"<td class='denom'>#{d.equipo.denominacion}</td><td class='fab'>#{d.equipo.fabricante}" +
							"</td><td class='problema' style='display: none;'>#{d.problema}</td></tr>")
							)(d) for d in det
=======
		$.post 'equipospordetalle',
			solicitud: sol,
			(equipos) ->
				($ '#equipos tbody').html ''
				for equipo in JSON.parse equipos
					[eq, problema] = JSON.parse equipo
					($ '#equipos tbody').append("<tr><td class='cp'>#{eq.codigoPatrimonial}</td>" +
						"<td class='denom'>#{eq.denominacion}</td><td class='fab'>#{eq.fabricante}" +
						"</td><td class='problema' style='display: none;'>#{problema}</td></tr>")
>>>>>>> 58d06fbe9922d38b615727d234e602c671302efd
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
		tid = ($ '.tselected').find('.tid').text()
		row = "<tr id='#{eq}'><td class='sol'>#{sol}</td><td class='eq'>#{eq}</td>" +
<<<<<<< HEAD
			 "<td>#{den}</td><td class='tec'>#{tec}</td><td class='tid' style='display: none;'>#{tid}</tr>"($ '#asignados tbody').append row
=======
			 "<td>#{den}</td><td class='tec'>#{tec}</td><td class='tid' style='display: none;'>#{tid}</tr>"
		($ '#asignados tbody').append row
>>>>>>> 58d06fbe9922d38b615727d234e602c671302efd
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
<<<<<<< HEAD
	
=======

>>>>>>> 58d06fbe9922d38b615727d234e602c671302efd
	($ '#confirmar').click (e) ->
		e.preventDefault()
		arreglo = []
		for arow in ($ '#asignados tbody').children()
			if $(arow).find('.sol').text() != ""
				sol = $(arow).find('.sol').text()
				eq = $(arow).find('.eq').text()
				tec = $(arow).find('.tid').text()
				o = { solicitud: sol, equipo: eq, tecnico: tec }
				arreglo.push o
		
		$.post 'realizarAsignacion',
			reparaciones: JSON.stringify arreglo,
			(r) ->
<<<<<<< HEAD
				alert "Yeah!"
=======
				alert "Yeah!"
>>>>>>> 58d06fbe9922d38b615727d234e602c671302efd
