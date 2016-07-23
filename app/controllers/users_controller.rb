class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy]

    def index
      @users = User.all
    end

    def edit

    end

    def show
      @user = User.find(params[:id])
    end

    def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :provider, :uid, :encrypted_password, :reset_password_token,
      :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at,
      :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :failed_attempts,
      :unlock_token, :locked_at, :approved, :id)
    end
end
