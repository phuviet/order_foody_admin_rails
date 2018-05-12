class Admins::LocksController < ApplicationController
  before_action :set_user, only: %i[create]

  def create
    @admin.skip_password_validation = true
    respond_to do |format|
      lock = @admin.lock.zero? ? 1 : 0
      notice = @admin.lock.zero? ? 'Account was locked.' : 'Account was locked.'
      @admin.skip_password_validation = true
      if @admin.update(lock: lock)
        format.html { redirect_to admins_path, notice: { message: notice } }
      else
        format.html { redirect_to admins_path, notice: { errors: @admin.errors.full_messages } }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @admin = User.find(params[:admin_id])
  end
end