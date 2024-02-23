class Admin::UsersController < ApplicationController
  before_action :require_admin
    def index
      @users = User.all
    end
    def create

    end
    def edit
      @user = User.find(params[:id])
    end
    def update
      @user = User.find(params[:id])
      if @user.update(first_name: params[:user][:first_name],
        last_name: params[:user][:last_name],
        description: params[:user][:description])
        flash[:notice] = "Gossip créé avec succès!"
        redirect_to admin_users_path, notice: "Utilisateur Mis a jour !"
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "Utilisateur supprimé avec succès!"
    end
    private
    def require_admin
      unless current_user.is_admin?
        flash[:alert] = "Vous n'avez pas l'autorisation d'accéder à cette page."
        redirect_to root_path
      end
    end
  end