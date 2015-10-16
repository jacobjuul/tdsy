class User < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :company, presence: true
    validates :position, presence: true
    validates :telephone, presence: true
    validates :email, presence: true
    validates :os, presence: true
    validates :communication, presence: true
end
