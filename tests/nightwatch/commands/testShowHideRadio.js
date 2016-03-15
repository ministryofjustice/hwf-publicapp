'use strict';

var util = require('util');

exports.command = function(group, values, showElemId, callback) {
  var client = this;

  this.perform(function() {
    function clickOption(field, value) {
      var el = util.format('input#%s_%s', field, value);
      client.click(el, function() {
        console.log('     * Setting "' + field + '"' + ' to "' + value + '"');
      });
    }

    // check showElem is hidden to start with
    client.assert.hidden(util.format('#%s', showElemId), util.format('  - #%s is hidden', showElemId));

    // check showElem is revealed when first value clicked
    clickOption(group, values[0]);
    client.waitForElementVisible(util.format('#%s', showElemId), util.format('  - #%s is visible', showElemId));

    // check showElem is hidden when second value clicked
    clickOption(group, values[1]);
    client.assert.hidden(util.format('#%s', showElemId), util.format('  - #%s is hidden', showElemId));
  });

  if (typeof callback === 'function') {
    callback.call(client);
  }

  return client;
};
