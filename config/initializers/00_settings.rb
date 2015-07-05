class Settings < Settingslogic
  source ENV.fetch('ALLSTAR_CONFIG') { "#{Rails.root}/config/application.yml" }
  namespace Rails.env
  class << self
    def app_on_standard_port?
      app_config.port.to_i == (application.https ? 443 : 80)
    end

    private
    def build_application_url
      custom_port = app_on_standard_port? ? nil : ":#{application.port}"
      [application.protocol,
       "://",
       application.host,
       custom_port,
       application.relative_url_root
      ].join('')
    end

    # check that values in `current` (string or integer) is a constant in `module`.
    def verify_constant_array(modul, current, default)
      values = default || []
      if !current.nil?
        values = []
        current.each do |constant|
          values.push(verify_constant(modul, constant, nil))
        end
        values.delete_if { |value| value.nil? }
      end
      values
    end

    # check that `current` (string or integer) is a constant in `module`.
    def verify_constant(modul, current, default)
      constant = modul.constants.find { |name| modul.const_get(name) == current }
      value = constant.nil? ? default : modul.const_get(constant)
      if current.is_a? String
        value = modul.const_get(current.upcase) rescue default
      end
      value
    end

  end

  Settings['application'] ||= Settingslogic.new({})
  Settings['email'] ||= Settingslogic.new({})
  Settings['recaptcha'] ||= Settingslogic.new({})
  Settings['social'] ||= Settingslogic.new({})


end