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

    context 'extra fields' do

      describe 'optional_extra_fields' do

        it 'should create raise an exception if the extra_fields has not been defined' do
          expect{
            FactoryGirl.build(:contact_form, foo: 'foo', bar: 'bar')
          }.to raise_error NoMethodError
        end

        it 'should create two extra fields' do
          Contactus.extra_fields = %w(foo bar)
          @contact_form =  FactoryGirl.build(:contact_form, foo: 'foo', bar: 'bar')
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
          @contact_form =  FactoryGirl.build(:contact_form, mi: 'fa', mi: 'fa')
        end
      end

    end

  end

end