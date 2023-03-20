class ChangeDatatypeRoomImageOfRooms < ActiveRecord::Migration[7.0]
  def change
		change_column :rooms, :room_image, :string
  end
end
