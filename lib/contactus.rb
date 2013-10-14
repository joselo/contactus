require "contactus/engine"

module Contactus

  # Address to send the email.
  mattr_accessor :mailer_to

  # Extra fields
  mattr_accessor :extra_fields

  # Required Extra fields
  mattr_accessor :required_extra_fields

  def self.setup
    yield self
  end

end