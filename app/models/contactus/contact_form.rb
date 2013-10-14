module Contactus

  class Contactus::ContactForm < MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha  => true

    append :remote_ip, :user_agent, :session

    def initialize(*params)
      super(*params)
      create_extra_fields
      create_required_extra_fields
    end

    def headers
      {
        :subject => I18n.t('.contactus.contact_forms.subject'),
        :to => Contactus.mailer_to,
        :from => %("#{name}" <#{email}>)
      }
    end

    private

    def create_extra_fields
      if Contactus.extra_fields
        Contactus.extra_fields.each do |field|
          self.class_eval do; attribute field.to_sym; end
        end
      end
    end

    def create_required_extra_fields
      if Contactus.required_extra_fields
        Contactus.required_extra_fields.each do |field|
          self.class_eval do; attribute field.to_sym, :validate => true; end
        end
      end      
    end

  end

end