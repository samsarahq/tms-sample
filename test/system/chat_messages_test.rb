require "application_system_test_case"

class ChatMessagesTest < ApplicationSystemTestCase
  setup do
    @chat_message = chat_messages(:one)
  end

  test "visiting the index" do
    visit chat_messages_url
    assert_selector "h1", text: "Chat messages"
  end

  test "should create chat message" do
    visit chat_messages_url
    click_on "New chat message"

    fill_in "Body", with: @chat_message.body
    fill_in "Driver", with: @chat_message.driver_id
    check "Read" if @chat_message.read
    fill_in "Sender name", with: @chat_message.sender_name
    fill_in "Sender type", with: @chat_message.sender_type
    fill_in "Sent at", with: @chat_message.sent_at
    click_on "Create Chat message"

    assert_text "Chat message was successfully created"
    click_on "Back"
  end

  test "should update Chat message" do
    visit chat_message_url(@chat_message)
    click_on "Edit this chat message", match: :first

    fill_in "Body", with: @chat_message.body
    fill_in "Driver", with: @chat_message.driver_id
    check "Read" if @chat_message.read
    fill_in "Sender name", with: @chat_message.sender_name
    fill_in "Sender type", with: @chat_message.sender_type
    fill_in "Sent at", with: @chat_message.sent_at.to_s
    click_on "Update Chat message"

    assert_text "Chat message was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat message" do
    visit chat_message_url(@chat_message)
    click_on "Destroy this chat message", match: :first

    assert_text "Chat message was successfully destroyed"
  end
end
