TableView = Backbone.View.extend
  events: 'click th': 'sort'
  sort: (e) ->
    target = e.srcElement ? e.target
    tab = $ target
    rows = @$ 'tbody tr'
    sortClass = 'asc'
    rows = _(rows).sortBy (row) ->
      text = row.children[target.cellIndex].innerText
      if tab.hasClass 'date'
        a = _(text).words '/'
        new Date(a[2], a[1], a[0]).getTime()
      else if tab.hasClass 'numeric'
        parseInt(text)
      else
        text
    if tab.hasClass(sortClass)
      rows.reverse()
      tab.removeClass(sortClass)
    else
      tab.siblings().removeClass(sortClass)
      tab.addClass(sortClass)
    @$('tbody').empty().append(rows)
