require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EvokeOnRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # use js instead of coffee
    config.generators do |g|
      g.javascript_engine :js
    end

    config.web_console.whitelisted_ips = '192.168.1.36'

    config.i18n.available_locales = [:en, :es, :pt]

  end
end
