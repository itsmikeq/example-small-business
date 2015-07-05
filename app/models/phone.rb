# == Schema Information
#
# Table name: phones
#
#  id          :integer          not null, primary key
#  number      :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  primary     :boolean
#
# Indexes
#
#  index_phones_on_customer_id  (customer_id)
#

class Phone < ActiveRecord::Base
  belongs_to :customer
  delegate :number, to: :customer, prefix: true
  validates_presence_of :number
  before_create :set_primary

  scope :primary, -> { where(primary: true) }
  private
  def set_primary
    self.primary = (customer.phones.count < 1)
  rescue
    self.primary = true
  end

end
