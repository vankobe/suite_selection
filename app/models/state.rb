class State < ActiveRecord::Base
  attr_accessible :code, :country_id, :name
  
  belongs_to :country
  
  def name(locale = I18n.locale)
    case locale
    when :ja
      self.name
    else
      self.code
    end 
  end
end
