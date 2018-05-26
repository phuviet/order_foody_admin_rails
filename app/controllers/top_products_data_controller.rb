class TopProductsDataController < ApplicationController
  def index
    @data = Product.top_products(params[:month], params[:year]).to_a
    render json: @data
  end
end
