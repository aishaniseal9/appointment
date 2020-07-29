class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :bookingdate
      t.time :bookingtime
      t.references :user, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
