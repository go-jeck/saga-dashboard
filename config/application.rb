require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.lxc_type =  "image"
    config.lxc_protocol = "simplestreams"
    config.lxc_server = "https://cloud-images.ubuntu.com/daily"
    config.lxc_crash_status = "Failed to create"
    config.lxc_running_status = "started"
    config.lxc_stop_status = "stopped"
    config.scheduler_address = "http://172.28.128.3:9300/api/v1"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
