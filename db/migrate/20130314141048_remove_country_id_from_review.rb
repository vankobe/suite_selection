class RemoveCountryIdFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :country_id
  end

  def down
    add_column :reviews, :country_id, :integer, :after => 'score'
  end
end
