class User < ActiveRecord::Base
  has_many :ideas

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true
  validates :password, presence: true, on: :create, length: { minimum: 5 }
end