class CreateSuggestKeywords < ActiveRecord::Migration
  def change
    create_table :suggest_keywords do |t|
      t.string :type
      t.integer :type_id
      t.string :display_name
      t.string :name
      t.string :name_yomi
    end
    change_table :suggest_keywords do |t|
      t.index :display_name, :unique => true
      t.index :name
      t.index :name_yomi
    end
  end
end
