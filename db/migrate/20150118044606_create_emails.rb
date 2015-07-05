class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :emails, :customers
  end
end
