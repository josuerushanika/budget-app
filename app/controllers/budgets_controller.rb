# It provide common functionality for Entries
class BudgetsController < ApplicationController
  def index
   @group = Group.find(params[:group_id])
   @budgets = @group.budgets.includes(:budget_groups).order(created_at: :desc)
  end 
  
end
