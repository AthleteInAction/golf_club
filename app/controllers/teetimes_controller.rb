class TeetimesController < ApplicationController
  before_action :set_teetime, only: [:show, :edit, :update, :destroy]

  # GET /teetimes
  # GET /teetimes.json
  def index
    @event = Event.find params[:event_id]
    @teetimes = Teetime.all
  end

  # GET /teetimes/1
  # GET /teetimes/1.json
  def show
  end

  # GET /teetimes/new
  def new
    @teetime = Teetime.new
  end

  # GET /teetimes/1/edit
  def edit
  end

  # POST /teetimes
  # POST /teetimes.json
  def create
    @teetime = Teetime.new(teetime_params)

    respond_to do |format|
      if @teetime.save
        format.html { redirect_to @teetime, notice: 'Teetime was successfully created.' }
        format.json { render :show, status: :created, location: @teetime }
      else
        format.html { render :new }
        format.json { render json: @teetime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teetimes/1
  # PATCH/PUT /teetimes/1.json
  def update
    respond_to do |format|
      if @teetime.update(teetime_params)
        format.html { redirect_to @teetime, notice: 'Teetime was successfully updated.' }
        format.json { render :show, status: :ok, location: @teetime }
      else
        format.html { render :edit }
        format.json { render json: @teetime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teetimes/1
  # DELETE /teetimes/1.json
  def destroy
    @teetime.destroy
    respond_to do |format|
      format.html { redirect_to teetimes_url, notice: 'Teetime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teetime
      @teetime = Teetime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teetime_params
      params.require(:teetime).permit(:user_id, :event_id, :course_id, :golfer_id, :teetime, :round_id)
    end
end
