class Booking < ApplicationRecord
  
  belongs_to :user
  belongs_to :hospital_test
  #belongs_to :test
  validates :user_id, uniqueness: { scope: [:hospital_test_id ,:bookingdate]}
  validate :booking_date
  private 
  def booking_date
    if bookingdate.present? && bookingdate<Date.current
      errors.add(:base, 'You cannot book appointment for a past date')
  end
end
end
