require_relative "lib/apple_map_service"

require "functions_framework"
FunctionsFramework.http "get_apple_map_service_token_ruby" do |request|
  response = Rack::Response.new AppleMapService::JWT.call
  # response.add_header 'Access-Control-Allow-Origin', '*'               # development
  response.add_header 'Access-Control-Allow-Origin', 'https://miket.dev'  # production
  response.add_header 'Vary', 'Origin'
  response
end
