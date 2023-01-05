class MessagesController < ApplicationController
    def create
        # if userexecutor_signed_in?
            @message = current_userexecutor.messages.create(body: msg_params[:body],room_id: params[:room_id])
        # else
            # @message = current_usercustomer.messages.create(body: msg_params[:body],room_id: params[:room_id])
        # end

    end
    private
    def msg_params
        params.require(:message).permit(:body)
    end
end
