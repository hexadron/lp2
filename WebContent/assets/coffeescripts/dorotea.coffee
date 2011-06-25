$ ->
###
  ($ 'input[type=submit]').click (e) ->
    e.preventDefault()
    
    $.post 'login/procesar',
      nombre: "luna"
      password: "lunera",
      (r) -> console.log r