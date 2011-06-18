window.TableView = Backbone.View.extend
  events:
    'click th': 'sort'
  
  sort: (e) ->
    target = e.srcElement ? e.target
    tab = $ target
    rows = @$ 'tbody tr'
    sort = 'asc'
    rows = _(rows).sortBy (row) ->
      text = row.children[target.cellIndex].innerText
      if tab.hasClass 'date'
        a = _(text).words '/'
        new Date(a[2], a[1], a[0]).getTime()
      else if tab.hasClass 'numeric'
        parseInt text
      else
        text
    if tab.hasClass sort
      rows.reverse()
      tab.removeClass sort
    else
      tab.siblings().removeClass sort
      tab.addClass sort
    (@$ 'tbody').empty().append rows
