class AdminUser < ActiveRecord::Base
  attr_accessible :login_name, :password
end
