class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cats = Group.where(user: current_user).includes(icon_attachment: :blob)
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(params.require(:group).permit(:name, :icon))
    group.user = current_user

    if group.save
      flash[:success] = 'Category added successfully'
    else
      flash.now[:error] = 'Error: Category could not be added'
    end
    redirect_to groups_path
  end

  def show
    @cat = Group.find(params[:id])
    @opers = Groupoperation.where(group_id: params[:id]).order(created_at: :desc).includes([:operation])
  end
end
