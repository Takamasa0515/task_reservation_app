class UsersController < ApplicationController

	def profile
		#@user = User.find(params[:id])
		@user = current_user
  end

	#def create
		#@user = User.new(params.permit(:name, :introduction))
		#if @user.save
			#redirect_to root_path
		#else
			#render :profile
		#end
	#end

	def update
		#@user.avatar.attach(params[:user][:avatar]) if @user.avatar.blank?
		@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:name, :introduction, :avatar))
			flash[:profile_update] = "プロフィールを更新しました"
			redirect_to root_path
		else
			rooms_path
		end
	end

end