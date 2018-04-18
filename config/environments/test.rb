Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  # config.action_view.raise_on_missing_translations = true

  # Disable GCP tooling in test environment.
  config.google_cloud.use_debugger = false
  config.google_cloud.use_logging = false
  config.google_cloud.use_trace = false
  config.google_cloud.use_error_reporting = false
end
