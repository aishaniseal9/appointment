class Hospital < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_hospital_name,against: [:Hname],using: {
        tsearch:{
            prefix: true,
           
            highlight: {
                start_sel:'<b>',
                stop_sel: '<b>',

            }
        }
    }
    has_many :hospital_tests,dependent: :destroy
    has_many :tests, through: :hospital_tests
    accepts_nested_attributes_for :hospital_tests,allow_destroy: true
  
    validates :Hname,:Haddress,:contact,:email,:website,:no_of_test,presence:true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     validates :email, presence:true,format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false } if :present?
    validates :contact,uniqueness: true,format: {with: /\A([0-9]){10}\Z/ ,message: "%{value} not valid "}
   
   
end
