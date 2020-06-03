class BookCommentsController < ApplicationController
# before_action :correct_user, only: [:create, :destroy]
def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book)
end

def destroy
    @comment = BookComment.find(params[:book_id])
    @comment.destroy
    redirect_to request.referer
end



private
def book_comment_params
    params.require(:book_comment).permit(:comment)
end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  #  def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to user_path(current_user) if current_user != @user
  # end
end
