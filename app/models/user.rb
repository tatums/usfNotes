class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.require_password_confirmation = false
    config.ignore_blank_passwords = true
  end
end
