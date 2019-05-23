# Contents

1. [Gherkin](#gherkin)
2. [Cucumber](#cucumber)
3. [Webdriver](#webdriver)
4. [Watir](#watir)
5. [Setup](#setup)
6. [Cheatsheet](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet)
7. [Creating simple test](https://github.com/nishants/zinc-test-lessons/blob/master/docs/lessons/01-login-page.md#lesson-01--automating-login-page-for-site-admin-user)
8. [Page Object Pattern](https://github.com/nishants/zinc-test-lessons/blob/master/docs/lessons/02-making-tests-maintainable.md#page-object-pattern)
9. User data with @users
10. Testing a listing page
11. Preparing test data
12. Semaphore Configuration
13. Cross browser Testing
14. Runtime options




# Gherkin

Gherkin is a language like **plain English** used to specify features of a system.

Gherkin serves two purposes — **documentation and automated tests**. 

Gherking allows **creating tests in collboration with non-technical stakeholders** in product (product owners, business team, manual testers).

**Example** : 

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

In Gherkin, each line that isn't blank has to start with a Gherkin *keyword*, followed by any text you like. The main keywords are:

- `Feature`
- `Scenario`
- `Given`, `When`, `Then`, `And`, `But` (Steps)
- `Background`
- `Scenario Outline`
- `Examples`

There are a few extra keywords as well:

- `"""` (Doc Strings)
- `|` (Data Tables)
- `@` (Tags)
- `#` (Comments)



# Cucumber

Cucumber executes the Gherkin files.

It maps each line from the gherkin file to a step written in ruby. This allows us to automate the specification written in gherking language using ruby (or any other language).

Example of above Gherkin step implementation with cucumber : 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto "http://staging.zinclearninglabs.com/"
end


Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('admin@mail.com')
  @browser.text_field(:id => 'user_password').set('admin-password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end
```



# Webdriver

Refer : https://en.wikipedia.org/wiki/Selenium_(software)#Selenium_WebDriver

Selenium WebDriver accepts commands (via a Client API) and sends them to a browser. This is implemented through a browser-specific browser driver, which sends commands to a browser, and retrieves results. Most browser drivers actually launch and access a browser application (such as [Firefox](https://en.wikipedia.org/wiki/Firefox), [Chrome](https://en.wikipedia.org/wiki/Google_Chrome), [Internet Explorer](https://en.wikipedia.org/wiki/Internet_Explorer), or [Microsoft Edge](https://en.wikipedia.org/wiki/Microsoft_Edge))



# Watir 

Refer: http://watir.com/

Watir is a pragrammer friendly ruby interface to Selenium Webdriver API. It provides more readable and concise code for interacting with elements on a webpage, while using Webdriver beneath the surface.



# Setup

- Install chrome webdriver from https://sites.google.com/a/chromium.org/chromedriver/getting-started
- Git clone the repository 
- Open project directory
- Install gems 
- Run with rake command

```bash
git clone https://github.com/nishants/zinc-test-lessons.git
cd zinc-test-lessons
bundle install
rake
```



# Test a Login Page



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

# Page Object Pattern

One of the most common issues faced by teams maintaining end to end tests, is that the tests are hard to maintain against changes in UI.
As testers, its our job to facilitate changes in software, instead of resisting it. To cope with such changes we are going to learn about the page object pattern.

# Page Object Pattern

Page Object Pattern is a design pattern for tests. It suggests that we should group together the code regarding logical components in UI into clasess and objects. Read more about it here : https://martinfowler.com/bliki/PageObject.html.

Next step is to use this pattern in our codebase, so we don't have to change our code at several places when top bar elements/labels change.

So first logical UI component that we can observe is the Homepage, where we have links to sevaral other pages like login.

So lets create a class for Homepage in **lib/pages/home_page.rb** as follows : 

```ruby
class HomePage < Page

end
```



Next, we will put all the code related to Homepage in this file. Lets begin by adding a methods to HomePage class that opens the URL of homepage : 

```ruby
class HomePage < Page

  def visit_page
    @browser.goto("http://staging.zinclearninglabs.com/")
  end

end
```

And, update the **features/steps/users.rb** as 

```ruby
Given(/^I open zinc homepage$/) do
  on(HomePage).visit_page
end

```

Lets run our tests again to make sure everything works fine.

Now, one by one keep moving all the homepage related logic in Homepage, your lib/pages/home_page.rb should looks something like this : 

```ruby
class HomePage < Page

  def visit_page
    @browser.goto("http://staging.zinclearninglabs.com")
  end

  def open_login
    @browser.element(:text => 'Login').click
  end

  def site_admin_link_visible?
    @browser.element(:text => '(Site Admin)').exists?
  end

  def open_site_admin
    @browser.element(:text => '(Site Admin)').click
  end

end
```



And, a login pages that look like : 

```ruby
class LoginPage < Page

  def login_with(username, password)
    @browser.text_field(:id => 'user_email').set(username)
    @browser.text_field(:id => 'user_password').set(password)
    @browser.button(:text => 'Sign in').click
  end
    
end
```



Also, there would be a **SiteAdminPage** page to verify if we have succesfully opened site admin. It may look like :

```ruby
class SiteAdminPage < Page

  def opened?
    @browser.element(:class => 'administration_namespace').exists?
  end

end
```

Now, our url may change depending upon the environment we are running tests in. So we will move the URL in config file **config/environments/default.yml** 

```ruby
urls :
  default : http://staging.zinclearninglabs.com
```

We can access this URL it in our Page object like this : 

```ruby

class HomePage < Page
  page_url base_url

  def open_login
    @browser.element(:text => 'Login').click
  end

  def site_admin_link_visible?
    @browser.element(:text => '(Site Admin)').exists?
  end

  def open_site_admin
    @browser.element(:text => '(Site Admin)').click
  end

end
```

And use it in the **steps/users.rb** use it as :

```ruby
Given(/^I open zinc homepage$/) do
  visit(HomePage)
end
```

# User data with @users

Page Object Patterns help us manages changes in application UI, but what about user accounts.

As the number of tests and scenarios grow, we may want to create various types of users. Some of it may be used across the tests.

To solve this problem, we have our custom solution. 

Currently we use two users, and admin and a student. Lets open the **config/users.yml** and add information for our users their : 

```yaml
my-admin:
 username: karthik.cs@gmail.com
 password: password

student:
 username: 86.rohit+1@gmail.com
 password: password
```

Now, we can access these users with there name as : 

```ruby
admin    = @users.get("my-admin")
username = admin["username"]
password = admin["password"]
```

Its a good practice to also describe a user, so it can be reused in other scenarios so add a line of description as 

```yaml
my-admin:
 username: karthik.cs@gmail.com
 password: password
 description: site admin user 

student:
 username: 86.rohit+1@gmail.com
 password: password
 description: student user with no vocabulary game assigned
```



So, our feature file will look like : 

```yaml
@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for "fagun-site-admin"
    Then  I see homepage with site admin link in top bar

  @student
  Scenario: Login as a zinc student
     Given I open zinc homepage
     Then  I click on login
     And   I enter username and password for "fagun-student"
     And   I do not see site admin link and admin button
```

```ruby
Then("I enter username and password for {string}") do |userid|
  user = @users.get(userid)
  on(LoginForm).login(user["username"], user["password"])
  on(HomePage).wait_till_logged_in
end
```



# Testing a listing page

Shows how to test a page that show a list of cards/table etc.

Coming up !



# Preparing test data

Load test data with rake command `db:play`, create data using UI or rails console, run `db:record` and checkin.



# Cheatsheet 

[Find a cheatsheet for quick reference to APIs here](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet)



# Semaphore Configuration

- Run rails server as daemon
- cd into e2e and run tests

![Semaphore Build](https://github.com/nishants/zinc-test-lessons/raw/master/docs/images/semaphore-build.png)



# Cross browser Testing

Watir supports all the leading browsers. The project is configured to allow selecting browser from command line (once driver for browser is added). Also the poject supports running chrome in emulator mode to test app on mobile, tablet browser screens.

The app also allows implementing the pages separately for mobile, desktop and tablets. Read runtime commands for more details.



# Runtime Options

```bash
rake [env=<env-name> | tags=<@tag1,@tag2> | device=<device-name> | pages=<path/to/pages> | data_suite=<name> | url=<url> | report_file=<path> | client=<device&browser> | users=<profiles-name> | ]
```

##### Examples

```bash
# Run articles and vocabulary tests
rake tags=@articles,@vocabulary

# Run all test and set environment to ci
rake env=ci 

# Run smoke tests on ci
rake tags=@smoke env=ci  

# Run articles and vocabulary tests for ci
rake tags=@articles,@vocabulary env=ci  
   
# Run tests on firefox
rake client=firefox 

# Run tests on chrome iphone emulator
rake client=iphone 

```
