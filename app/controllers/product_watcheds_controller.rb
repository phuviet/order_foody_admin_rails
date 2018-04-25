class ProductWatchedsController < ApplicationController
  before_action :set_product_watched, only: %i[show edit update destroy]

  # GET /product_watcheds
  # GET /product_watcheds.json
  def index
    @product_watcheds = ProductWatched.all
  end

  # GET /product_watcheds/1
  # GET /product_watcheds/1.json
  def show; end

  # GET /product_watcheds/new
  def new
    @product_watched = ProductWatched.new
  end

  # GET /product_watcheds/1/edit
  def edit; end

  # POST /product_watcheds
  # POST /product_watcheds.json
  def create
    @product_watched = ProductWatched.new(product_watched_params)

    respond_to do |format|
      if @product_watched.save
        format.html { redirect_to @product_watched, notice: 'Product watched was successfully created.' }
        format.json { render :show, status: :created, location: @product_watched }
      else
        format.html { render :new }
        format.json { render json: @product_watched.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_watcheds/1
  # PATCH/PUT /product_watcheds/1.json
  def update
    respond_to do |format|
      if @product_watched.update(product_watched_params)
        format.html { redirect_to @product_watched, notice: 'Product watched was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_watched }
      else
        format.html { render :edit }
        format.json { render json: @product_watched.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_watcheds/1
  # DELETE /product_watcheds/1.json
  def destroy
    @product_watched.destroy
    respond_to do |format|
      format.html { redirect_to product_watcheds_url, notice: 'Product watched was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_watched
    @product_watched = ProductWatched.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_watched_params
    params.require(:product_watched).permit(:user_id, :product_id, :deleted_at)
  end
end
