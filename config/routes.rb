require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users

  # API Definition
  # namespace :api - Directory holding controllers in this namespace, app/controllers/api
  # defaults: {format: :json} - Default format, media type, of HTTP Request
  # constraints: {subdomain: 'api'} - constrain subdomain to be 'api'. For
  # example, http://api.market_place_api.dev, the request's subdomain is 'api'.
  # path: '/' - All request to to path '/' will be mapped to the api namespace,
  # app/controllers/api

  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    # All requests will be automatically be mapped to version 1, v1, directory. User
    # doesn't need to add '/v1' to path in URL.
    # Don't need /v1/users can just use /users for path in URL.
    scope module: :v1,

          constaints: ApiConstraints.new(version: 1, default: true) do
      # List our resources here.
    end
  end
end
