FactoryGirl.define do

  factory :contact_form, :class => 'Contactus::ContactForm' do
    name "Bill Hicks"
    email "beelzebozo@example.com"
    message "If you think you’re free, try going somewhere without fucking money, okay?"
  end

end