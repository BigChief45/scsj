require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scsj
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.available_locales = [:es, :en]
    config.i18n.default_locale = :es

    # Load locale subdirectories
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

     # Layouts for Devise views
    config.to_prepare do
      Devise::RegistrationsController.layout 'application'
      Devise::SessionsController.layout 'sessions'
      Devise::PasswordsController.layout proc{ |controller| user_signed_in? ? 'application' : 'sessions' }
    end
  end
end
