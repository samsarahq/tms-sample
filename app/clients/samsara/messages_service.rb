module Samsara
  class MessagesService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def send_message(driver_ids, message)
      @client.send_message(driver_ids, message)

      # Wait a second, then refetch messages
      messages = @client.messages
      messages.each do |message|
        driver = Driver.find_by!(samsara_id: message["driverId"])

        ChatMessage.find_or_create_by!(
          user: @user,
          driver: driver,
          body: message["text"],
          sent_at: message["sentAt"],
          sender_name: message["sender"]["name"],
          sender_type: message["sender"]["type"],
          read: message["isRead"]
        )
      end
    end
  end
end
