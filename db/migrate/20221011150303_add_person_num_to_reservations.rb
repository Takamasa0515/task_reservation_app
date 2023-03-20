class AddPersonNumToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :person_num, :integer
  end
end
