class AddPrimaryToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :primary, :boolean
  end
end
