# == Schema Information
#
# Table name: endorsements
#
#  id          :integer          not null, primary key
#  endorsement :text
#  customer_id :integer
#  approved    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_endorsements_on_customer_id  (customer_id)
#

class Endorsement < ActiveRecord::Base
  belongs_to :customer
  has_many :emails, through: :customer
  scope :approved, -> { where(approved: true) }
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :emails
  # attr_accessor :customer_name, :phone_number
  default_value_for :approved, false

  def approve
    update_attribute :approved, true
  end
end
