class GroupMembersController < ApplicationController
    def index
      @group_members = GroupMember.all
    end
  
    def show
      @group_member = GroupMember.find(params[:id])
    end
  
    def create
      @group_member = GroupMember.new(group_member_params)
  
      if @group_member.save
        render json: @group_member, status: :created
      else
        render json: @group_member.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @group_member = GroupMember.find(params[:id])
  
      if @group_member.update(group_member_params)
        render json: @group_member
      else
        render json: @group_member.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @group_member = GroupMember.find(params[:id])
      @group_member.destroy
    end
  
    private
  
    def group_member_params
      params.require(:group_member).permit(:user_id, :group_id)
    end
  end