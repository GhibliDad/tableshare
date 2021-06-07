class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @event = Event.find(params[:event_id])
    @chatroom = @event.chatroom
    @message.user = current_user
    @message.chatroom = @chatroom
    authorize @message
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        content: render_to_string(partial: "message", locals: { message: @message }),
        user: @message.user.id,
        guest: render_to_string(partial: "guest_message", locals: { message: @message })
      )
      redirect_to event_path(@event, anchor: "message-#{@message.id}")
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
