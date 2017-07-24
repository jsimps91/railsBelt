class User < ApplicationRecord
  has_secure_password
  has_many :shoes
  has_many :sales
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :email, with: EMAIL_REGEX
  validates :email, uniqueness: true
  validates :password, length: { minimum:8 }, on: :create
  validates :email, presence: true
  validates :first_name, presence: true 
  validates :last_name, presence: true
end
