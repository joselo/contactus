# Use this hook to configure contact mailer.

Contactus.setup do |config|

  # Configure the e-mail address which should receive the email
  config.mailer_to = "contact@example.com"

  # Configure the e-mail address which should receive the cc email
  #config.mailer_cc = "contact@example.com"

  # Configure extra fields
  #config.extra_fields = %w(city phone)

  # Configure extra required fields
  #config.required_extra_fields = %w(country address)

  # From address email, if this variable is commented the contact email will be used as default
  #config.mailer_from  = 'from@example.com'

end