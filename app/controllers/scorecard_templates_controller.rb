class ScorecardTemplatesController < ApplicationController
  before_action :set_scorecard_template, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /scorecard_templates
  # GET /scorecard_templates.json
  def index
    @scorecard_templates = ScorecardTemplate.where(course_id: params[:course_id])
  end

  # GET /scorecard_templates/1
  # GET /scorecard_templates/1.json
  def show
  end

  # GET /scorecard_templates/new
  def new
    Tools.ap 'HELLO'
    @scorecard_template = ScorecardTemplate.new
  end

  # GET /scorecard_templates/1/edit
  def edit
  end

  # POST /scorecard_templates
  # POST /scorecard_templates.json
  def create
    Tools.ap @course.to_json
    @scorecard_template = ScorecardTemplate.new(scorecard_template_params)
    @scorecard_template.user_id = current_user.id
    @scorecard_template.course_id = params[:course_id]

    respond_to do |format|
      if @scorecard_template.save
        format.html { redirect_to @course, flash: {success: 'Scorecard template was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /scorecard_templates/1
  # PATCH/PUT /scorecard_templates/1.json
  def update
    respond_to do |format|
      if @scorecard_template.update(scorecard_template_params)
        format.html { redirect_to @course, flash: {success: 'Scorecard template was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /scorecard_templates/1
  # DELETE /scorecard_templates/1.json
  def destroy
    @scorecard_template.destroy
    respond_to do |format|
      format.html { redirect_to @course, flash: {success: 'Scorecard template was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scorecard_template
      @scorecard_template = ScorecardTemplate.find(params[:id])
    end

    def set_course
      @course = Course.find params[:course_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scorecard_template_params
      params.require(:scorecard_template).permit(:user_id, :course_id, :tee, :holes, :slope, :rating, :pars, :yards, :handicaps)
    end
end
