class MainController < ApplicationController
  authorize_resource class: false

  def index
    @products = Product.count
    @categories = Category.count
    @users = User.where(role: nil).count
    @orders = Order.where("to_char(created_at, 'YYYY-MM') = to_char(current_date, 'YYYY-MM')")
                   .count
    @products_sell = Product.products_sell.to_a
  end
end
