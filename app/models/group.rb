class Group < ApplicationRecord
  has_many :budget_groups
  has_many :budgets, through: :budget_groups
  belongs_to :author, foreign_key: :author_id, class_name: 'User'

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount_by_group(group_id)
    budgets.joins(:budget_groups).where(budget_groups: { group_id: group_id }).sum('budgets.amount')
  end
end
