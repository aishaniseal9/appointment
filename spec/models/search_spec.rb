require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it "finds a test or hospital or both by the test name and the hospital name" do
    test=Test.where(id: ['1'])
    test_name=test.name
    tests=Test.where('name like ?',"%#{test_name}%")
    hospitaltests=HospitalTest.where(test_id: [tests.ids]) if tests.present?
    
    hospitals=Hospital.where('"Hname" like ?',"Apollo") 
    if tests.present? && hospitals.present?
    hospitaltests=HospitalTest.where(hospital_id: [hospitals.ids] , test_id:[tests.ids]) 
    elsif tests.present?
      hospitaltests=HospitalTest.where(test_id: [tests.ids]) 
    elsif hospitals.present?
      hospitaltests=HospitalTest.where(hospital_id: [hospitals.ids])
  end
end
end