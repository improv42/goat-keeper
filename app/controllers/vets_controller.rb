class VetsController < ApplicationController
  before_action :set_vet, only: [:show, :edit, :update, :destroy]

  # GET /vets
  # GET /vets.json
  def index
    @vets = Vet.all
  end

  # GET /vets/1
  # GET /vets/1.json
  def show
  end

  # GET /vets/new
  def new
    @vet = Vet.new
  end

  # GET /vets/1/edit
  def edit
  end

  # POST /vets
  # POST /vets.json
  def create
    @vet = Vet.new(vet_params)

    respond_to do |format|
      if @vet.save
        format.html { redirect_to @vet, notice: 'Vet was successfully created.' }
        format.json { render :show, status: :created, location: @vet }
      else
        format.html { render :new }
        format.json { render json: @vet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vets/1
  # PATCH/PUT /vets/1.json
  def update
    respond_to do |format|
      if @vet.update(vet_params)
        format.html { redirect_to @vet, notice: 'Vet was successfully updated.' }
        format.json { render :show, status: :ok, location: @vet }
      else
        format.html { render :edit }
        format.json { render json: @vet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vets/1
  # DELETE /vets/1.json
  def destroy
    @vet.destroy
    respond_to do |format|
      format.html { redirect_to vets_url, notice: 'Vet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vet
      @vet = Vet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vet_params
      params.require(:vet).permit(:doctor, :clinic_name, :phone)
    end
end
