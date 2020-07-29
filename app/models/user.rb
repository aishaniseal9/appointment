class User < ApplicationRecord
    validates :name,:address,:contactno,:bloodgrp,:dob,presence:true
    validates :bloodgrp,
    inclusion: { in: %w(A+ A- B+ B- AB+ AB- O+ O- ),
            message: "%{value} not allowed"}
     validates :name, presence: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     validates :email, presence:true,format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false } if :present?
    validates :contactno,uniqueness: true,format: {with: /\A([0-9]){10}\Z/ ,message: "%{value} not valid "}
    #validate :correct_date
    has_one :register_user
    has_many :bookings
    
    has_many :tests ,through: :bookings
    has_many :hospitals, through: :bookings
    private
    def correct_date
        if dob.present? && dob.year.in?(1800..2020)
            errors.add[:dob]<<"Year outside range"
        end
    
    end
end
