class SportsController < ApplicationController

  def index
    @sports = Live.instance.sports
  end

  def show
    @sport = Live.instance.sport params[:id]
  end

end
