class AddContactableToUser < ActiveRecord::Migration
  def change
    add_column :users, :contactable, :boolean
  end
end
