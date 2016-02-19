'use strict';

window.moj.Modules.ShowHide = {
  init: function() {
    var toggleContent = new ShowHideContent();

    toggleContent.showHideRadioToggledContent();
    toggleContent.showHideCheckboxToggledContent();
  }
};
