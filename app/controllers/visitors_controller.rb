class VisitorsController < ApplicationController
  def index
    params[:year] = Date.today.year
    params[:month] = Date.today.month
    @events = Event.all
  end
end
