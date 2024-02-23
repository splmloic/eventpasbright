class AttendancesController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user
    end
    def new
        @user = current_user
        #@event = Event.find(params[:id])
    end
    def create

    end
end
