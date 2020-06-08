class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render 'edit'
  	end
  end

    #フォローしてる人たち
  def following
  @user = User.find(params[:id])
  @users = @user.followings.all
  end

  #フォローしてくれてる人たち
  def followers
  @user = User.find(params[:id])
  @users = @user.followers.all
  end





  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :latitude, :longitude)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) if current_user != @user
  end

end
