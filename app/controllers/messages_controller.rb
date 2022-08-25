class MessagesController < ApplicationController


    def index
        @messages = Message.all
    end

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.save
        redirect_to message_path(@message)
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        @message = Message.find(params[:id])
        @message.update(message_params)
        redirect_to message_path(@message)
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to messages_path, status: :see_other
    end

    private

    def message_params
        params.require(:message).permit(:title, :body)
    end
    
end
