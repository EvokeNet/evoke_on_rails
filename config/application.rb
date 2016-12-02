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

    config.i18n.available_locales = [:en, :es, :pt]
    
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
     unless html_tag =~ /^<label/
       %{<div class="has-error">#{html_tag}<span class="help-block">#{instance.error_message.first}</span></div>}.html_safe
     else
       %{#{html_tag}}.html_safe
     end
    end

  end
end
