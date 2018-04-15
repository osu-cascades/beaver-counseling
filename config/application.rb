require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#getting error undefined method `google_cloud'
# Rails.application.configure do |config|
#   config.google_cloud.use_debugger = false
#   config.google_cloud.use_logging = false
#   config.google_cloud.use_trace = false
# end

#look at https://googlecloudplatform.github.io/google-cloud-ruby/#/docs/stackdriver/v0.14.0/guides/instrumentation_configuration
#https://cloud.google.com/logging/docs/setup/ruby

module BeaverCounseling
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w( ckeditor/* )
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end


