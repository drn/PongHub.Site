require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Homepage
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # set up asset pipeline
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    Rails.application.config.assets.precompile += [ '*.css' ]

    if !Rails.env.development? && !Rails.env.test?
      # Disable Rails's static asset server
      # In production, Apache or nginx will already do this
      config.serve_static_assets = true
      config.assets.compile = true
      config.assets.compress = true
      config.assets.digest = true
      config.assets.enabled = true
      config.fail_silently = true
      config.assets.version = '1.0.0'
      config.assets.js_compressor  = :uglifier
      config.assets.css_compressor = :yui
    end

  end
end
