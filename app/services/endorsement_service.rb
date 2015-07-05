class EndorsementService
  attr_accessor :params

  def self.execute(endorsement, params)
    @_myself = new(endorsement, params)
    if @_myself.customer && @_myself.email
      EndorsementMailer.contact_message(@_myself.customer.name,
                                        (@_myself.customer.email.address rescue nil),
                                        endorsement.endorsement,
                                        @_myself.phone.try(:number)
      ).deliver_now
    end
  end

  def initialize(endorsement, params)
    @params = params
    endorsement.customer = customer
    endorsement.save
  end

  def customer
    @customer ||= begin
      _name = params[:customer][:name]
      Customer.find_or_create_by(first_name: _name.split.first, last_name: _name.split.last)
    end
  end

  def email
    @email ||= customer.emails.create(address: params[:email][:address])
  end

  def phone
    @phone ||= begin
      if params[:phone][:number]
        customer.phones.create(number: params[:phone][:number])
      end
    end
  end

end