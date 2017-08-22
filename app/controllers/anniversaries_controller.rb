class AnniversariesController < ApplicationController
  before_action :set_anniversary, only: [:show, :edit, :update, :destroy]

  # GET /anniversaries
  # GET /anniversaries.json
  def index
    @anniversaries = Anniversary.all
  end

  # GET /anniversaries/1
  # GET /anniversaries/1.json
  def show
  end

  def today
    @todayEvents = Anniversary.where(month: Date.today.month, day: Date.today.day)
  end

  # GET /anniversaries/new
  def new
    @anniversary = Anniversary.new
  end

  # GET /anniversaries/1/edit
  def edit
  end

  # POST /anniversaries
  # POST /anniversaries.json
  def create
    @anniversary = Anniversary.new(anniversary_params)

    respond_to do |format|
      if @anniversary.save
        format.html { redirect_to @anniversary, notice: 'Anniversary was successfully created.' }
        format.json { render :show, status: :created, location: @anniversary }
      else
        format.html { render :new }
        format.json { render json: @anniversary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anniversaries/1
  # PATCH/PUT /anniversaries/1.json
  def update
    respond_to do |format|
      if @anniversary.update(anniversary_params)
        format.html { redirect_to @anniversary, notice: 'Anniversary was successfully updated.' }
        format.json { render :show, status: :ok, location: @anniversary }
      else
        format.html { render :edit }
        format.json { render json: @anniversary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anniversaries/1
  # DELETE /anniversaries/1.json
  def destroy
    @anniversary.destroy
    respond_to do |format|
      format.html { redirect_to anniversaries_url, notice: 'Anniversary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anniversary
      @anniversary = Anniversary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anniversary_params
      result=params.require(:anniversary).permit(:name, :date, :description)
      logger.debug result
      result["year"] =result["date(1i)"]
      result["month"] =result["date(2i)"]
      result["day"] =result["date(3i)"]
      return result
    end
end
