class Test < ApplicationRecord
    has_many :bookings
    has_many :hospital_tests
    has_many :users ,through: :bookings
    has_many :hospitals, through: :hospital_tests
    validates :name ,uniqueness:true, presence:true
    validates :testamount ,presence:true
end
