Rails.application.routes.draw do

  # API Definition
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    # List our resources here.

  end
end
