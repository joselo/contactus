module Contactus

  class Contactus::ContactForm < MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha  => true

    append :remote_ip, :user_agent, :session

    if Contactus.extra_fields
      Contactus.extra_fields.each do |field|
        self.class_eval do; attribute field.to_sym; end
      end
    end

    if Contactus.required_extra_fields
      Contactus.required_extra_fields.each do |field|
        self.class_eval do; attribute field.to_sym, :validate => true; end
      end
    end

    def headers
      default_header.merge(cc_header).merge(bcc_header)
    end

    private

    def default_header
      {
        :subject => I18n.t('.contactus.contact_forms.subject'),
        :to => Contactus.mailer_to,
        :from => from_email
      }      
    end

    def cc_header
      (Contactus.mailer_cc)? { :cc => Contactus.mailer_cc } : {}
    end

    def bcc_header
      (Contactus.mailer_bcc)? { :bcc => Contactus.mailer_bcc } : {}
    end

    def from_email
      Contactus.mailer_from || %("#{name}" <#{email}>)
    end

  end

end