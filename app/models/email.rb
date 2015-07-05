# == Schema Information
#
# Table name: emails
#
#  id          :integer          not null, primary key
#  address     :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  primary     :boolean
#
# Indexes
#
#  index_emails_on_customer_id  (customer_id)
#

class Email < ActiveRecord::Base
  belongs_to :customer
  # Validations
  # :email
  validates_format_of :address, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  before_create :set_primary

  delegate :address, to: :customer, prefix: true

  scope :primary, -> { where(primary: true) }

  def primary_email
    where(primary: true).presence
  end

  def set_primary
    self.primary = (customer.emails.count < 1)
  end
end
