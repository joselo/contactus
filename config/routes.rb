Rails.application.routes.draw do

  namespace :contactus do
    resources :contact_forms, :only => [:new, :create]
  end

  get 'contact' => 'contactus/contact_forms#new', :as => :contact

end