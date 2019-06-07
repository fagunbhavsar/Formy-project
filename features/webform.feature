
@webform @functional

  Feature: Fill the web form with given details

  @formdetails
  Scenario: Fill the web form with given details
    Given I formy project app link
    Then I click on Complete web form link
    Then I enter first name as "Fagun"
    Then I enter last name as "Bhavsar"
    Then I enter job title as "QA analyst"
    Then I select an option as "College"
    Then I select a checkbox as "Male"
    Then I select years of experience as "10+"
    Then I select date as "06/07/2019"
    And  I click on Submit button
    Then I see success message as "The form was successfully submitted!"


