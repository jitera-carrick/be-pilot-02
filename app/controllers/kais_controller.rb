class KaisController < ApplicationController
  before_action :set_kai, only: %i[ show edit update destroy ]

  # GET /kais or /kais.json
  def index
    @kais = Kai.all
  end

  # GET /kais/1 or /kais/1.json
  def show
  end

  # GET /kais/new
  def new
    @kai = Kai.new
  end

  # GET /kais/1/edit
  def edit
  end

  # POST /kais or /kais.json
  def create
    @kai = Kai.new(kai_params)

    respond_to do |format|
      if @kai.save
        format.html { redirect_to kai_url(@kai), notice: "Kai was successfully created." }
        format.json { render :show, status: :created, location: @kai }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kais/1 or /kais/1.json
  def update
    respond_to do |format|
      if @kai.update(kai_params)
        format.html { redirect_to kai_url(@kai), notice: "Kai was successfully updated." }
        format.json { render :show, status: :ok, location: @kai }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kais/1 or /kais/1.json
  def destroy
    @kai.destroy

    respond_to do |format|
      format.html { redirect_to kais_url, notice: "Kai was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kai
      @kai = Kai.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kai_params
      params.require(:kai).permit(:name, :description, :price)
    end
end
