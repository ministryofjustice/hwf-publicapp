'use strict';

var util = require('util');

exports.command = function(checkbox, showElemId, callback) {
  var client = this;

  this.perform(function() {

    client
      // check checkbox is unchecked to start with
      .element('id', checkbox, function(response) {
        client.elementIdSelected(response.value.ELEMENT, function(result) {
          client.assert.ok(!result.value, util.format('Checkbox #%s is not checked', checkbox));
        });
      })
      // check showElem is hidden to start with
      .assert.hidden(util.format('#%s', showElemId), util.format('  - #%s is hidden', showElemId))
      // check box
      .click(util.format('#%s', checkbox), function() {
        console.log(util.format('     * Checking checkbox "%s" to "%s"'), checkbox);
      })
      // check showElem is revealed
      .assert.visible(util.format('#%s', showElemId), util.format('  - #%s is visible', showElemId))
    ;
  });

  if (typeof callback === 'function') {
    callback.call(client);
  }

  return client;
};
