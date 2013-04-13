class Country < ActiveRecord::Base
  attr_accessible :name_en, :name_ja
  has_many :state

  def name(locale = I18n.locale)
    case locale
    when :ja
      self.name_ja
    else
      self.name_en
    end
  end
end
