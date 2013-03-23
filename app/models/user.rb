class User < ActiveRecord::Base
  has_many :review

  def self.create_account(auth)
    user = User.new
    user.nickname = auth['info']['nickname']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.save!
    user
  end
end
