require 'yaml'

class Users

  def initialize(users)
    @users = users
  end

  def get(user_name)
    @users[user_name]
  end

end