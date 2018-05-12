class AdminsController < ApplicationController
  load_and_authorize_resource :user
  before_action :set_admin, only: %i[show edit update destroy]
  before_action :set_role, only: %i[new edit update create]

  # GET /admins
  # GET /admins.json
  def index
    @notice = notice
    @admins = User.expect_guest.common_order
  end

  # GET /admins/1
  # GET /admins/1.json
  def show; end

  # GET /admins/new
  def new
    @notice = notice
    @admin = User.new
  end

  # GET /admins/1/edit
  def edit; end

  # POST /admins
  # POST /admins.json
  def create
    @admin = User.new(
      admin_params.merge(
          password: '123456', password_confirmation: '123456',
          remote_avatar_url: 'https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png'
        )
      )

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_path(@admin), notice: { message: 'Admin was successfully created.' } }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      @admin.skip_password_validation = true
      if @admin.update(admin_params)
        format.html { redirect_to admin_path(@admin), notice: { message: 'Admin was successfully updated.' } }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = User.find(params[:id])
  end

  def set_role
    @roles = Role.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :middle_name, :phone, :address, :gender, :birthday, :avatar, :auth_token, :confirm_send_at, :confirm_token, :confirm_at, :reset_send_at, :reset_token, :deleted_at, :role_id)
  end
end
