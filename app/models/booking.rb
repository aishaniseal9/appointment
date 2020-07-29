class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :test
end
