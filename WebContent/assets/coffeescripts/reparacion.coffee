$ ->
    $("#reparaciones td").click ->
        # este problema se carga usando ajax enviando el id de la solicitud y el id del equipo. Éstos se obtienen del atributo id del elemento seleccionado.
        row = $(@).parent()
        reparacion = row.children('.id').text()
        $.post 'getDatosReparacion',
            reparacion: reparacion,
            (rep) ->
                rep = JSON.parse rep
                equipo = rep.equipo
                problema = "<div class='contentapprise'><h2>#{equipo.denominacion}" +
                "[#{equipo.codigoPatrimonial}]</h2>" +
                "<h4>Reparaci&oacute;n #{rep.id}</h4>" +
                "<h3>Diagn&oacute;stico</h3>" +
                "<p>#{rep.diagnostico}.</p></div>"
                apprise problema, 
                    verify: true
                    textYes: 'Seleccionar'
                    textNo: 'Cancelar'
                    (r) ->
                        if r
                            ($ '.eqselected').removeClass 'eqselected'
                            row.addClass 'eqselected'
                            evaluarBaja()
    			
    evaluarElementos = ->
        checked = $("#terceros").attr("checked")
        elem = "input[type='text'], #trabajo, #recomendaciones"
        $(elem).attr "disabled", checked?

    evaluarBaja = ->
        b = ($ ".eqselected").length is 0
        ($ '#dardebaja').attr 'disabled', b

    $('#dardebaja').click (e) ->
        e.preventDefault()
        reparacion = ($ '.eqselected .repid').text()
        $.post 'registrarBaja',
            reparacion: reparacion,
            (rep) ->
                apprise 'Equipo dado de baja',
                    textOk: 'Aceptar'

    $('#terceros').click (e) ->
        if $("#terceros").attr("checked") is "checked"
            e.preventDefault()
            elements =
                "<div class='contentapprise'><h3>Sustentaci&oacute;n de Solicitar Terceros</h3>" +
                "<textarea id='susterceros'></textarea></div>"
            apprise elements,
                verify: true
                textYes: 'Aceptar'
                textNo: 'Cancelar',
                (b) ->
                    $("#terceros").attr "checked", b?
                    evaluarElementos()