class Services < Settingslogic
  source ENV.fetch('ALLSTAR_CONFIG') { "#{Rails.root}/config/services.yml" }
  Settings['services'] ||= Settingslogic.new({})
end
