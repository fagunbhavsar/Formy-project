Given("I formy project app link") do
  visit(OpenFormPage)
end

Then("I click on Complete web form link") do
  on(OpenFormPage).open_web_form
end

Then("I enter first name") do
  on(CompleteForm).enter_first_name(@data["firstname"]
end

Then("I enter last name") do
  on(CompleteForm).enter_last_name(@data["lastname"])
end

Then("I enter job title") do
  on(CompleteForm).enter_job_title(@data['title'])
end

Then("I select an option") do
  on(CompleteForm).select_college
end

Then("I select a checkbox") do
  on(CompleteForm).check_gender
end

Then("I select years of experience") do
  on(CompleteForm).select_exp
end

Then("I select date") do
  on(CompleteForm).select_date
end

And("I click on Submit button") do
  on(CompleteForm).click_submit
end

Then("I see success message") do
  v = on(CompleteForm).view_confirmation
  expect(v).to eq(true)
end