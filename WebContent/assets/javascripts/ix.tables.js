(function() {
  window.TableView = Backbone.View.extend({
    events: {
      'click th': 'sort'
    },
    sort: function(e) {
      var rows, sort, tab, target, _ref;
      target = (_ref = e.srcElement) != null ? _ref : e.target;
      tab = $(target);
      rows = this.$('tbody tr');
      sort = 'asc';
      rows = _(rows).sortBy(function(row) {
        var a, text;
        text = row.children[target.cellIndex].innerText;
        if (tab.hasClass('date')) {
          a = _(text).words('/');
          return new Date(a[2], a[1], a[0]).getTime();
        } else if (tab.hasClass('numeric')) {
          return parseInt(text);
        } else {
          return text;
        }
      });
      if (tab.hasClass(sort)) {
        rows.reverse();
        tab.removeClass(sort);
      } else {
        tab.siblings().removeClass(sort);
        tab.addClass(sort);
      }
      return (this.$('tbody')).empty().append(rows);
    }
  });
}).call(this);
