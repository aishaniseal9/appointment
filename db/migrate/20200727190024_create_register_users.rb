class CreateRegisterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :register_users do |t|
      t.string :username
      t.references :user,null: false,foreign_key: true

      t.timestamps
    end
  end
end
