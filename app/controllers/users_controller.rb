class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :good_user, only: [:show]
    
    def show
        @user = User.find(params[:id])
        @admins = Event.all.where(admin_id: params[:id])
    end

    private

    def good_user
      unless current_user == User.find(params[:id])
        flash[:danger] = "Please log in."
        redirect_to events_path
      end
    end

end
