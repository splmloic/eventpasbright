class EventsController < ApplicationController
    before_action :authenticate_user!, exept: [:index]
    def index
        @events = Event.all
    end
    def show
        @event = Event.includes(:admin).find(params[:id])
    end
    def new
        #besoin de rien mon new est un form qui fait un post create
        @user = current_user
    end
    def create
        @user = current_user
        @event = Event.new(event_params.merge(admin: current_user))
      
          if @event.save # essaie de sauvegarder en base
            # si ça marche, il redirige vers la page d'index du site
            flash[:notice] = "évènement créé avec succès!"
            redirect_to events_path
          else
            # sinon, il render la view new (qui est celle sur laquelle on est déjà)
            flash[:notice] = "évènement pas crée CHEH!"
            render :new
          end
    end

    private

    def event_params
        params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
