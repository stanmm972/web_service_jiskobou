class MessagesController < ApplicationController


    

    def new
       # @message = Message.new
       @user = User.find(params[:user_id])
       @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        @user = User.find(params[:user_id])
        @message.user = @user
        if @message.save
            redirect_to user_path(@user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @message = Message.find(params[:user_id])
        @message.destroy
        redirect_to user_path(@message.user), status: :see_other
    end

    private

    def message_params
        params.require(:message).permit(:title, :body, :document)
    end
    
end
