window.jQuery.fn.unselectable = ->
  @bind (if $.support.selectstart then 'selectstart' else 'mousedown'),
    (e) -> e.preventDefault()

window.Switch = Backbone.View.extend
  initialize: (options) ->
    @el.unselectable()

  events:
    'click': 'slide'

  slide: (evt) ->
    evt.preventDefault()
    btn = '.switch_button'
    txt = '.switch_text'
    if @el.hasClass 'off'
      @$(btn).animate
        'right': '-=4.05em'
        150
        => @el.children(txt).text('Si')
    else
      @$(btn).animate
        'right': '+2.75em'
        150
        => @el.children(txt).text('No')
    @el.toggleClass 'off'
