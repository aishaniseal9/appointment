FactoryBot.define do
  
  factory :user do
    name {"Archita Seal"}
    contactno {"9949848508"}
    address {"21A,Principal Khudiram Bose Road,Kolkata-6"}
    dob {"1999-02-14"}
    bloodgrp {"A+"}
    email{"aishani22seal@gmail.com"}
   
    password{"wb029393"}
  end
  factory :hospital do
    Hname {"Apollo2"}
    Haddress {"21A,Principal Khudiram Bose Road,Kolkata-6"}
    contact {'9654324156'}
    sequence(:email) {|n|"contactus#{n}1.apollo@gmail.com"}
    website {'www.apollo.com'}
    no_of_test {'30'}

  end

  factory :test do
    name {"FNAC2 test"}
    testamount { "100" }
  end
  factory :hospital_test do
    hospital_id {"2"}
    test_id {"2"}
  end
  factory :booking do
    
  end
  factory :search do
    hospital_name{"Apollo"}
    test_name {"FNAC Test"}
  end
  factory :invalid_search, parent: :search do
    hospital{"Apollo"}
  end
end