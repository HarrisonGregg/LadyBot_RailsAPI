class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :facility, null: false
      t.string :string, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.decimal :total_bill, null: false
      t.decimal :total_paid, null: false
      t.string :details
      t.boolean :anonymous, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
