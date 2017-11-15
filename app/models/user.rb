class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  before_create :become_admin!
  mount_uploader :passport_copy, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :talents

  private

  def assign_default_role
    self.add_role(:moderator) if self.roles.blank?
  end

  def become_admin!
    add_role 'admin' unless User.any?
  end

end
