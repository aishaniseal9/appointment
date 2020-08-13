class Search < ApplicationRecord
  def search_hospital_tests
    #hospitaltests=HospitalTest.all
    tests=Test.where('name like ?',"%#{test_name}%") if test_name.present?
    hospitaltests=HospitalTest.where(test_id: [tests.ids]) if tests.present?
    
    hospitals=Hospital.where('"Hname" like ?',"%#{hospital_name}%") if hospital_name.present?
    if tests.present? && hospitals.present?
    hospitaltests=HospitalTest.where(hospital_id: [hospitals.ids] , test_id:[tests.ids]) 
    elsif tests.present?
      hospitaltests=HospitalTest.where(test_id: [tests.ids]) 
    elsif hospitals.present?
      hospitaltests=HospitalTest.where(hospital_id: [hospitals.ids])
    end
    return hospitaltests
  end
end
