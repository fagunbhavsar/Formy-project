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

