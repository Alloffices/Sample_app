class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :social_media, :string
    add_column :users, :skill, :string
  end
end
