class Shop < ActiveRecord::Base
  attr_accessible :address, :country_id, :home_url, :latitude, :longitude, :name, :online_url, :score, :state_id
end
