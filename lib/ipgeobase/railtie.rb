module Ipgeobase
  class Railtie < Rails::Railtie
    rake_tasks do
      load "ipgeobase/tasks.rake"
    end
  end
end

