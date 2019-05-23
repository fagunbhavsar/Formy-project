

# Lesson 01 : Automating login page for site admin user

<!--End to end tests works just like a real human** user, so the flow of test mimics a manual tester.-->

<!--**Choose a feature to test :** What happens when a user logs into the system-->

<!--**Various scenarios for testing this feature:** We need to think about what happens when-->

<!--site admin logs in-->

<!--student logs in-->

<!--teacher logs in-->

<!--school admin logs in-->

For this lesson, we choose the **scenario of a site admin logging into the system.**

Lets write down the **steps for testing this test if manually :** 

1. Go to homepage
2. Click on login
3. Enter user/password for site admin
4. Check if site admin link is visible on homepage





**Lets define this scenario in Gherkin format :** 

```yaml
@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar
```

Lets save this file in features directory as **features/users.feature** 

Now lets go to console and run tests with command

 ````bash
rake tags=@admin
 ````

We get the following message on console : 

```ruby
You can implement step definitions for undefined steps with these snippets:

Given(/^I open zinc homepage$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I click on login$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I enter username and password for admin user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see homepage with site admin link in top bar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

```

What happened is cucumber tried to run the gherkin file but could not find the code that tells it how to run it. So cucumber suggested us to fill in the code.

Each of the block of code here is called a step definition. These step definition tell cucumber how to run the tests corresponding to a gherking file.

Lets copy this and paste it into a file in **features/steps/users.rb**

##### Opening a URL

Lets look at the first block of code, 

```ruby
Given(/^I open zinc homepage$/) do
  # open the browser window
end
```



Using the [cheatsheet here](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet) lets open the staging URL in this step: 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto("http://staging.zinclearninglabs.com/")
end

Then(/^I click on login$/) do
  sleep 5
end
```

In above code, we ask the cucumber to sleep for 5 seconds in the next step. 

Now lets run the tests again to see what happens

```bash
rake tags=@admin
```

You should see the homepage opened up for 5 seconds.  

Next we need to click on the login link in the page, lets again quickly [refer the cheatsheet :](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet) 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto("http://staging.zinclearninglabs.com/")
end

Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  sleep 5
end
```



Now running the tests again, you should be able to see the homepage openeing up, login button being clicked and then login form showing up for 5 seconds.

Next we need to enter the username and password for an admin user, again lets [refer the cheatsheet :](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet) 

Following snippet will find an element on page with id "user_email" and set the value .

```ruby
  @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
```

Similarity we need to enter a password and then click on the login button as follows: 

```ruby
And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
  @browser.text_field(:id => 'user_password').set('password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  sleep 5
end
```

On running the test again you will see the webdriver opening the homepage, clicking on login, entering username and password and clicking on login button to end up on the homepage with logged in user.

Now, lets verify if the logged in homepage has a site admin link : 

```ruby
Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end
```

Lets run our test again. We should see following output : 

```bash
1 scenario (1 passed)
4 steps (4 passed)
0m12.782s
done

```

Now go ahead and add another trivial test for a student user.

Once you are done,  your Gherkin file may look like this : 

```ruby
@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar
    And   I can open admin section

  @student
  Scenario: Login as zinc student
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for student user
    Then  I see homepage without admin link in top bar
```



And, your **features/steps/users.rb** might look like : 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto "http://staging.zinclearninglabs.com/"
end

Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
  @browser.text_field(:id => 'user_password').set('password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end

And(/^I can open admin section$/) do
  @browser.element(:text => '(Site Admin)').click
  @browser.element(:class => 'administration_namespace').visible?
end

And(/^I enter username and password for student user$/) do
  @browser.text_field(:id => 'user_email').set('86.rohit+1@gmail.com')
  @browser.text_field(:id => 'user_password').set('password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage without admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.exists?).to eq(false)
end
```

Run the tests together using command 

```bash
rake tags=@admin,@student
```

