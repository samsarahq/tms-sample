class ChatMessagesController < ApplicationController
  # GET /chat_messages or /chat_messages.json
  def index
    @chat_messages = current_user.chat_messages.all
  end

  # GET /chat_messages/new
  def new
    @chat_message = current_user.chat_messages.new
  end

  # POST /chat_messages or /chat_messages.json
  def create
    drivers = Driver.where(samsara_id: params[:driver_ids])
    Samsara::MessagesService.new(current_user).send_message(
      drivers.pluck(:samsara_id),
      params[:body]
    )

    respond_to do |format|
      format.html { redirect_to driver_path(drivers.first), notice: "Chat message was successfully created." }
      format.json { render :show, status: :created, location: @chat_message }
    end
  end
end
