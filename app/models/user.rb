class User < ActiveRecord::Base

  # Associations
  has_many :rooms
  has_many :orders

  # Built into Rails 4, for handling passwords
  has_secure_password

  # Add in paperclip
  has_attached_file :avatar, styles: {
    large: '320x320#',
    medium: '140x140#',
    thumbnail: '50x50#'
  }

  # Validations
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end
