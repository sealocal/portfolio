gcloud functions deploy get-apple-map-service-token-ruby --region us-west1 --allow-unauthenticated \
    --source . --trigger-http --runtime ruby32 --gen2 --entry-point get_apple_map_service_token_ruby --memory 128Mi \
    --set-secrets "/etc/secrets/AuthKey_HL46T79ZJH_p8=AuthKey_HL46T79ZJH_p8:latest" \
    --env-vars-file .env.yaml
