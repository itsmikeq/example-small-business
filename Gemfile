source 'https://rubygems.org'
ruby '2.1.5'

# Standard Rails gems
gem 'rails', '4.2.0'
gem 'sass-rails', '5.0.0'
gem 'uglifier', '2.6.0'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.2'
gem 'turbolinks', '2.5.3'
gem 'jquery-turbolinks'
gem 'jbuilder', '2.2.6'
gem 'bcrypt', '3.1.9'

# Necessary for Windows OS (won't install on *nix systems)
gem 'tzinfo-data', platforms: [:mingw, :mswin]

# Kaminari: https://github.com/amatsuda/kaminari
gem 'kaminari', '0.16.1'

# Friendly_id: https://github.com/norman/friendly_id
gem 'friendly_id', '5.0.4'

# Font-awesome: https://github.com/FortAwesome/font-awesome-sass
gem 'font-awesome-sass', '4.2.2'

# Bootstrap 3: https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '3.3.1.0'
gem "haml-rails"
# gem 'mobile-fu' # tell if on mobile https://github.com/benlangfeld/mobile-fu


gem 'settingslogic'

gem 'seed-fu'
gem "email_validator"
gem "default_value_for"

# Lazy bootstrap forms
# gem 'bootstrap_form'
gem 'nested_form'

group :development, :test do
  gem 'byebug', '3.5.1'
  gem 'web-console', '2.0.0'
  gem 'bootstrap-generators'
  # Figaro: https://github.com/laserlemon/figaro
  # gem 'figaro', '1.0.0'
  gem 'quiet_assets'

  # Prevent occasions where minitest is not bundled in packaged versions of ruby (see #3826)
  gem 'minitest', '~> 5.5'
  # Generate Fake data
  gem "ffaker"

  # Spring: https://github.com/rails/spring
  gem 'spring', '1.2.0'
  gem 'html2haml'
  gem "letter_opener"
  # Annotate models
  gem 'annotate'
  # Better errors handler
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails_best_practices'
end

# Sanitize user input
gem "sanitize", '~> 2.0'

# Protect against bruteforcing
gem "rack-attack"

# PostgreSQL
gem 'pg'

# Devise: https://github.com/plataformatec/devise
gem 'devise', '3.4.1'

# Redcarpet: https://github.com/vmg/redcarpet
gem 'redcarpet', '3.2.0'

gem "recaptcha", :require => "recaptcha/rails"
gem 'bcrypt-ruby'

# Location based queries
gem 'geocoder'

# Social buttons
# gem "social-buttons"
gem 'gon'

# Rails 12factor for Heroku: https://github.com/heroku/rails_12factor
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "shoulda-matchers"
  gem "timecop"
  gem "webmock"
  gem "launchy"
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'

end