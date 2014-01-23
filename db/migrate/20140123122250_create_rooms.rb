class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :bedrooms
      t.integer :max_guests
      t.float :price

      t.timestamps
    end
  end
end
