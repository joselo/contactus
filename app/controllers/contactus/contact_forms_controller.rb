module Contactus

  class ContactFormsController < ApplicationController 

    def new 
      @contact_form = ContactForm.new
    end

    def create
      begin
        @contact_form = ContactForm.new(params[:contactus_contact_form])
        @contact_form.request = request

        if !@contact_form.deliver
          if @contact_form.spam?
            flash[:error] = I18n.t('.contactus.contact_forms.spam')
            redirect_to root_path
          else
            render :new
          end
        end

      rescue ScriptError
        flash[:error] = I18n.t('.contactus.contact_forms.spam')
        redirect_to root_path
      end
    end

  end

end