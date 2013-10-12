$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "contactus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "contactus"
  s.version     = Contactus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jose Carrion"]
  s.email       = ["joseloc@gmail.com"]
  s.homepage    = "http://github.com/joselo/contactus"
  s.summary     = "Contactus is a simple Ruby on Rails gem that generate a contact form for your site."
  s.description = "Contactus is a simple Ruby on Rails gem that generate a contact form for your site."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "mail_form", "~> 1.5.0"
  s.add_dependency "haml-rails", "~> 0.4"
  s.add_dependency "simple_form", "~> 3.0.0"
  s.add_dependency "rails-i18n", "~> 0.7.4"

  s.add_development_dependency "sqlite3", "~> 1.3.8"
  s.add_development_dependency "rspec-rails", "~> 2.14.0"
  s.add_development_dependency "capybara", "~> 2.1.0"
  s.add_development_dependency "factory_girl_rails", "~> 4.2.1"
  s.add_development_dependency "shoulda-matchers", "~> 2.4.0"

  s.test_files = Dir["spec/**/*"]
end
