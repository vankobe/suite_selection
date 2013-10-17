class SuggestKeyword < ActiveRecord::Base
  attr_accessible :display_name, :name, :name_yomi, :type, :type_id
end
