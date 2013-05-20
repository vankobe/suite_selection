class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :login_name, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
