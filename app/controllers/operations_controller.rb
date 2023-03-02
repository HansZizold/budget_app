class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @groups = Group.where(user: current_user)
    @operation = Operation.new
  end

  def create
    oper = Operation.new
    oper.name = params[:operation][:name]
    oper.amount = params[:operation][:amount]
    oper.user_id = current_user.id
    oper.save

    groupoper = Groupoperation.new
    groupoper.group_id = params[:operation][:group_id]
    groupoper.operation_id = oper.id
    groupoper.save

    if groupoper.save
      flash[:success] = 'Transaction added successfully'
    else
      flash.now[:error] = 'Error: Your transaction could not be added'
    end
    redirect_to group_path(params[:operation][:group_id])
  end
end
