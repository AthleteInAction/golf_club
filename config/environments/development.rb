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

  Instagram.configure do |config|

    config.client_id = 'aa32ba2129914b28b9e27c34804cf288'

    config.client_secret = '5a836017b44a4e85b0bf2b309562c455'

  end

end