require 'spec_helper'

module Contactus

  describe ContactForm do

    before do
      Contactus.mailer_to = "webmaster@example.com"
    end

    describe 'headers' do

      context 'default headers' do

        before do
          @contact_form = FactoryGirl.build(:contact_form)
        end

        it 'should assing the email' do
          @contact_form.headers[:from].should == "\"#{@contact_form.name}\" <#{@contact_form.email}>"
        end

        it 'should assing the receiver' do
          @contact_form.headers[:to].should == Contactus.mailer_to
        end

        it 'should not assing the cc' do
          @contact_form.headers[:cc].should be_nil
        end

        it 'should assing the subject' do
          @contact_form.headers[:subject].should == I18n.t('.contactus.contact_forms.subject')
        end

      end

      context 'with custom variables' do

        before do
          Contactus.mailer_cc = "cc@example.com"
          Contactus.mailer_bcc = ["bcc1@example.com", "bcc2@example.com"]
          Contactus.mailer_from = "from@example.com"
          @contact_form = FactoryGirl.build(:contact_form)
        end

        it 'should assing the cc' do
          @contact_form.headers[:cc].should == Contactus.mailer_cc
        end

        it 'should assing the bcc' do
          @contact_form.headers[:bcc].should == Contactus.mailer_bcc
        end

        it 'should assing the from' do
          @contact_form.headers[:from].should == Contactus.mailer_from
        end

      end

    end

    context 'extra fields' do

      describe 'optional_extra_fields' do

        it 'should create raise an exception if the extra_fields has not been defined' do
          expect{
            FactoryGirl.build(:contact_form, foo: 'foo', bar: 'bar')
          }.to raise_error NoMethodError
        end

        it 'should create two extra fields' do
          Contactus.extra_fields = %w(foo bar)
          @contact_form =  ContactForm.new(foo: 'foo', bar: 'bar')
        end
      end

      describe 'required_extra_fields' do

        it 'should create raise an exception if the required_extra_fields has not been defined' do
          expect{
            FactoryGirl.build(:contact_form, mi: 'mi', fa: 'fa')
          }.to raise_error NoMethodError
        end

        it 'should create two extra fields' do
          Contactus.required_extra_fields = %w(mi fa)
          @contact_form = ContactForm.new(mi: 'fa', mi: 'fa')
        end
      end

    end

  end

end