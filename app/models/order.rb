class Order < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :room

end
