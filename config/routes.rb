Rails.application.routes.draw do

  # API Definition
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    scope module: :v1 do
      # List our resources here.
    end
  end
end
