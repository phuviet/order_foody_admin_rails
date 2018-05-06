class ShopDetailsController < ApplicationController
  before_action :set_shop_detail, only: %i[show edit update destroy]

  # GET /shop_details
  # GET /shop_details.json
  def index
    @shop_details = ShopDetail.all
  end

  # GET /shop_details/1
  # GET /shop_details/1.json
  def show; end

  # GET /shop_details/new
  def new
    @shop_detail = ShopDetail.new
  end

  # GET /shop_details/1/edit
  def edit; end

  # POST /shop_details
  # POST /shop_details.json
  def create
    @shop_detail = ShopDetail.new(shop_detail_params)

    respond_to do |format|
      if @shop_detail.save
        format.html { redirect_to @shop_detail, notice: 'Shop detail was successfully created.' }
        format.json { render :show, status: :created, location: @shop_detail }
      else
        format.html { render :new }
        format.json { render json: @shop_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_details/1
  # PATCH/PUT /shop_details/1.json
  def update
    respond_to do |format|
      if @shop_detail.update(shop_detail_params)
        format.html { redirect_to @shop_detail, notice: 'Shop detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_detail }
      else
        format.html { render :edit }
        format.json { render json: @shop_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_details/1
  # DELETE /shop_details/1.json
  def destroy
    @shop_detail.destroy
    respond_to do |format|
      format.html { redirect_to shop_details_url, notice: 'Shop detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop_detail
    @shop_detail = ShopDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shop_detail_params
    params.require(:shop_detail).permit(:key, :value, :deleted_at)
  end
end
