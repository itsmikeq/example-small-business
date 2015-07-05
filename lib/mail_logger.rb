require_relative 'asp_logger'
class MailLogger < AspLogger
  def self.filename
    'mail.log'
  end
end