class GroupsController < ApplicationController
    def index
      @groups = Group.all
    end
  
    def show
      @group = Group.find(params[:id])
    end
  
    def create
      @group = Group.new(group_params)
  
      if @group.save
        render json: @group, status: :created
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @group = Group.find(params[:id])
  
      if @group.update(group_params)
        render json: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @group = Group.find(params[:id])
      @group.destroy
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name)
    end
  end