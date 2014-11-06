class UpdateUsersWithDefaults < ActiveRecord::Migration
  def change
    change_column :users, :user_created, :boolean, :default => false
  end
end
