json.extract! chat_message, :id, :driver_id, :body, :sender_name, :sender_type, :read, :sent_at, :created_at, :updated_at
json.url chat_message_url(chat_message, format: :json)
