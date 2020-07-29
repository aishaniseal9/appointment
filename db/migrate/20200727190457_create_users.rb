class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contactno
      t.string :address
      t.string :email
      t.date :dob
      t.string :bloodgrp ,:limit =>3
      t.string :registerstatus
      t.string :loggedstatus

      t.timestamps
    end
  end
end
