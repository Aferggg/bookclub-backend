class FriendsController < ApplicationController
    def index
      @friends = Friend.all
    end
  
    def show
      @friend = Friend.find(params[:id])
    end
  
    def create
      @friend = Friend.new(friend_params)
  
      if @friend.save
        render json: @friend, status: :created
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @friend = Friend.find(params[:id])
  
      if @friend.update(friend_params)
        render json: @friend
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @friend = Friend.find(params[:id])
      @friend.destroy
    end
  
    private
  
    def friend_params
      params.require(:friend).permit(:user_id, :friend_id)
    end
  end