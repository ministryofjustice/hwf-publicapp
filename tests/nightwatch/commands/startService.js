'use strict';

var log = require('../modules/log');

exports.command = function(callback) {
  var client = this;

  this.perform(function() {
    log.command('Starting the service...');

    client
      .deleteCookies()
      .init()
      .maximizeWindow()
      .ensureCorrectPage('input.button-start', '', {
        'h1': 'Apply for help with fees'
      })
      .pause(200)
    ;
  });

  if (typeof callback === 'function') {
    callback.call(client);
  }

  return client;
};
