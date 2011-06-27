$ ->
###
  ($ '#login').click (e) ->
    e.preventDefault()
    
    $.post 'login/procesar',
      nombre: ($ '#nombre').val()
      password: ($ '#pwd').val()
      (r) -> 
        console.log r
        if r != "error" and r != ""
          alert "continuar"
          ($ '#login').submit()
        else
          ($ '#error').html r
          alert "error"
