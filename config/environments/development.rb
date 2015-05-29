Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.raise_runtime_errors = true

  # URI
  SITE_URI = 'http://localhost:3000'
  
  # APP NAME
  APP_NAME = 'My Golf Club'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Local]"

  # ENV
  E = Rails.env

  # ACCESS
  ACCESS = ['end-user','admin']

  # TEE's
  TEE = ['black','blue','gold','white','yellow','red']

end