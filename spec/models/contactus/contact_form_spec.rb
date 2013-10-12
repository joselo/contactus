require 'spec_helper'

module Contactus

  describe ContactForm do

    before do
      Contactus.mailer_to = "webmaster@example.com"
      @contact_form = FactoryGirl.build(:contact_form)
    end

    describe 'headers' do

      it 'should assing the email' do
        @contact_form.headers[:from].should == "\"#{@contact_form.name}\" <#{@contact_form.email}>"
      end

      it 'should assing the receiver' do
        @contact_form.headers[:to].should == Contactus.mailer_to
      end

      it 'should assing the subject' do
        @contact_form.headers[:subject].should == I18n.t('.contactus.contact_forms.subject')
      end

    end

  end

end