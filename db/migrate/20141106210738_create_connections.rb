class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :rating
      t.string :date
      t.string :location
      t.string :comments
      t.references :user
      t.integer  :relation_id

      t.timestamps
    end
  end
end
