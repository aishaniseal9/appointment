class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name,:address,:contactno,:bloodgrp,:dob,presence:true
    validates :bloodgrp,
    inclusion: { in: %w(A+ A- B+ B- AB+ AB- O+ O- ),
            message: "%{value} not allowed"}
     validates :name, presence: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     validates :email, presence:true,format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false } if :present?
    validates :contactno,uniqueness: true,format: {with: /\A([0-9]){10}\Z/ ,message: "%{value} not valid "}
        
    has_one :register_user
    has_many :bookings,dependent: :destroy
    validate :correct_date
    #has_many :tests ,through: :bookings
    has_many :hospital_tests, through: :bookings
    private
    def correct_date
        if dob.present? && dob>=Date.current
            errors.add(:base, 'Date is beyond current date,u Cannot be born')

        end
    
    end
end
