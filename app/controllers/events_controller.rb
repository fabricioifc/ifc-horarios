class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_date).page params[:page]
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Aula cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Aula atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    # respond_to do |format|
      # if !@event.recurring_event.nil? && params[:atualizar_proximos]
      #   Event.where(recurring_event_id: @event.recurring_event_id).where('start_date::date >= ?', event_params[:start_date].to_date).destroy_all
      #
      #   @recurring_event = RecurringEvent.find(@event.recurring_event_id)
      #
      #   @recurring_event.schedule_recurring_events.each do |event|
      #     @recurring_event.events << Event.new(title: @recurring_event.title,
      #       color: @recurring_event.color, recurring_event: @recurring_event,
      #       turma_id: params[:outros][:turma_id],
      #       discipline_id: params[:outros][:discipline_id],
      #       start_date: formatar_data_evento(event, @recurring_event.start_date),
      #       end_date: formatar_data_evento(event, @recurring_event.end_date)
      #     )
      #   end
      #   format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @recurring_event }
      #
      # else
        # if @event.update(event_params)
        #   format.html { redirect_to @event, notice: 'Aula atualizada com sucesso.' }
        #   format.json { render :show, status: :ok, location: @event }
        # else
        #   format.html { render :edit }
        #   format.json { render json: @event.errors, status: :unprocessable_entity }
        # end
      # end
    # end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Events was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :date_range, :start_date, :end_date, :color, :turma_id, :discipline_id, :atualizar_todos, :atualizar_proximos)
    end
end
