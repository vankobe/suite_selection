class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.float :score
      t.integer :country_id
      t.integer :state_id
      t.string :address
      t.string :name
      t.string :home_url
      t.string :online_url
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
