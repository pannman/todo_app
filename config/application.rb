require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    #field_with_errorを読み込まない
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    #errorメッセージ日本語
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
