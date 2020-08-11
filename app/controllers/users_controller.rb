class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    def after_sign_in_path_for(resource)
      user_path(resource.id)
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "プロフィール情報の更新が完了しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :profile_text)
  end
end
