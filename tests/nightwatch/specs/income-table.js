'use strict';

module.exports = {
  'Start': function(client) {
    client
      .startService()
      .click('.button-start', function() {
        console.log('     * Click start button');
      })
    ;
  },

  'Marital status': function(client) {
    client
      .ensureCorrectPage('form.new_marital_status', '/marital-status', {
        'h2': 'Question 1 of 14'
      })
      .radioSelect('marital_status_married', 'true')
      .nextPage()
    ;
  },

  'Savings and investments': function(client) {
    client
      .ensureCorrectPage('form.new_savings_and_investment', '/savings-and-investment', {
        'h2': 'Question 2 of 14'
      })
      .radioSelect('savings_and_investment_less_than_limit', 'false')
      .nextPage()
    ;
  },

  'Benefits': function(client) {
    client
      .ensureCorrectPage('form.new_benefit', '/benefit', {
        'h2': 'Question 3 of 14'
      })
      .radioSelect('benefit_on_benefits', 'false')
      .nextPage()
    ;
  },

  'Children': function(client) {
    client
      .ensureCorrectPage('form.new_dependent', '/dependent', {
        'h2': 'Question 4 of 14'
      })
      .testShowHideRadio('dependent_children', ['true', 'false'], 'dependent-children_number-panel')
      .radioSelect('dependent_children', 'false')
      .nextPage()
    ;
  },

  'Income': function(client) {
    client
      .ensureCorrectPage('form.new_income', '/income', {
        'h2': 'Question 5 of 14'
      })
    ;
  },

  'Test income table': function(client) {
    client
      // check totals are visible and are 0.00
      .assert.visible('table.income tfoot')
      .assert.containsText('table.income tfoot td:nth-child(2)', '£0.00a month')
      .assert.containsText('table.income tfoot td:nth-child(3)', '£0.00a month')
      // click into first value input
      .click('table.income tbody tr:nth-child(1) td:nth-child(2) input')
      // check that typing numbers updates the totals
      .keys('123')
      .assert.containsText('table.income tfoot td:nth-child(2)', '123.00')
      .assert.containsText('table.income tfoot td:nth-child(3)', '0.00')
      .keys([client.Keys.TAB, '4.56'])
      .assert.containsText('table.income tfoot td:nth-child(2)', '123.00')
      .assert.containsText('table.income tfoot td:nth-child(3)', '4.56')
      // check that a value in the next row is totalled up
      .keys([client.Keys.TAB, '78.90'])
      .assert.containsText('table.income tfoot td:nth-child(2)', '201.90')
      .assert.containsText('table.income tfoot td:nth-child(3)', '4.56')
      // try a few different entries in the second column
      .keys([client.Keys.TAB, '000000.9'])
      .assert.containsText('table.income tfoot td:nth-child(3)', '5.46')
      .keys([client.Keys.TAB, client.Keys.TAB, '1.23456789'])
      .assert.containsText('table.income tfoot td:nth-child(3)', '6.69')
      .keys([client.Keys.TAB, client.Keys.TAB, '10'])
      .assert.containsText('table.income tfoot td:nth-child(3)', '16.69')
      .keys(client.Keys.BACK_SPACE)
      .assert.containsText('table.income tfoot td:nth-child(3)', '7.69')
      .keys([client.Keys.TAB, client.Keys.TAB, 'abcdefg'])
      .assert.containsText('table.income tfoot td:nth-child(3)', '7.69')
    ;
  },

  'End': function(client) {
    client
      .end()
    ;
  }
};
