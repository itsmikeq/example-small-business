class AddCustomerToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :customer, index: true
    add_foreign_key :addresses, :customers
  end
end
