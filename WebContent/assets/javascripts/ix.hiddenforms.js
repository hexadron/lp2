(function() {
  var HiddenFormView;
  HiddenFormView = Backbone.View.extend({
    events: {
      'click .show-form': 'show',
      'click .hide-form': 'hide'
    },
    show: function(e) {
      e.preventDefault();
      return this.$('form').slideDown('normal', function() {
        return $('.actions').slideUp('normal', function() {
          return $('html').scrollTo('form', 300);
        });
      });
    },
    hide: function(e) {
      e.preventDefault();
      return this.$('form').slideUp('normal', function() {
        return $('.actions').slideDown();
      });
    }
  });
}).call(this);
