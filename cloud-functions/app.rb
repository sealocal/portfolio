require "functions_framework"
FunctionsFramework.http "get_apple_map_service_token_ruby" do |request|
  input = JSON.parse request.body.read rescue {}
  msg = input["message"].to_s
  msg.empty? ? "Hello ruby in GCF 2nd gen!" : msg
end
