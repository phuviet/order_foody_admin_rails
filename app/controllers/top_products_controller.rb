class TopProductsController < ApplicationController
  authorize_resource class: false
  def index
    @year = Time.zone.today.year
  end
end
