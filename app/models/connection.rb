class Connection < ActiveRecord::Base
  validates :rating, :date, :location, :user_id, :relation_id, :comments, presence: true

  belongs_to :realation, :class_name => 'User'
  belongs_to :user

end


# SCHEMA INFO
#   create_table "connections", force: true do |t|
#     t.integer  "rating"
#     t.string   "date"
#     t.string   "location"
#     t.string   "comments"
#     t.integer  "user_id"
#     t.integer  "relation_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
