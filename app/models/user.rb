class User < ActiveRecord::Base

  # Associations
  has_many :rooms

  # Built into Rails 4, for handling passwords
  has_secure_password

  # Validations
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end
