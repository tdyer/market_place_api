# Version the API
class ApiConstraints

  # ApiConstraints.new(default: true) - matches all HTTP requests
  # ApiConstraints.new(version: 1) - matches all HTTP requests with
  # Accept header "application/vnd.marketplace.v1"
  # ApiConstraints.new(version: 7) - matches all HTTP requests with
  # Accept header "application/vnd.marketplace.v7"
  # ApiConstraints.new(version: 7, default: true ) - matches all HTTP requests

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end


  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.marketplace.v#{@version}")
  end

end
