class ProductsImagesController < ApplicationController
  before_action :set_products_image, only: [:show, :edit, :update, :destroy]

  # GET /products_images
  # GET /products_images.json
  def index
    @products_images = ProductsImage.all
  end

  # GET /products_images/1
  # GET /products_images/1.json
  def show
  end

  # GET /products_images/new
  def new
    @products_image = ProductsImage.new
  end

  # GET /products_images/1/edit
  def edit
  end

  # POST /products_images
  # POST /products_images.json
  def create
    @products_image = ProductsImage.new(products_image_params)

    respond_to do |format|
      if @products_image.save
        format.html { redirect_to @products_image, notice: 'Products image was successfully created.' }
        format.json { render :show, status: :created, location: @products_image }
      else
        format.html { render :new }
        format.json { render json: @products_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_images/1
  # PATCH/PUT /products_images/1.json
  def update
    respond_to do |format|
      if @products_image.update(products_image_params)
        format.html { redirect_to @products_image, notice: 'Products image was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_image }
      else
        format.html { render :edit }
        format.json { render json: @products_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_images/1
  # DELETE /products_images/1.json
  def destroy
    @products_image.destroy
    respond_to do |format|
      format.html { redirect_to products_images_url, notice: 'Products image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_image
      @products_image = ProductsImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_image_params
      params.require(:products_image).permit(:image, :product_id, :deleted_at)
    end
end
