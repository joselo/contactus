# -*- coding: utf-8 -*-

require 'spec_helper'

feature 'Contact Form', %q{
  As a user
  I can send a message using the contact form
} do

  before do
    Contactus.mailer_to = "webmaster@example.com"
    visit "/contact"
  end

  scenario 'without mandatory fields' do
    click_button 'Enviar'

    page.should have_content "Nombres y Apellidosno puede estar en blanco"
    page.should have_content "Correo electrónicono puede estar en blanco"
    page.should have_content "Comentariosno puede estar en blanco"
  end

  scenario 'with mandatory fields' do
    fill_in "Nombres y Apellidos", with: 'Bill Hicks'
    fill_in "Correo electrónico", with: 'beelzebozo@example.com'
    fill_in "Comentarios", with: "If you think you’re free, try going somewhere without fucking money, okay?"

    click_button 'Enviar'

    page.should have_content "Gracias por escribirnos, pronto nos pondremos en contacto contigo."
  end

  scenario 'spam email' do
    fill_in "Nombres y Apellidos", with: 'Bill Hicks'
    fill_in "Correo electrónico", with: 'beelzebozo@example.com'
    fill_in "Comentarios", with: "If you think you’re free, try going somewhere without fucking money, okay?"
    fill_in "Nickname", with: "Hey there"

    click_button 'Enviar'

    page.should have_content "Lo sentimos, este mensaje aparece como spam y no se entregó."
  end

end