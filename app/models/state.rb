class State < ActiveRecord::Base
  attr_accessible :code, :country_id, :name
  
  has_many :shops
  belongs_to :country
  
  def name(locale = I18n.locale)
    case locale
    when :ja
      read_attribute(:name)
    else
      read_attribute(:code)
    end 
  end
end
