(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  window.jQuery.fn.unselectable = function() {
    return this.bind(($.support.selectstart ? 'selectstart' : 'mousedown'), function(e) {
      return e.preventDefault();
    });
  };
  window.Switch = Backbone.View.extend({
    initialize: function(options) {
      return this.el.unselectable();
    },
    events: {
      'click': 'slide'
    },
    slide: function(evt) {
      var btn, txt;
      evt.preventDefault();
      btn = '.switch_button';
      txt = '.switch_text';
      if (this.el.hasClass('off')) {
        this.$(btn).animate({
          'right': '-=4.05em'
        }, 150, __bind(function() {
          return this.el.children(txt).text('Si');
        }, this));
      } else {
        this.$(btn).animate({
          'right': '+2.75em'
        }, 150, __bind(function() {
          return this.el.children(txt).text('No');
        }, this));
      }
      return this.el.toggleClass('off');
    }
  });
}).call(this);
