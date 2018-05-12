class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @notice = notice
    @users = User.only_guest.common_order
  end
end
