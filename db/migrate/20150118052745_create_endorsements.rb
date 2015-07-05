class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.text :endorsement
      t.references :customer, index: true
      t.boolean :approved

      t.timestamps null: false
    end
    add_foreign_key :endorsements, :customers
  end
end
