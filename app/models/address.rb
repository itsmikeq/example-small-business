# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  street      :string
#  state       :string
#  zip_code    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city        :string
#  customer_id :integer
#  location    :string
#
# Indexes
#
#  index_addresses_on_customer_id  (customer_id)
#

class Address < ActiveRecord::Base
  belongs_to :customer
  delegate :street, :state, :zip_code, :city, to: :customer, prefix: true
  VALID_LOCATIONS = ['Home', 'Business']

  validates :location, :presence => true, :inclusion => {in: VALID_LOCATIONS}
  default_value_for :location, "Home"


end
