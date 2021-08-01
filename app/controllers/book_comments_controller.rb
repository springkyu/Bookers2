class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comment.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path
  end

  def destroy
    PostComment.find_by(id: params[:id], book_id: params[book_id]).destroy
    redirect_to books_path
  end


  private
  def book_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
