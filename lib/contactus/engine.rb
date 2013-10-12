require 'mail_form'
require 'haml-rails'
require 'simple_form'
require 'rails-i18n'

module Contactus
  class Engine < ::Rails::Engine

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir:     'spec/factories'
      g.assets false
      g.helper false
    end

  end
end