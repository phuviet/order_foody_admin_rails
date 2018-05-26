class Statictics::TopProductsController < ApplicationController
  def index
    @year = Time.zone.today.year
  end
end
