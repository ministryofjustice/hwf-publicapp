'use strict';

window.moj.Modules.FormName = {
  $identifier: $('#form_name_identifier'),
  $unknown: $('#form_name_unknown'),
  $probate: $("#form_name_probate"),
  $continue: $("input.button"),

  init: function () {
    var self = this;

    if (self.$identifier.length && self.$unknown.length) {
      self.bindEvents();
    }
  },

  bindEvents: function() {
    var self = this;

    self.$identifier.on('keyup', function() {
      self.identifierKeyUp();
    });

    self.$probate.on('click', function() {
      self.probateClick();
    })

    self.$unknown.on('click', function() {
      self.unknownClick();
    });
  },

  identifierKeyUp: function() {
    var self = this;

    if (self.$identifier.val().length > 0 && self.$unknown.is(':checked')) {
      self.$unknown.attr('checked', false).closest('label').removeClass('selected');
    }
  },

  probateClick: function() {
    var self = this;
    var is_checked = self.$probate.is(':checked');

    self.$continue.attr("disabled", is_checked);
  },

  unknownClick: function() {
    var self = this;

    if (self.$identifier.val().length > 0) {
      self.$identifier.val('');
    }
  }
};
