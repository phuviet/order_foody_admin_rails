class ProductsController < ApplicationController
  load_and_authorize_resource

  before_action :set_product, only: %i[show edit update destroy]
  before_action :categories, only: %i[new edit create update]

  # GET /products
  # GET /products.json
  def index
    @products = Product.includes(:category).order(:name)
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
    @images = @product.products_images.build
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params.merge(star: 0))
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @product.save
          if params[:images]
            params[:images][:url].each do |image|
              @product.products_images.create!(image: image)
            end
          end
          format.html { redirect_to @product, notice: { message: 'Product was successfully created.' } }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:images]
          params[:images][:url].each do |image|
            @product.products_images.create!(image: image)
          end
        end
        format.html { redirect_to @product, notice: { message: 'Product was successfully updated.' } }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.includes_details.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :avatar, :description, :category_id)
    end

    def categories
      @categories = Category.all.where(deleted_at: nil)
    end
end
