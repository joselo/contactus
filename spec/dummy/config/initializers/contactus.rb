# Use this hook to configure contact mailer.

Contactus.setup do |config|

  # Configure the e-mail address which should receive the email
  config.mailer_to = "contact@example.com"

  # Configure extra fields
  config.extra_fields = %w(city)

  # Configure extra required fields
  #config.required_extra_fields = %w(country address)

end