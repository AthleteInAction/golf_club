class EventsController < ApplicationController
  # before_action :admin_authorize,except: [:index,:show,:register]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show

    @event_users = User.all.joins("JOIN event_users ON users.id = event_users.user_id").where("event_users.event_id = #{params[:id]}")
    @event_user = EventUser.where(event_id: params[:id],user_id: current_user.id)
    @is_registered = @event_user.count > 0
    @event_user = @event_user.first

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
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register

    @event = Event.find params[:event_id]
    @event_user = EventUser.where(event_id: @event.id,user_id: current_user.id).count

    if @event_user > 0
      redirect_to @event, flash: { warning: 'You already have been registered for this event!' }
      return false
    else
      @event_user = EventUser.new event_id: params[:event_id],user_id: current_user.id
    end

    respond_to do |format|

      if @event_user.save
        format.html { redirect_to @event, flash: { success: 'You have been registered for this event!' } }
      else
        format.html { render :show }
      end

    end

  end

  def unregister

    @event = Event.find params[:event_id]
    @event_user = EventUser.find params[:id]
    
    EventUser.transaction do

      @event_user.destroy!
      Teetime.where(event_id: @event.id,golfer_id: current_user.id).destroy_all

    end

    redirect_to @event, flash: { warning: 'You have been un-registered!' }

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:course_id, :user_id, :title, :description, :start_date, :end_date)
    end
end
