module MarketPlaceApi
  class RequestLogger

    def initialize(app)
      @app = app
    end

    def call(env)

      @req = Rack::Request.new(env)
      Rails.logger.debug "Accept Encoding: #{@req.accept_encoding}"
      Rails.logger.debug "Content Type: Encoding: #{@req.content_type}"
      Rails.logger.debug "Host: #{@req.host}"
      Rails.logger.debug "IP: #{@req.ip}"
      Rails.logger.debug "Media Type: #{@req.media_type}"
      Rails.logger.debug "Params: #{@req.params}"
      Rails.logger.debug "Path: #{@req.path}"
      Rails.logger.debug "Path Info: #{@req.path_info}"
      Rails.logger.debug "Query String: #{@req.query_string}"
      Rails.logger.debug "Request Method: #{@req.request_method}"
      Rails.logger.debug "XHR?: #{@req.xhr?}"


      # All but the last to domains in foo.api.market_place_dev.dev
      subdomain = @req.host.split('.')[0...-2].join('.')
      Rails.logger.debug "Subdomain: #{subdomain}"

      # pass on to next middleware
      @app.call(env)
    end
  end
end
