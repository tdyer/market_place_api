require 'api_constraints'

Rails.application.routes.draw do

  # API Definition
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    scope module: :v1,
          constaints: ApiConstraints.new(version: 1, default: true) do
      # List our resources here.
    end
  end
end
