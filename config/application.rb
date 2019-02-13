require_relative 'boot'

require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rakuten
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')
  end
end


# require File.expand_path('../boot', __FILE__)

# require "rails"
# # Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module NoverdeLoans
#   class Application < Rails::Application
#     # Settings in config/environments/* take precedence over those specified here.
#     # Application configuration should go into files in config/initializers
#     # -- all .rb files in that directory are automatically loaded.

#     # Only loads a smaller set of middleware suitable for API only apps.
#     # Middleware like session, flash, cookies can be added back manually.
#     # Skip views, helpers and assets when generating a new resource.
#     config.api_only = true
#     config.autoload_paths << Rails.root.join('lib')
#     config.eager_load_paths << Rails.root.join('lib')
#     config.i18n.default_locale = :'pt-BR'
#     config.active_job.queue_adapter = :sidekiq

#     config.active_record.schema_format = :sql
#     config.lograge.enabled = true
#   end
# end
