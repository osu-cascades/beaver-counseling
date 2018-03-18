class SessionRatingFormsController < ApplicationController
  before_action :set_session_rating_form, only: [:show, :edit, :update, :destroy]

  # GET /session_rating_forms
  # GET /session_rating_forms.json
  def index
    @session_rating_forms = SessionRatingForm.all
  end

  # GET /session_rating_forms/1
  # GET /session_rating_forms/1.json
  def show
  end

  # GET /session_rating_forms/new
  def new
    @session_rating_form = SessionRatingForm.new
  end

  # GET /session_rating_forms/1/edit
  def edit
  end

  # POST /session_rating_forms
  # POST /session_rating_forms.json
  def create
    @session_rating_form = SessionRatingForm.new(session_rating_form_params)

    respond_to do |format|
      if @session_rating_form.save
        format.html { redirect_to @session_rating_form, notice: 'Session rating form was successfully created.' }
        format.json { render :show, status: :created, location: @session_rating_form }
      else
        format.html { render :new }
        format.json { render json: @session_rating_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_rating_forms/1
  # PATCH/PUT /session_rating_forms/1.json
  def update
    respond_to do |format|
      if @session_rating_form.update(session_rating_form_params)
        format.html { redirect_to @session_rating_form, notice: 'Session rating form was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_rating_form }
      else
        format.html { render :edit }
        format.json { render json: @session_rating_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_rating_forms/1
  # DELETE /session_rating_forms/1.json
  def destroy
    @session_rating_form.destroy
    respond_to do |format|
      format.html { redirect_to session_rating_forms_url, notice: 'Session rating form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_rating_form
      @session_rating_form = SessionRatingForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_rating_form_params
      params.require(:session_rating_form).permit(:client_number, :date, :room_num, :effectiveness, :focus, :relationship, :care, :start_stress, :end_stress, :optional_info)
    end
end
