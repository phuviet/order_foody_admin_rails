class MainController < ApplicationController
  authorize_resource class: false

  def index
    @products = Product.where(deleted_at: nil).count
    @categories = Category.where(deleted_at: nil).count
    @users = User.where(role: nil, deleted_at: nil).count
    @orders = Order.where("to_char(created_at, 'YYYY-MM') = to_char(current_date, 'YYYY-MM') AND deleted_at IS NULL")
                   .count
    @products_sell = Product.products_sell.to_a
  end
end
