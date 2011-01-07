# encoding: utf-8

require "rubygems"
require "net/http"
require "uri"
require "net/sftp"

require "oxygen_mailer/mail"
require "oxygen_mailer/sms"

module OxygenMailer

  class Client

    attr_reader :default_params

    def initialize
    end


    ["api_base_url",
     "ssh_private_key", "ssh_host", "ssh_user",
     "sms_api_key", "sms_api_secret",
     "mail_api_key", "mail_api_secret"
    ].each do |_name|
      method_declaration = <<-EOF
        def self.#{_name}
          @@#{_name}
        end
        def self.#{_name}=(v)
          @@#{_name} = v
        end
      EOF
      class_eval method_declaration
    end


    def self.setup
      yield self
    end


    protected

      # ToDo: Catch exception
      def post(path, params)
        # ToDo: add user-agent info to request headers
        res = Net::HTTP.post_form(URI.parse(api_uri(path)), params)
        res
      end


    private

      def api_uri(path)
        "#{@@api_base_url}/#{path}"
      end



  end

end
