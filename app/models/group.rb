class Group < ApplicationRecord
  has_many :budget_groups
  has_many :budgets, through: :budget_groups
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
end
