class EventsController < ApplicationController

  def show
    @sport = Live.instance.sport_event params[:sport_id], params[:id]
  end

end
