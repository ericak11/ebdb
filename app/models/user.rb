class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :gender, :birthday, :location, presence: true
  has_many :connections, :foreign_key => 'user_id'
  has_many :relations, :class_name  => "Connection", :foreign_key => 'relation_id'
end

# SCHEMA INFO
#   create_table "users", force: true do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "email"
#     t.string   "gender"
#     t.string   "birthday"
#     t.string   "picture"
#     t.string   "password_digest"
#     t.string   "location"
#     t.boolean  "user_created"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
