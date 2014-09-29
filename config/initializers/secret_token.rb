# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp3::Application.config.secret_key_base #='39044aeac60bc077aee91737d5af78f4b960bebc8f11b127eb06e0a4d7e8bd2692cf9473cb01ff62c8780be1afa50ea7abe9bbb544c7fc4d4c00548d4fcd54be'

#--------------------------

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp2::Application.config.secret_key_base = secure_token
