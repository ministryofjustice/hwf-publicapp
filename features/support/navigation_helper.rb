def to_address_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.valid_dob
  personal_details_page.submit_full_name
end

def to_benefit_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
  savings_investment_page.low_amount_checked
end

def to_claim_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  probate_page.submit_probate_no
end

def to_confirmation_done_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_no
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.medium_amount_checked
  savings_investment_extra_page.submit_yes
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_no
  income_kind_page.submit_no_income
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.valid_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
  contact_page.valid_email
  summary_page.submit_application
  continue
end

def to_confirmation_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_no
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.medium_amount_checked
  savings_investment_extra_page.submit_yes
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_no
  income_kind_page.submit_no_income
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.valid_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
  contact_page.valid_email
  summary_page.submit_application
end

def to_contact_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.valid_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
end

def to_dependent_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_no
end

def to_dob_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  probate_page.submit_probate_no
  claim_page.submit_claim_no
end

def to_fee_page
  to_form_name
  form_name_page.submit_valid_form_number
end

def to_form_name
  checklist_page.load_page
  checklist_continue
end

def to_home_office_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_no
end

def to_income_amount_single
  to_income_range_page_single
  income_range_page.submit_between
end

def to_income_amount_married
  to_income_range_page_married
  income_range_page.submit_between
end

def to_income_kind_single
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_3
end

def to_income_kind_married
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_3
end

def to_income_range_page_single
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_no
  income_kind_page.submit_single_income_wages_tax_credit
end

def to_income_range_page_married
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_no
  income_kind_page.submit_married_income_wages_tax_credit
end

def to_income_range_page_single_dependent_3
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_3
  income_kind_page.submit_single_income_wages_tax_credit
end

def to_income_range_page_married_dependent_3
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.high_amount_checked
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_3
  income_kind_page.submit_married_income_wages_tax_credit
end

def to_marital_status
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
end

def to_national_insurance_presence_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
end

def to_national_insurance_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
end

def to_personal_details_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.valid_dob
end

def to_probate_page
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
end

def to_single_savings_extra
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
  savings_investment_page.medium_amount_checked
end

def to_married_savings_extra
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.medium_amount_checked
end

def to_married_savings
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
end

def to_single_savings
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_yes
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_single
end

def to_summary_page_probate_enabled
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_no
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.medium_amount_checked
  savings_investment_extra_page.submit_yes
  benefit_page.submit_benefit_no
  dependent_page.submit_dependent_no
  income_kind_page.submit_no_income
  probate_page.submit_probate_no
  claim_page.submit_claim_no
  dob_page.static_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
  contact_page.valid_email
end

def to_summary_page_probate_disabled
  to_form_name
  form_name_page.submit_valid_form_number
  fee_page.submit_fee_no
  national_insurance_presence_page.submit_yes
  national_insurance_page.submit_valid_ni
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  benefit_page.submit_benefit_yes
  claim_page.submit_claim_no
  dob_page.static_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
  contact_page.valid_email
end

def to_summary_page_with_ho_number
  home_office_page.submit_valid_home_office_number
  marital_status_page.submit_married
  savings_investment_page.low_amount_checked
  dependent_page.submit_dependent_no
  income_kind_page.submit_no_income
  probate_page.submit_probate_no
  dob_page.static_dob
  personal_details_page.submit_full_name
  address_page.submit_full_address
  contact_page.valid_email
end
