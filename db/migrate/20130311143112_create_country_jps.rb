class CreateCountryJps < ActiveRecord::Migration
  def change
    create_table :country_jps do |t|
      t.string :name

      t.timestamps
    end
  end
end
