class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  has_secure_password

  enum role: [ "default", "admin" ]
end