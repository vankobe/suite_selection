class User < ActiveRecord::Base
  has_many :review

  validates :facebook_uid, :nickname, :email, :presence => true
  validates :facebook_uid, :uniqueness => true
  validates :nickname, :length => {:maximum => 50}

  def self.create_account(auth)
    user = User.new
    user.facebook_uid = auth["uid"]
    user.nickname = auth['info']['name']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.facebook_url = auth["info"]["urls"]["Facebook"]
    user.save!
    user
  end
end
