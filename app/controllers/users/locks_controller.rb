class Users::LocksController < ApplicationController
  before_action :set_user, only: %i[create]

  def create
    @user.skip_password_validation = true
    respond_to do |format|
      lock = @user.lock.zero? ? 1 : 0
      notice = @user.lock.zero? ? 'User was locked.' : 'User was locked.'
      @user.skip_password_validation = true
      @users = User.with_deleted.only_guest.common_order
      if @user.update(lock: lock)
        format.html { redirect_to users_path, notice: { message: notice } }
      else
        format.html { redirect_to users_path, notice: { errors: @user.errors.full_messages } }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end
end