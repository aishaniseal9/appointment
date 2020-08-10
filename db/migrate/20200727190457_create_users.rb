class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contactno
      t.string :address
      
      t.date :dob
      t.string :bloodgrp ,:limit =>3
      

      t.timestamps
    end
  end
end
