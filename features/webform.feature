@webform @functional

  Feature: Fill the web form with given details

  @formdetails
  Scenario: Fill the web form with given details
    Given I formy project app link
    Then I click on Complete web form link
    Then I enter first name as "Fagun"
    Then I enter last name as "Bhavsar"
    Then I enter job title as "QA analyst"
    Then I select an option
    Then I select a checkbox
    Then I select years of experience
    Then I select date
    And  I click on Submit button
    Then I see success message


