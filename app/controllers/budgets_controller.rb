# It provide common functionality for Entries
class BudgetsController < ApplicationController
  def index
   @group = Group.find(params[:group_id])
   @budgets = @group.budgets.includes(:budget_groups).order(created_at: :desc)
  end 

  def new
    @budget = Budget.new
    @groups = Group.find(params[:params_id])

    return unless @groups.nil
    @group = []
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.author_id = current_user.id 

    if @budget.save
      @budget_group = BudgetGroup.new(budget_id: @b)
  end

end
