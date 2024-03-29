require 'openssl'
require 'jwt'

module AppleMapService
  module JWT
    # Located in Apple Developer Account
    TEAM_ID = ENV["APPLE_MAP_SERVICE_JWT_TEAM_ID"]
    KEY_ID = ENV["APPLE_MAP_SERVICE_JWT_KEY_ID"]
    SERVICE_ID = ENV["APPLE_MAP_SERVICE_SERVICE_ID"]

    # Path to private key of KEY_ID (.p8 file downloaded drom Apple Developer Account)
    KEY_PATH = ENV["APPLE_MAP_SERVICE_KEY_PATH"]
    # Read the key from a file path to create an ECDSA key
    # ? Mounted secrets not availalbe at build time?
    # ENCRYPTED_PRIVATE_KEY = OpenSSL::PKey::EC.new(File.read(KEY_PATH))

    # Heavily inspired by these resources:
    # https://developer.apple.com/forums/thread/707418?answerId=716697022#716697022
    # https://developer.apple.com/forums/thread/707418?answerId=716724022#716724022
    def self.call
      # Read the key from a file path to create an ECDSA key (at run time)
      encrypted_private_key = OpenSSL::PKey::EC.new(File.read(KEY_PATH))

      # Create a JWT for accessing the Apple Maps Server API (Beta)
      jwt = ::JWT.encode({
        iss: TEAM_ID,
        iat: Time.now.to_i,
        exp: Time.now.to_i + (60 * 2), # expires in 2 minutes
        sub: SERVICE_ID,
      }, encrypted_private_key, 'ES256', {
        kid: KEY_ID,
        typ: "JWT",
        id: "#{TEAM_ID}.#{SERVICE_ID}",
      })

      # debug
      # jwt = ::JWT.decode jwt, encrypted_private_key, true, { algorithm: 'ES256' }
      # jwt = jwt.to_json

      jwt
    end
  end
end
