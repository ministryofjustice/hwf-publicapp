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
      .nextPage()
    ;
  },

  'Refund': function(client) {
    client
      .ensureCorrectPage('form.new_fee', '/fee', {
        'h2': 'Question 6 of 14'
      })
      .testShowHideRadio('fee_paid', ['true', 'false'], 'date-fee-paid-panel')
      .radioSelect('fee_paid', 'false')
      .nextPage()
    ;
  },

  'Probate': function(client) {
    client
      .ensureCorrectPage('form.new_probate', '/probate', {
        'h2': 'Question 7 of 14'
      })
      .testShowHideRadio('probate_kase', ['true', 'false'], 'probate-details-panel')
      .radioSelect('probate_kase', 'false')
      .nextPage()
    ;
  },

  'Claim': function(client) {
    client
      .ensureCorrectPage('form.new_claim', '/claim', {
        'h2': 'Question 8 of 14'
      })
      .testShowHideRadio('claim_number', ['true', 'false'], 'claim-identifier-panel')
      .radioSelect('claim_number', 'false')
    ;
  },

  'End': function(client) {
    client
      .end()
    ;
  }
};
