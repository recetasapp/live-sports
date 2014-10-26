class SportsController < ApplicationController

  def index
    @sports = Live.instance.sports
  end

  def show
  end

end
