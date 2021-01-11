class UsersController < ApplicationController
  before_action :set_user
  def mypage
  end

  def edit
  end

  private
    def set_user
      if user_signed_in?
        @user = current_user
      else
        redirect_to new_user_session_path
      end
    end
end
