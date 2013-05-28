class AdminUser < ActiveRecord::Base
  attr_accessible :login_name, :password

  class << self
    def authorize(raw_login_name, raw_password)
      admin_user = self.where("login_name = ?", Digest::SHA256.hexdigest(raw_login_name)).first
      if admin_user.present? && admin_user.password == Digest::SHA256.hexdigest(raw_password)
        return admin_user
      else
        return nil
      end
    end
  end
end
