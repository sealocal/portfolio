require "functions_framework"
FunctionsFramework.http "hello_http" do |request|
  input = JSON.parse request.body.read rescue {}
  msg = input["message"].to_s
  msg.empty? ? "Hello ruby in GCF 2nd gen!" : msg
end
