# It provide common functionality for Entries
class BudgetsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @budgets = @group.budgets.includes(:budget_groups).order(created_at: :desc)
  end

  def new
    @budget = Budget.new
    @group = Group.find(params[:group_id])

    return unless @group.nil?

    @group = []
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.author_id = current_user.id

    if @budget.save
      @budget_group = BudgetGroup.new(budget_id: @budget.id, group_id: params[:group_id])
      redirect_to user_group_budgets_path(current_user) if @budget_group.save
    else
      render :new
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :amount)
  end
end
