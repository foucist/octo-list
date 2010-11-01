# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todap_session',
  :secret      => 'a6c38dbf25f810fe52bf7e2bb1fee12ac378d0c6ad1a8106cc48d268100903d622d53cf2ccc54f31871fdbbda9781244ad6499fb7812f8f183b39fabb1b41651'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
