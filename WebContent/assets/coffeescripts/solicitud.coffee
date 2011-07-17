equipoSel = undefined

showNotFound = ->
	equipoSel = undefined
	($ '.desc').html '' 
	($ '.desc').append 'Equipo no encontrado'

showEquipo = (r) -> 
	console.log r
	equipoSel = r
	($ '.desc').html ''
	($ '.desc').append "<li><span class='desc_left'>C&oacute;digo Patrimonial</span>" +
        "<span class='desc_right'>#{r.codigoPatrimonial}</span></li><li><span class='desc_left'>" + 
	"Denominaci&oacute;n</span><span class='desc_right'>#{r.denominacion}" +
	"</span></li><li><span class='desc_left'>Fabricante</span>" + 
	"<span class='desc_right'>#{r.fabricante}</span></li><li>" + 
	"<span class='desc_left'>&Aacute;rea a la que pertenece" +
	"</span><span class='desc_right'>#{r.area.descripcion}</span></li>"

showNotNumber = ->
	equipoSel = undefined
	($ '.desc').html ''
	($ '.desc').append 'Debes colocar un número'
	
eraseFields = ->
	$(e).val '' for e in ['#equipo', '#problema']
	
evaluarBoton = ->
	($ '#agregar').attr("disabled", ($.trim($('#problema').val()) is "" or equipoSel == undefined))

$ -> 
	($ '#buscar').click (e) ->
		e.preventDefault()
		equipo = $.trim ($ '#equipo').val()
		if not equipo
			showNotNumber()
		else if isNaN equipo
			showNotNumber()
		else
			$.post 'solicitud/buscarequipo',
				equipo: equipo,
				(r) ->
					if ($.trim r) is 'notfound'
						showNotFound()
					else 
						showEquipo JSON.parse r
					evaluarBoton()
		
	($ '#problema').keyup -> evaluarBoton()
		
	($ '#agregar').click (e) ->
		e.preventDefault()
		row = "<tr id='#{equipoSel.id}'><td>#{equipoSel.codigoPatrimonial}</td>" +
				"<td>#{equipoSel.denominacion}</td>" +
				"<td>#{equipoSel.fabricante}</td>" + 
				"<td class='hiddenproblem' style='display: none;'>#{$.trim ($ '#problema').val()}</td></tr>"
		($ '#solicitudes tbody').append row
		eraseFields()
		
	
	($ '#solicitudes tr').click ->
		console.log "AAAA"
		
