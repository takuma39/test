class FavoritesController < ApplicationController
	# before_action :correct_user, only: [:create, :destroy]

	def create
		@book = Book.find(params[:book_id])
        @favorite = current_user.favorites.new(book_id: @book.id)
        @favorite.save
        redirect_to request.referer
    end

    def destroy
    	@book = Book.find(params[:book_id])
        @favorite = current_user.favorites.find_by(book_id: @book.id)
        @favorite.destroy
        redirect_to request.referer
    end

    # private
  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  #  def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to user_path(current_user) if current_user != @user
  # end
end
