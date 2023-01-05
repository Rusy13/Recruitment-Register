class Usercustomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:confirmable
  scope :all_except, -> (usercustomer) {where.not(id: usercustomer)}
  after_create_commit {broadcast_append_to "usercustomers" }
  has_many :messages
end