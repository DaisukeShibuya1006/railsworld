# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppName
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # config.generators do |g|
    #   g.test_framework :rspec,
    #                    helper_specs: false,
    #                    routing_specs: false,
    #                    view_specs: false,
    #                    controller_specs: false
    # end

    config.generators.system_tests = true
  end
end
