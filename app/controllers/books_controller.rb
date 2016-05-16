class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
  @book = Book.find_by(id: params[:id])
  if @book == nil
    redirect_to books_url
  end
  cookies["book_id"] = @book.id
end

end
