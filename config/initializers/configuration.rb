# unless Rails.env == 'production'
#   config = File.read(Rails.root.join('.env')).split
#   config.each{|c|  ENV[c.split('=').first] = c.split('=').last.gsub(/"/,'') }
#
# end

# Errrr - env
# Settings['recaptcha']['public_key'] = ENV['RECAPTCHA_PUBLIC']
# Settings['recaptcha']['private_key'] = ENV['RECAPTCHA_PRIVATE']
# Settings['social']['facbook_app_id'] = ENV['FACEBOOK_APP_ID']
# Settings['social']['google_app_id'] = ENV['GOOGLE_APP_ID']
# Settings['email']['username'] = ENV['GOOGLE_SMTP_USER']
# Settings['email']['password'] = ENV['GOOGLE_SMTP_PASS']
