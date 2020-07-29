class CreateHospitalTests < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_tests do |t|
      t.references :hospitals, null: false, foreign_key: true
      t.references :tests, null: false, foreign_key: true

      t.timestamps
    end
  end
end
