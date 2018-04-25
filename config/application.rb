require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OrderFoodyAdminRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'application.yml')
      environment = File.exists?(env_file) && YAML.load(File.open(env_file))
      if environment
        environment.each { |key, value| ENV[key.to_s] = value }
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
