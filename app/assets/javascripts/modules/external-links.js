'use strict';

window.moj.Modules.ExternalLinks = {
  init: function() {
    $('a[rel="external"]').attr('target', '_blank');
  }
};
