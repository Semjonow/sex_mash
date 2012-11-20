Devise.setup do |config|
  config.mailer_sender = "js@codegears.co"

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.pepper = "ff20eaa52435653e46f6aef44503e2ad848ae3f31d49c7338ef2f24b8d3069926089fa64050ab24f0537e9c522391a807db9a4fc771c43db97def84db423fced"
  config.encryptor = :sha512

  config.sign_out_via = :delete

  config.omniauth :facebook, '418049088248783', '273369d5f5e4c5ae7add677ee0e4e59b',
                  :client_options => {:ssl => { ca_path: '/etc/ssl/certs' }},
                  :scope          => 'publish_stream,manage_friendlists,user_photos,user_birthday,user_location,email'
end