class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :birthday
      t.string :picture
      t.string :password_digest
      t.string :location
      t.boolean :user_created

      t.timestamps
    end
  end
end
