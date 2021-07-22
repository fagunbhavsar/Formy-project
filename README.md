# Contents

1. [Gherkin](#gherkin)
2. [Cucumber](#cucumber)
3. [Webdriver](#webdriver)
4. [Watir](#watir)
5. [Setup](#setup)

# Gherkin

Gherkin is a language like **plain English** used to specify features of a system.

Gherkin serves two purposes — **documentation and automated tests**. 

Gherking allows **creating tests in collboration with non-technical stakeholders** in product (product owners, business team, manual testers).


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

# Preparing test data

Load test data with rake command `db:play`, create data using UI or rails console, run `db:record` and checkin.


# Cheatsheet 

[Find a cheatsheet for quick reference to APIs here](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet)


