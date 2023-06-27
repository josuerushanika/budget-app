class UsersController < ApplicationController
  def index; end

  def show
    if params[:id] == 'sign_out'
      sign_out_and_redirect
    else
      find_user
    end
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to authenticated_root_path
  end
end
