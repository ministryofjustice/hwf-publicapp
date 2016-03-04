'use strict';

window.moj.Modules.IncomeTable = {
  $tables: $('table.income'),
  init: function() {
    var self = this;

    if (self.$tables.length) {
      self.getTotalTables();
      self.bindEvents();
    }
  },

  bindEvents: function() {
    var self = this;

    self.$tables.find('input.form-control').on('keyup', function() {
      self.getTotalTables();
    }).on('blur', function(e) {
      self.formatValue($(e.target));
    });
  },

  formatValue: function($input) {
    var val = parseFloat($input.val());
    $input.val(val.toFixed(2));
  },

  getTotalTables: function() {
    var self = this;

    self.$tables.each(function(n, table) {
      self.getTotals(table);
    });
  },

  getTotals: function(table) {
    var self = this,
        $table = $(table),
        $headers = $table.find('thead tr > *'),
        columnsToTotal = [],
        totals = [];

    $headers.each(function(n, header) {
      if($(header).hasClass('js-total')) {
        columnsToTotal[columnsToTotal.length] = $headers.index(header);
      }
    });

    columnsToTotal.forEach(function(i) {
      var columnTotal = 0;

      $table.find('tbody tr').each(function(n, row) {
        var $input = $(row).find('> *').eq(i).find('input.form-control'),
            val = parseFloat($input.val());

        if('' !== val && !Number.isNaN(val)) {
          columnTotal += val;
        }
      });
      totals[totals.length] = columnTotal.toFixed(2);
    });
    self.writeTotals($table, columnsToTotal, totals);
  },

  writeTotals: function($table, columnsToTotal, totals) {
    var rowLength = $table.find('thead tr > *').length,
        cells,
        $tfoot,
        str,
        x;

    if(!$table.find('tfoot').length) {
      $table.append('<tfoot><tr><th>Total</th></tr></tfoot>');
      $tfoot = $table.find('tfoot tr');
      for(cells = 1; cells < rowLength; cells++) {
        $tfoot.append('<td></td>');
      }
    }
    $tfoot = $table.find('tfoot tr');
    for(cells = 1; cells < rowLength; cells++) {
      for(x = 0; x < columnsToTotal.length; x++) {
        if(columnsToTotal[x] === cells) {
          $tfoot.find('> *').eq(cells).html('<span class="currency">£</span>' + totals[x] + '<span class="frequency">a month</span>');
        }
      }
    }
  }
};
