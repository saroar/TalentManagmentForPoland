class Talent < ApplicationRecord
  enum status: [ :pending, :processing, :start, :visa_appointment, :done, :refuse ]
  enum relationship_status: [ :single, :married ]
  mount_uploader :passport_copy, ImageUploader
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates :surname, :given_name, :place_of_birth, :date_of_birth, :date_of_expiry, :passport_copy, :starting_payment, presence: true

end

