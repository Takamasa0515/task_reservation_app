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

	validates :room_name, presence: true
	validates :room_introduction, presence: true
	validates :room_price, presence: true
	validates :room_address, presence: true

	has_one_attached :room_image
	has_many :reservations

	belongs_to :user
end