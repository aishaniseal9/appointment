class HospitalTest < ApplicationRecord
  belongs_to :hospital
  belongs_to :test
  has_many :bookings,dependent: :destroy
  has_many :users,through: :bookings

  validates :hospital_id, uniqueness: { scope: :test_id }
end
