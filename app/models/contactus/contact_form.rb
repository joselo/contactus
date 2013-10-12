module Contactus

  class Contactus::ContactForm < MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha  => true

    append :remote_ip, :user_agent, :session

    def headers
      {
        :subject => I18n.t('.contactus.contact_forms.subject'),
        :to => Contactus.mailer_to,
        :from => %("#{name}" <#{email}>)
      }
    end

  end

end