class SessionsController < ApplicationController
  layout false

  def new
    @user = User.new
  end

  def create
    @user = User.where.not(role_id: nil)
                .find_by(email: params[:user][:email].downcase, lock: 0)
    respond_to do |format|
      if @user && @user.authenticate(params[:user][:password])
        log_in @user
        format.html { redirect_to main_index_path }
        # Log the user in and redirect to the user's show page.
      else
        # Create an error message.
        @user.errors.add(:email_or_password_is_valid_!,'')
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, :session
    respond_to do |format|
      log_out
      format.html { redirect_to new_session_path }
    end
  end
end
