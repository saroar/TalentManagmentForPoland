class Talent < ApplicationRecord
  enum status: [ :pending, :processing, :start, :done, :refuse ]
  mount_uploader :passport_copy, ImageUploader
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates :given_name, :surname, :place_of_birth, :date_of_birth, :date_of_expiry, :passport_copy, :starting_payment, presence: true
end
