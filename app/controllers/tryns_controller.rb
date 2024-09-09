class TrynsController < ApplicationController
  before_action :set_tryn, only: %i[ show edit update destroy ]

  # GET /tryns or /tryns.json
  def index
    @tryns = Tryn.all
  end

  # GET /tryns/1 or /tryns/1.json
  def show
  end

  # GET /tryns/new
  def new
    @tryn = Tryn.new
  end

  # GET /tryns/1/edit
  def edit
  end

  # POST /tryns or /tryns.json
  def create
    @tryn = Tryn.new(tryn_params)

    respond_to do |format|
      if @tryn.save
        format.html { redirect_to tryn_url(@tryn), notice: "Tryn was successfully created." }
        format.json { render :show, status: :created, location: @tryn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tryn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tryns/1 or /tryns/1.json
  def update
    respond_to do |format|
      if @tryn.update(tryn_params)
        format.html { redirect_to tryn_url(@tryn), notice: "Tryn was successfully updated." }
        format.json { render :show, status: :ok, location: @tryn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tryn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tryns/1 or /tryns/1.json
  def destroy
    @tryn.destroy

    respond_to do |format|
      format.html { redirect_to tryns_url, notice: "Tryn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tryn
      @tryn = Tryn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tryn_params
      params.require(:tryn).permit(:name, :description, :price)
    end
end
