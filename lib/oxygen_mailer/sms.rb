# encoding: utf-8
module OxygenMailer
  class Client
    
    def new_sms(sender, recipient, message)
      params = {
        :api_key => @@sms_api_key,
        :api_secret => @@sms_api_secret,
        :sender => sender,
        :recipient => recipient,
        :message => message
      }
      post("sms/new", params)
    end

    def new_bulk_sms(data_file_path, total_count)
      params = {
        :api_key => @@sms_api_key,
        :api_secret => @@sms_api_secret,
        :total_message_count => total_count,
        :data_file_name => File.basename(data_file_path)
      }
      res = post("sms/new_bulk", params)

      # ToDo: catch exception
      if res && res.code == "200"
        result = JSON.parse(res.body)
        if result['status'] == "enqueue"
          Net::SFTP.start(@@ssh_host, @@ssh_user, :key_data => @@ssh_private_key) do |sftp|
            sftp.upload!(data_file_path, result['data_file_path'])
          end
          return true
        end
        return false
      end
      return false
    end

  end
end
