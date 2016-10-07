class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :insurance_company, null: false
      t.string :insurance_type, null: false

      t.timestamps, null: false
    end
  end
end
