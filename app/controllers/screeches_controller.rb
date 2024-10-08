class ScreechesController < ApplicationController
  before_action :set_screech, only: %i[ show edit update destroy ]

  # GET /screeches or /screeches.json
  def index
    @screeches = Screech.all
    if params[:query_text].present?
      @screeches = @screeches.search_full_text(params[:query_text])
    end
  end

  # GET /screeches/1 or /screeches/1.json
  def show
  end

  # GET /screeches/new
  def new
    @screech = Screech.new
  end

  # GET /screeches/1/edit
  def edit
  end

  # POST /screeches or /screeches.json
  def create
    @screech = Screech.new(screech_params)

    respond_to do |format|
      if @screech.save
        format.html { redirect_to @screech, notice: "Screech was successfully created." }
        format.json { render :show, status: :created, location: @screech }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @screech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screeches/1 or /screeches/1.json
  def update
    respond_to do |format|
      if @screech.update(screech_params)
        format.html { redirect_to @screech, notice: "Screech was successfully updated." }
        format.json { render :show, status: :ok, location: @screech }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @screech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screeches/1 or /screeches/1.json
  def destroy
    @screech.destroy!

    respond_to do |format|
      format.html { redirect_to screeches_path, status: :see_other, notice: "Screech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screech
      @screech = Screech.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screech_params
      params.require(:screech).permit(:description, :username)
    end
end
