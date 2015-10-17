class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :telephone, presence: true, uniqueness: true, length: { is: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :os, presence: true
  validates :communication, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
