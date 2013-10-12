require 'rails/generators'

module Contactus
  module Tasks
    class Install
      class << self

        def run
          copy_initializer_file
          puts "Done!"
        end

        def copy_initializer_file
          print "Copying initializer file...\n"
          app_path = Rails.root.join("config/initializers")
          copier.copy_file File.join(gem_path, 'lib/templates/contactus.rb'), File.join(app_path, 'contactus.rb')
        end

        private

        def gem_path
          File.expand_path('../../..', File.dirname(__FILE__))
        end

        def copier
          unless @copier
            Rails::Generators::Base.source_root(gem_path)
            @copier = Rails::Generators::Base.new
          end
          @copier
        end
      end
    end
  end
end