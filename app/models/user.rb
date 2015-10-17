class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :telephone, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                 format: { with: VALID_EMAIL_REGEX },
  #                 uniqueness: { case_sensitive: false }
  validates :os, presence: true
  validates :communication, presence: true
end
