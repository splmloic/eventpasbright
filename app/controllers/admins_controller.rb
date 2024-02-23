class AdminsController < ApplicationController
    before_action :require_admin
    def index
        @user = current_user
    end

    private

    def require_admin
      unless current_user.is_admin
        flash[:alert] = "Vous n'avez pas l'autorisation d'accéder à cette page."
        redirect_to root_path
      end
    end
end
