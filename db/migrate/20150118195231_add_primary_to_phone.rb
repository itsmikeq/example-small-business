class AddPrimaryToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :primary, :boolean
  end
end
