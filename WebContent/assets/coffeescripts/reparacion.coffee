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
        elem = "input[type='text']:not(.aTextbox), #trabajo, #recomendaciones"
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
                    confirm: true
                    textOk: 'Aceptar'
                    textCancel: 'Aceptar',
                    (b) ->
                        window.location = ''

    $('#terceros').click (e) ->
        if $("#terceros").attr("checked") is "checked"
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
                    $("#terceros").attr "checked", b?
        evaluarElementos()

    $('#guardar').click (e) ->
        e.preventDefault()
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
            trabajo = $('#trabajo').val()
            costo = $('#costo').val()
            garantia = $('#garantia').val()
            recomendaciones = $('#recomendaciones').val()
            $.post 'registrarReparacion',
                reparacion: reparacion
                trabajo: trabajo
                costo: costo
                garantia: garantia
                recomendaciones: recomendaciones,
                (rep) ->
                    apprise 'Reparaci&oacute;n guardada',
                        confirm: true
                        textOk: 'Aceptar'
                        textCancel: 'Aceptar',
                        (b) ->
                            window.location = ''