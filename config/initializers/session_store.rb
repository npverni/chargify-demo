# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_highcamp_session',
  :secret      => '91bf84f219a3961c1e1cfc6f85d9e567a8389109fae54e17b05fac57135cffce64b373ef05c813fc3bb914513c7d41eb915d84d61a22396e42d2ec53855b1a5f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
