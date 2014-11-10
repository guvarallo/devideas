class User < ActiveRecord::Base
  include Slugreate

  has_many :ideas, dependent: :destroy
  has_many :likes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true
  validates :password, presence: true, on: :create, length: { minimum: 5 }

  slugable_column :username
  
end