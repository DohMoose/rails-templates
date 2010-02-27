gsub_file 'config/application.rb', /require 'rails\/all'/ do
<<-RUBY
# Pick the frameworks you want:
require 'action_controller/railtie'
require 'dm-rails/railtie'
# require 'action_mailer/railtie'
# require 'active_resource/railtie'
# require 'rails/test_unit/railtie'
RUBY
end


gsub_file 'config/application.rb', /#{Regexp.escape("    # Configure generators values. Many other options are available, be sure to check the documentation.")}/ do
<<-RUBY
    config.generators do |g|
      g.orm             :data_mapper
      g.template_engine :erb
      g.test_framework  :test_unit, :fixture => false
    end
RUBY
end

gsub_file 'config/environments/development.rb', /config.action_mailer.raise_delivery_errors = false/ do
  "# config.action_mailer.raise_delivery_errors = false"
end

gsub_file 'config/environments/test.rb', /config.action_mailer.delivery_method = :test/ do
  "# config.action_mailer.delivery_method = :test"
end

