#!/bin/sh

# get jwt token
jwt_token=$(curl https://get-apple-map-service-token-ruby-4jc3g3avkq-uw.a.run.app)
echo $jwt_token

# exchange for access token
access_token=$(curl -H "Authorization: Bearer $jwt_token" "https://maps-api.apple.com/v1/token" | jq -r .accessToken)
echo $acces_token

# get coordinate
curl -H "Authorization: Bearer $access_token" "https://maps-api.apple.com/v1/geocode?q=Cupertino" | jq '.results[0]'.coordinate
