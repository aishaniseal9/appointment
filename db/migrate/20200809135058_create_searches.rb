class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :test_name
      t.string :hospital_name

      t.timestamps
    end
  end
end
