class CustomerService
  attr_accessor :params

  def self.execute(params)
    @_myself = new(params)
    unless @_myself.customer && @_myself.email && @_myself.phone
      CustomerLogger.info "Odd results from customer Customer: #{@_myself.customer.inspect} Email: #{@_myself.email} Phone: #{@_myself.phone}"
    end
    ContactMailer.contact_message(params[:name],
                                  params[:email],
                                  params[:message],
                                  params[:phone]
    ).deliver_now
  end

  def initialize(params)
    @params = params
  end

  def customer
    @customer ||= Customer.find_or_create_by(first_name: params[:name].split.first, last_name: params[:name].split.last)
  end

  def email
    return true unless params[:email]
    @email ||= customer.emails.find_or_create_by(address: params[:email])
  end

  def phone
    return true unless params[:phone]
    @phone ||= customer.phones.find_or_create_by(number: params[:phone])
    customer.phones.primary.first.number
  rescue
    nil
  end
end