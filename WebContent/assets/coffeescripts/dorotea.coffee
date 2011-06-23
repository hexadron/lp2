$ ->
  ($ 'input[type=submit]').click ->
    $.post "login/procesar", ->
        console.log "hola"
    false
