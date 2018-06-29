class EventsController < ApplicationController
    def create
        @event = Event.new(event_params)
        @event.user_id = params[:user_id]
        @event.save 
        redirect_to user_path(@event.user)
    end 
    
    def index
      @events = Event.all 
    end
  
     def new
        @event = Event.new 
     end
  
  def show
    @user = User.find(params[:id])
    @event = Event.new
    @event.user_id = @user.id
  end 

  

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes event_params
      flash[:notice] = 'The Event is successfully updated'
      redirect_to event_path(@event)
    else
      render :edit 
    end
  end
  
  def destroy
        @event = Event.find(params[:id]).destroy
        flash.notice = "Event has been deleted."
        redirect_to users_path
  end

    
    

    def event_params
        params.require(:event).permit(:title, :description, :date)
    end
end
