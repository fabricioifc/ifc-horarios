class VisitorsController < ApplicationController
  def index
    params[:year] = Date.today.year
    params[:month] = Date.today.month
    @recurring_events = RecurringEvent.all
  end
end
