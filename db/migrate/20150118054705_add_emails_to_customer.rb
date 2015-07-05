class AddEmailsToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :email, index: true
    add_foreign_key :customers, :emails
    add_reference :customers, :address, index: true
    add_foreign_key :customers, :addresses
  end
end
