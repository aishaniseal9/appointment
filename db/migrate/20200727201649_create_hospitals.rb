class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :Hname
      t.string :Haddress
      t.string :contact
      t.string :email
      t.string :website
      t.integer :no_of_test
     

      t.timestamps
    end
  end
end
