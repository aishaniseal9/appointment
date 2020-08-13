class Test < ApplicationRecord
   
    has_many :hospital_tests,dependent: :destroy
 
    has_many :hospitals, through: :hospital_tests
    validates :name ,uniqueness:true, presence:true
    validates :testamount ,presence:true
    accepts_nested_attributes_for :hospital_tests,allow_destroy: true
end
