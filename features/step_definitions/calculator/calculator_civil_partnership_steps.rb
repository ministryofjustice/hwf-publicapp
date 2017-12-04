And(/^I answer the civil partnership status question$/) do
  calculator_civil_partnership_page.civil_partnership_status.set(user.civil_partnership_status)
  calculator_civil_partnership_page.next
end