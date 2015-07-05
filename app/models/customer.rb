# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email_id   :integer
#  address_id :integer
#
# Indexes
#
#  index_customers_on_address_id  (address_id)
#  index_customers_on_email_id    (email_id)
#

class Customer < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :endorsements, dependent: :destroy
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :endorsements

  attr_accessor :phone, :email
  def self.search_and_order(search, page_number)
    if search
      where("first_name LIKE ? or last_name like ? or concat(first_name, last_name) like ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%").order(
          admin: :desc, email: :asc
      ).page page_number
    else
      Customer.all.page page_number
    end
  end

  def self.latest_customers(count)
    order(created_at: :desc).limit(count).select("id", "first_name", "last_name", "created_at")
  end

  def name=(_name)
    self.first_name, self.last_name = _name.split
  end

  def name
    [first_name, last_name].join(" ")
  end

  def phone_numbers
    phones.pluck(:number)
  end

  def email_addresses
    emails.pluck(:address)
  end

  def email
    emails.primary.first
  end

  def primary_phone
    phones.primary.first
  rescue
    nil
  end

  def primary_address
    addresses.first
  end

  def primary_email
    emails.primary.first
  end


end
