class RecurringEventsController < ApplicationController
  before_action :set_recurring_event, only: [:show, :edit, :update, :destroy]

  def index
    @recurring_events = RecurringEvent.all
  end

  def show
  end

  def new
    @recurring_event = RecurringEvent.new
  end

  def edit
  end

  def create
    # binding.pry
    @recurring_event = RecurringEvent.new(recurring_event_params)
    if @recurring_event.save

      @recurring_event.schedule_recurring_events.each do |event|
        @recurring_event.events << Event.new(title: @recurring_event.title,
          color: @recurring_event.color, recurring_event: @recurring_event,
          turma_id: params[:outros][:turma_id],
          discipline_id: params[:outros][:discipline_id],
          start_date: formatar_data_evento(event, @recurring_event.start_date),
          end_date: formatar_data_evento(event, @recurring_event.end_date)
        )
      end
    end
  end

  def update
    if params[:event]
      @recurring_event.update(anchor: params[:event][:start])
    else
      @recurring_event.update(recurring_event_params)
    end
  end

  def destroy
    @recurring_event.destroy
  end

  private

  def set_recurring_event
    @recurring_event = RecurringEvent.find(params[:id])
  end

  def recurring_event_params
    params.require(:recurring_event).permit(:title, :anchor, :frequency, :color, :start_date, :end_date, :date_range)
  end

  def formatar_data_evento event, data_hora
    datetojoin = Time.parse(event.to_s).strftime("%Y-%m-%d")
    timetojoin = Time.parse(data_hora.to_s).strftime("%T")
    joined_datetime = Time.parse(datetojoin +" "+ timetojoin).strftime("%F %T")
  end
end
