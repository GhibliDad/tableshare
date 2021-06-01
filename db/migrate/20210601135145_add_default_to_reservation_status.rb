class AddDefaultToReservationStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :reservations, :status, "pending"
  end
end
