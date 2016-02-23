'use strict';

window.moj.Modules.ShowHide = {
  init: function() {
    var self = this,
        $elements = $(".block-label input[type='radio'], .block-label input[type='checkbox']");

    if ($elements.length) {
      self.initCheckElements($elements);
      self.bindElementEvents($elements);
    }
  },

  initCheckElements: function($elements) {
    var self = this;

    $elements.each(function(n, element) {
      var $element = $(element);

      if ($element.is(':checked')) {
        self.toggleElementContent($element);
      }
    });
  },

  bindElementEvents: function($elements) {
    var self = this;

    $elements.on('click', function(e) {
      self.toggleElementContent($(e.target));
    });
  },

  toggleElementContent: function($element) {
    var self = this,
        target = $element.closest('label').data('target'),
        show = $element.is(':checked');

    if($element.attr('type') === 'radio') {
      var radioGroup = $element.attr('name');

      // hide any conditional content attached to radios in this group
      $element.closest('form').find('.block-label input[name="' + radioGroup + '"]').each(function(n, groupMember) {
          var $groupMember = $(groupMember),
              memberTarget = $groupMember.closest('label').data('target'),
              $memberTarget = $('#' + memberTarget);

          $memberTarget.hide();
          $memberTarget.attr('aria-hidden', 'true');
          $groupMember.attr('aria-expanded', 'false');
      });
    }

    if(target) {
      self.showContent($element, target, show);
    }
  },

  showContent: function($element, target, show) {
    var $targetElement = $('#' + target);

    $element.attr('aria-expanded', !!show);
    $targetElement.attr('aria-hidden', !show);
    if(show) {
      $targetElement.show();
    } else {
      $targetElement.hide();
    }
  }
};
