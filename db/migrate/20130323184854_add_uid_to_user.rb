class AddUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :integer, :limit=> 8, :after => "id"
    add_column :users, :facebook_url, :string, :after => "image_url"
  end
end
