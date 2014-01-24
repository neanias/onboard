class AddAttachmentImageToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :rooms, :image
  end
end
