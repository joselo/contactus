require "contactus/engine"

module Contactus

  # From address email.
  mattr_accessor :mailer_from

  # Address to send the email.
  mattr_accessor :mailer_to

  # Address to send the cc email.
  mattr_accessor :mailer_cc

  # Extra fields
  mattr_accessor :extra_fields

  # Required Extra fields
  mattr_accessor :required_extra_fields

  def self.setup
    yield self
  end

end