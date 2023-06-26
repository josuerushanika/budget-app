class Budget < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :budget_groups
  has_many :group, through: :budget_groups
end
