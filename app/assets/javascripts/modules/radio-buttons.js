'use strict';

window.moj.Modules.RadioButtonsModule = {
  init: function() {
    var $buttons = $("label input[type='radio'], label input[type='checkbox']"),
        selectionButtons = new GOVUK.SelectionButtons($buttons);
  }
};
