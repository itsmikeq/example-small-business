module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | AllStarAppliance"
    end
  end

  def san_antonio_post_codes
    AllStarAppliance.config.san_antonio_post_codes
  end

  def austin_post_codes
    AllStarAppliance.config.austin_post_codes
  end

  def phone_number(request)
    @phone_number ||= begin
      Rails.cache.fetch("phone-number-#{request.env['REMOTE_ADDR']}", expires_in: 1.hour) do
        result = request.location
        post_code = result.postal_code.to_s rescue nil
        if san_antonio_post_codes.include?(post_code)
          Settings.application.phones.san_antonio
        elsif austin_post_codes.include?(post_code)
          Settings.application.phones.austin
        else
          # Default but we want to see where people are coming from
          Rails.logger.info "Unable to find info for #{result.inspect} #{result.try(:postal_code)} not in list"
          Settings.application.phones.san_antonio
        end
      end
    end
  end

  def mobile?
    user_agent.match(/iPhone|Android|Mobile/)
  end

  def user_agent
    @user_agent ||= begin
      Rails.logger.info "User agent: #{request.env['HTTP_USER_AGENT']}"
      request.env['HTTP_USER_AGENT']
    end
  end

end
