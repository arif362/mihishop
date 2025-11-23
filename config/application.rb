require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EcommerceLite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Zeitwerk is the default autoloader in Rails 7. Avoid using legacy autoloading.
    # If your `lib` directory contains non-Ruby folders, keep them out of autoloading
    # by adding them to the ignore list; Zeitwerk handles standard Ruby files automatically.
    # If you previously relied on classic autoloading, convert those files to follow
    # Zeitwerk conventions (file names match module/class names) or add explicit requires.
    # Example: config.autoload_paths << Rails.root.join('lib')

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
