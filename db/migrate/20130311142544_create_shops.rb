class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.float :score
      t.integer :original_country_id

      t.timestamps
    end
  end
end
