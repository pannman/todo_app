class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "パスワード変更のためのメールを送信いたしました。"
      redirect_to new_password_reset_url
    else
      flash.now[:danger] = "無効なメールアドレスです"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "パスワードの変更に成功しました"
      @user.update_attribute(:reset_digest, nil)
      redirect_to login_url
    else
      render 'edit'
    end
  end


  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user &&  @user.authenticated?(:reset, params[:id]))
        flash[:danger] = "パスワードの変更に失敗しました"
        redirect_to new_password_reset_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "パスワードリセット期限を過ぎています"
        redirect_to new_password_reset_url
      end
    end

end
