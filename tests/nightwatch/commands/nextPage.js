'use strict';

var util = require('util');

exports.command = function(callback) {
  var client = this;

  this.perform(function() {
    client
      .submitForm('form', function() {
        console.log('     * Submit form');
      })
    ;
  });

  if (typeof callback === 'function') {
    callback.call(client);
  }

  return client;
};
