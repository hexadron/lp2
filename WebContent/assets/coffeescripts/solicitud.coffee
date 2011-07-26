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
	
evaluarAgregar = ->
	($ '#agregar').attr("disabled", ($.trim($('#problema').val()) is "" or equipoSel == undefined))
	
evaluarEnviar = ->
	($ '#enviar').attr("disabled", ($.trim($('#solicitudes tbody').html()) is ""))
	
isInTable = (e) ->
	($ '#solicitudes tbody').find("##{e}").attr('id') != undefined
	
detalle = (rowid) ->
	{equipo: rowid, problema: $("##{rowid}").find('.hiddenproblem').text()}

$ ->
	($ '#buscar').click (e) ->
		e.preventDefault()
		equipo = $.trim ($ '#equipo').val()
		if not equipo or isNaN(equipo)
			errorEnDetalle 'Debes colocar un código'
		else if isInTable(equipo)
			errorEnDetalle 'El equipo ya ha sido agregado a la solicitud'
		else
			$.post 'solicitud/buscarequipo',
				equipo: equipo,
				(r) ->
					console.log r
					if ($.trim r) is 'notfound'
						errorEnDetalle 'Equipo no encontrado'
					else
						eq = JSON.parse(r)
						if eq.enproceso
							errorEnDetalle 'El equipo ya se encuentra en una solicitud de reparación'
						else
							showEquipo eq
						evaluarAgregar()
		
	($ '#problema').keyup -> evaluarAgregar()
		
	($ '#agregar').click (e) ->
		e.preventDefault()
		row = "<tr id='#{equipoSel.codigoPatrimonial}'><td id='#{equipoSel.codigoPatrimonial}'>#{equipoSel.codigoPatrimonial}</td>" +
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
