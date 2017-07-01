require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailwayRor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]

    config.load_defaults 5.1

    config.i18n.default_locale = :ru

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
