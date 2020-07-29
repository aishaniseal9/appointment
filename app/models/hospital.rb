class Hospital < ApplicationRecord
    has_many :bookings
    has_many :hospital_tests
    has_many :tests, through: :hospital_tests
    has_many :users, through: :bookings
    validates :Hname,:Haddress,:contact,:email,:website,:no_of_test,presence:true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     validates :email, presence:true,format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false } if :present?
    validates :contact,uniqueness: true,format: {with: /\A([0-9]){10}\Z/ ,message: "%{value} not valid "}
  
end
