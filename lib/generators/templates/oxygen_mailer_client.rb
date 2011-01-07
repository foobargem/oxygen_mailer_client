OxygenMailer::Client.setup do |config|

  # api-key for sms
  config.sms_api_key = "replace api key of sms"
  config.sms_api_secret = "replace api secret of sms"

  # api-key for mail
  config.mail_api_key = "reaplce api key of mail"
  config.mail_api_secret = "replace api secret of mail"

  config.ssh_host = "host"
  config.ssh_user = "user"

  # ssh private key for sftp
  config.ssh_private_key = <<-EOF
REPLACE SSH PRIVATE-KEY
  EOF

end
