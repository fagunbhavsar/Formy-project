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

