'use strict';

module.exports = {
  'Start': function(client) {
    client
      .startService()
      .click('input.button-start', function() {
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
      .nextPage()
    ;
  },

  'Form name': function(client) {
    client
      .ensureCorrectPage('form.new_form_name', '/form-name', {
        'h2': 'Question 9 of 14'
      })
      .nextPage()
    ;
  },

  'NI number': function(client) {
    client
      .ensureCorrectPage('form.new_national_insurance', '/national-insurance', {
        'h2': 'Question 10 of 14'
      })
      .setValue('#national_insurance_number', 'AB123456C')
      .nextPage()
    ;
  },

  'Date of birth': function(client) {
    client
      .ensureCorrectPage('form.new_dob', '/dob', {
        'h2': 'Question 11 of 14'
      })
      .setValue('#dob_date_of_birth', '01/01/1980')
      .nextPage()
    ;
  },

  'Personal detail': function(client) {
    client
      .ensureCorrectPage('form.new_personal_detail', '/personal-detail', {
        'h2': 'Question 12 of 14'
      })
      .setValue('#personal_detail_first_name', 'Test')
      .setValue('#personal_detail_last_name', 'Tester')
      .nextPage()
    ;
  },

  'Address': function(client) {
    client
      .ensureCorrectPage('form.new_applicant_address', '/applicant-address', {
        'h2': 'Question 13 of 14'
      })
      .setValue('#applicant_address_address', '1 Test Street')
      .setValue('#applicant_address_postcode', 'TE37 1NG')
      .nextPage()
    ;
  },

  'Contact': function(client) {
    client
      .ensureCorrectPage('form.new_contact', '/contact', {
        'h2': 'Question 14 of 14'
      })
      .testShowHideCheckbox('contact_email_option', 'email-field-panel')
      .testShowHideCheckbox('contact_phone_option', 'phone-number-panel')
    ;
  },

  'End': function(client) {
    client
      .end()
    ;
  }
};
