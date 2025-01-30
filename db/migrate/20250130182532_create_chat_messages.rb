class CreateChatMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_messages do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :body, null: false, default: ""
      t.string :sender_name
      t.string :sender_type
      t.boolean :read, default: false, null: false
      t.datetime :sent_at

      t.timestamps
    end
  end
end
