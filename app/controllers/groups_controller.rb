class GroupsController < ApplicationController
    def index
        @group = Group.includes(:budgets).where(author_id: current_user.id)
    end
end
