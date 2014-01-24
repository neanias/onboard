class Room < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :orders

  # This is from the rubygeocoder.org site
  geocoded_by :address
  after_validation :geocode

  # Add in paperclip to save images
  # The hash (#) after 960x300 means we crop the image
  # If we wanted it to be a certain width: '500x'
  # If we wanted it to be a certain height: 'x500'
  has_attached_file :image, styles: { 
    large: '960x300#', thumbnail: '50x50#' }
  
  # validations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true, 
    numericality: { greater_than_or_equal_to: 0.5 }

end
