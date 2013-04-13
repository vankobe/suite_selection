class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name_ja
      t.string :name_en
    end
  end
end
