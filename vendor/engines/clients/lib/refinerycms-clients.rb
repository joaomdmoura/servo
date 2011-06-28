require 'refinerycms-base'

module Refinery
  module Clients
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "clients"
          plugin.activity = {
            :class => Client,
            :title => 'name'
          }
        end
      end
    end
  end
end
