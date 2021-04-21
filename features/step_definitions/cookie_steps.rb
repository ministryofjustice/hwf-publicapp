Then("I see the cookie banner is present") do
  expect(checklist_page.cookie).to have_header
  expect(checklist_page.cookie).to have_accept_button
  expect(checklist_page.cookie).to have_reject_button
end

When("I accept the cookies") do
  checklist_page.cookie.accept_button.click
end

When("I reject the cookies") do
  checklist_page.cookie.reject_button.click
end

Then("I see the cookie banner is not present") do
  expect(checklist_page.cookie).to have_no_header
end

And("I click save settings") do
  cookie_page.content.save_cookies.click
  expect(cookie_page).to have_success
end

When("I click on the Cookies link") do
  footer_page.content.cookie_link.click
end

Then("I am on the Cookies page") do
  expect(cookie_page.content).to have_header
end
