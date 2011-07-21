equipoSel = undefined

errorEnDetalle = (msg) ->
	equipoSel = undefined
	($ '.desc').html msg

showEquipo = (e) ->
	equipoSel = e
	($ '.desc').html ''
	($ '.desc').append "<li><span class='desc_left'>C&oacute;digo Patrimonial</span>" +
        "<span class='desc_right'>#{e.codigoPatrimonial}</span></li><li><span class='desc_left'>" +
	"Denominaci&oacute;n</span><span class='desc_right'>#{e.denominacion}" +
	"</span></li><li><span class='desc_left'>Fabricante</span>" +
	"<span class='desc_right'>#{e.fabricante}</span></li><li>" +
	"<span class='desc_left'>&Aacute;rea a la que pertenece" +
	"</span><span class='desc_right'>#{e.area.descripcion}</span></li>"
	
eraseFields = ->
	$(e).val '' for e in ['#equipo', '#problema']
	($ '.desc').html ''
	equipoSel = undefined

eraseAll = ->
	eraseFields()
	($ '#solicitudes tbody').html ''
	($ '#problemadescrito').val ''

detalle = (rowid) ->
	{equipo: rowid, problema: $("##{rowid}").find('.hiddenproblem').text()}

$ ->
	($ '#buscar').click (e) ->
		e.preventDefault()
		equipo = $.trim ($ '#equipo').val()
		if not equipo
			errorEnDetalle 'Debes colocar un código'
		else
			$.post 'solicitud/buscarequipo',
				equipo: equipo,
				(r) ->
					if ($.trim r) is 'notfound'
						errorEnDetalle 'Equipo no encontrado'
					else
						eq = JSON.parse(r)
						showEquipo eq

  ($ '.buscar_eliminar').click (e) ->
		e.preventDefault()
		equipo = $.trim ($ '#equipo').val()
		if not equipo
			errorEnDetalle 'Debes colocar un código'
		else
			$.post '../solicitud/buscarequipo',
				equipo: equipo,
				(r) ->
					if ($.trim r) is 'notfound'
						errorEnDetalle 'Equipo no encontrado'
					else
						eq = JSON.parse(r)
						showEquipo eq
