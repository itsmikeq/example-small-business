class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :phones, :customers
  end
end
