require_relative "lib/apple_map_service"

require "functions_framework"
FunctionsFramework.http "get_apple_map_service_token_ruby" do |request|
  AppleMapService::JWT.call
end
