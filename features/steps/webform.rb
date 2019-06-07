Given("I formy project app link") do
  visit(OpenFormPage)
end

Then("I click on Complete web form link") do
  on(OpenFormPage).open_web_form
end

Then("I enter first name as {string}") do |string|
  on(CompleteForm).enter_first_name
end

Then("I enter last name as {string}") do |string|
  on(CompleteForm).enter_last_name
end

Then("I enter job title as {string}") do |string|
  on(CompleteForm).enter_job_title
end

Then("I select an option as {string}") do |string|
  on(CompleteForm).select_college
end

Then("I select a checkbox as {string}") do |string|
  on(CompleteForm).check_gender
end

Then("I select years of experience as {string}") do |string|
  on(CompleteForm).select_exp
end

Then("I select date as {string}") do |string|
  on(CompleteForm).select_date
end

And("I click on Submit button") do
  on(CompleteForm).click_submit
end

Then("I see success message as {string}") do |string|
  v = on(CompleteForm).view_confirmation
  expect(v).to eq(true)
end