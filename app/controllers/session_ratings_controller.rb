class SessionRatingsController < ApplicationController
  before_action :set_session_rating, only: [:show, :edit, :update, :destroy]

  # GET /session_ratings
  # GET /session_ratings.json
  def index
    @session_ratings = SessionRating.all
  end

  # GET /session_ratings/1
  # GET /session_ratings/1.json
  def show
  end

  # GET /session_ratings/new
  def new
    @session_rating = SessionRating.new
  end

  # GET /session_ratings/1/edit
  def edit
  end

  # POST /session_ratings
  # POST /session_ratings.json
  def create
    @session_rating = SessionRating.new(session_rating_params)

    respond_to do |format|
      if @session_rating.save
        format.html { redirect_to @session_rating, notice: 'Session rating was successfully created.' }
        format.json { render :show, status: :created, location: @session_rating }
      else
        format.html { render :new }
        format.json { render json: @session_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_ratings/1
  # PATCH/PUT /session_ratings/1.json
  def update
    respond_to do |format|
      if @session_rating.update(session_rating_params)
        format.html { redirect_to @session_rating, notice: 'Session rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_rating }
      else
        format.html { render :edit }
        format.json { render json: @session_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_ratings/1
  # DELETE /session_ratings/1.json
  def destroy
    @session_rating.destroy
    respond_to do |format|
      format.html { redirect_to session_ratings_url, notice: 'Session rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_rating
      @session_rating = SessionRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_rating_params
      params.require(:session_rating).permit(:client_number, :date, :room_num, :effectiveness, :focus, :relationship, :care, :start_stress, :end_stress, :optional_info)
    end
end
