require File.expand_path('../../contactus/tasks/install', __FILE__)

namespace :contactus do
  
  desc "Install contactus"
  task :install do
    Contactus::Tasks::Install.run
  end

end