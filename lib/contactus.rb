require "contactus/engine"

module Contactus

  # Address to send the email.
  mattr_accessor :mailer_to

  def self.setup
    yield self
  end

end