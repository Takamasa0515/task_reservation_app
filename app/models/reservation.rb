class Reservation < ApplicationRecord
	belongs_to :user
  belongs_to :room

		validates :end_date, comparison: { greater_than: :start_date }
		validates :start_date, comparison: { greater_than: Date.today }
		validates :person_num, presence: true
		validate :person_num_check

	private

	def person_num_check
		if person_num == 0
			errors.add(:person_num, "は1人以上にしてください")
		end
	end

end
