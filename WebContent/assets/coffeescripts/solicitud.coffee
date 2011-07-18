equipoSel = undefined

showNotFound = ->
	equipoSel = undefined
	($ '.desc').html ''
	($ '.desc').append 'Equipo no encontrado'

showEquipo = (r) -> 
	equipoSel = r
	($ '.desc').html ''
	($ '.desc').append "<li><span class='desc_left'>C&oacute;digo Patrimonial</span>" +
        "<span class='desc_right'>#{r.codigoPatrimonial}</span></li><li><span class='desc_left'>" + 
	"Denominaci&oacute;n</span><span class='desc_right'>#{r.denominacion}" +
	"</span></li><li><span class='desc_left'>Fabricante</span>" + 
	"<span class='desc_right'>#{r.fabricante}</span></li><li>" + 
	"<span class='desc_left'>&Aacute;rea a la que pertenece" +
	"</span><span class='desc_right'>#{r.area.descripcion}</span></li>"

showNotCode = ->
	equipoSel = undefined
	($ '.desc').html ''
	($ '.desc').append 'Debes colocar un código'
	
eraseFields = ->
	$(e).val '' for e in ['#equipo', '#problema']
	($ '.desc').html ''
	equipoSel = undefined

eraseAll = ->
	eraseFields()
	($ '#solicitudes tbody').html ''
	($ '#problemadescrito').val ''
	
evaluarAgregar = ->
	($ '#agregar').attr("disabled", ($.trim($('#problema').val()) is "" or equipoSel == undefined))
	
evaluarEnviar = ->
	($ '#enviar').attr("disabled", ($.trim($('#solicitudes tbody').html()) is ""))
	
detalle = (rowid) ->
	pair = {equipo: rowid, problema: $("##{rowid}").find('.hiddenproblem').text()}

$ -> 
	($ '#buscar').click (e) ->
		e.preventDefault()
		equipo = $.trim ($ '#equipo').val()
		if not equipo
			showNotCode()
		else
			$.post 'solicitud/buscarequipo',
				equipo: equipo,
				(r) ->
					if ($.trim r) is 'notfound'
						showNotFound()
					else 
						showEquipo JSON.parse r
					evaluarAgregar()
		
	($ '#problema').keyup -> evaluarAgregar()
		
	($ '#agregar').click (e) ->
		e.preventDefault()
		row = "<tr id='#{equipoSel.id}'><td>#{equipoSel.codigoPatrimonial}</td>" +
				"<td>#{equipoSel.denominacion}</td>" +
				"<td>#{equipoSel.fabricante}</td>" + 
				"<td class='hiddenproblem' style='display: none;'>#{$.trim ($ '#problema').val()}</td></tr>"
		($ '#solicitudes tbody').append row
		eraseFields()
		evaluarAgregar()
		evaluarEnviar()
	
	($ '#solicitudes td').live 'click', ->
		$(@).parent().removeClass 'unselected'
		$('.selected').removeClass 'selected'
		$(@).parent().addClass 'selected'
		($ '#problemadescrito').val $(@).parent().find('.hiddenproblem').text()
		
	($ '#problemadescrito').keyup -> 
		$('.selected').find('.hiddenproblem').text $(@).val()
		
	($ '#quitar').click (e) ->
		e.preventDefault()
		($ '.selected').remove()
		($ '#problemadescrito').val ""
		evaluarEnviar()
		
	($ '#enviar').click (e) ->
		e.preventDefault()
		t = $ '#solicitudes tbody'
		sol = []
		sol.push(detalle(row.id)) for row in t.children()
		$.post 'solicitud/guardar',
			solicitud: JSON.stringify(sol),
			(r) ->
				apprise "Solicitud de Mantenimiento registrada con el número #{r}"
	
	($ ".aButtons button[value='ok']").live 'click', ->
		window.location = ''