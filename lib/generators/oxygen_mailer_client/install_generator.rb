module OxygenMailerClient
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a OxygenMailer::Client initializer files to your application."

      def copy_initializer
        template "oxygen_mailer_client.rb", "config/initializers/oxygen_mailer_client.rb"
      end

    end
  end
end
