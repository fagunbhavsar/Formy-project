# Cheatsheet

### Interacting with page elements

Refer :  <http://watir.com/guides/> 



### **Finding elements**

| Find by | Example                                     |
| ------- | ------------------------------------------- |
| text    | @browser.element(:text => 'text-to-find')   |
| id      | @browser.element(:id => 'element-id')       |
| class   | @browser.element(:class => 'element-class') |
| value   | @browser.element(:value => 'some-value')    |
| tag     | @browser.element(:tag => 'table')           |



### **Element types**

| Name         | API                 |
| ------------ | ------------------- |
| any element  | @browser.element    |
| text input   | @browser.text_field |
| select list  | @browser.select     |
| radio button | @browser.radio      |
| checkbox     | @browser.checkbox   |
| button       | @browser.button     |
| link (<a>)   | @browser.link       |

### **Interacting with elements**

| what                          | How                                                        |
| ----------------------------- | ---------------------------------------------------------- |
| click                         | element.click                                              |
| enter text                    | element.set                                                |
| select list value             | @browser.select_list(:id => 'language').select( 'English') |
| set radio button and checkbox | element.set                                                |



### **Waiting for elements**

| What                             | Example                                                      |
| -------------------------------- | ------------------------------------------------------------ |
| wait for element to be visible   | @browser.element(:text => 'Submit').wait_until_present       |
| wait **till** element is visible | @browser.element(:text => 'Loading').wait_while_present      |
| set wait for condition wait time | Watir::Wait.until { @browser.element(:id => 'msg').text.include? 'Waiting for data' } |

### exists? *vs* present? *vs* visible?

| Method       | Element visible on page | Element not visible on page |
| ------------ | ----------------------- | --------------------------- |
| **exists?**  | returns true            | returns false               |
| **present?** | returns true            | error                       |
| **visible?** | returns true            | error                       |



### **Some examples** 

| What                            | Example                                                      |
| ------------------------------- | ------------------------------------------------------------ |
| find by text and click          | @browser.element(:text => 'text-to-find').click              |
| check if element is visible     | @browser.element(:text => 'text-to-find').visible?           |
| enter value in text field       | @browser.text_field(:id => 'my-input').set('my value')       |
| open URL                        | @browser.goto("<http://my/url>")                             |
| select a value                  | @browser.select_list(:id => 'language').select 'English'     |
| all select options              | @browser.select_list(:id => 'language').selected_options     |
| radio button                    | @browser.radio(:value => 'Optional').set                     |
| radio button value              | @browser.radio(:value => 'Optional').set?                    |
| checkbox                        | @browser.checkbox(:value => 'Optional').set                  |
| checkbox value                  | @browser.checkbox(:value => 'Optional').set?                 |
| alert click 'Ok'                | @browser.alert.ok                                            |
| alert click 'Close'             | @browser.alert.close                                         |
| get alert text                  | @browser.alert.text                                          |
| is alert shown                  | @browser.alert.exists?                                       |
| wait for element                | @browser.element(:text => 'Submit').wait_until_present       |
| check if element is not present | expect(@browser.element(:id => 'error').exists?).to eq(false) |

### **Get user data**

Create user in **config/users.yml** as : 

```yaml
<user-name>:
 username: <user-name>
 password: <user-password>
```

In tests access user by user name : 

```ruby
user     = @users.get(<user-name>)
username = user['username']
password = user['password']
```

### Yes You CAN !
![Yes you can](https://github.com/nishants/zinc-test-lessons/raw/master/docs/images/yes-you-can.gif)

### 
