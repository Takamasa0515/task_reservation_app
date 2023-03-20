class Room < ApplicationRecord

	def self.area_search(area_search)
		if area_search
			Room.where(["room_address LIKE ?", "%#{area_search}%"])
		else
			Room.all
		end
	end

	def self.keyword_search(keyword_search)
		if keyword_search
			Room.where(["room_name LIKE ? OR room_address LIKE ? OR room_introduction LIKE ?", "%#{keyword_search}%", "%#{keyword_search}%", "%#{keyword_search}%"])
		else
			Room.all
		end
	end


	has_one_attached :room_image
	has_many :reservations
end