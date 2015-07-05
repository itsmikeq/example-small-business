require_relative 'asp_logger'
class CustomerLogger < AspLogger
  def self.filename
    'customer.log'
  end
end