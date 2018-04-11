class RecurringEventsController < ApplicationController
  before_action :set_recurring_event, only: [:show, :edit, :update, :destroy]

  # GET /recurring_events
  # GET /recurring_events.json
  def index
    @recurring_events = RecurringEvent.all
  end

  # GET /recurring_events/1
  # GET /recurring_events/1.json
  def show
  end

  # GET /recurring_events/new
  def new
    @recurring_event = RecurringEvent.new
  end

  # GET /recurring_events/1/edit
  def edit
    @recurring_event.date_range = "#{@recurring_event.events.first.start_date} #{@recurring_event.events.first.end_date}"
  end

  # POST /recurring_events
  # POST /recurring_events.json
  def create
    @recurring_event = RecurringEvent.new(recurring_event_params)

    respond_to do |format|
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
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully created.' }
        format.json { render :show, status: :created, location: @recurring_event }
      else
        format.html { render :new }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurring_events/1
  # PATCH/PUT /recurring_events/1.json
  def update
    respond_to do |format|
      if @recurring_event.update(recurring_event_params)
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurring_event }
      else
        format.html { render :edit }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_events/1
  # DELETE /recurring_events/1.json
  def destroy
    @recurring_event.destroy
    respond_to do |format|
      format.html { redirect_to recurring_events_url, notice: 'Recurring event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_event
      @recurring_event = RecurringEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_event_params
      params.require(:recurring_event).permit(:title, :anchor, :frequency, :color, :start_date, :end_date, :date_range)
    end

    def formatar_data_evento event, data_hora
      datetojoin = Time.parse(event.to_s).strftime("%Y-%m-%d")
      timetojoin = Time.parse(data_hora.to_s).strftime("%T")
      joined_datetime = Time.parse(datetojoin +" "+ timetojoin).strftime("%F %T")
    end
end
