class BooksController < ApplicationController

  def index
    @books = Book.all
    if params[:keyword].present?
      @books = @books.where("title LIKE '%#{params[:keyword]}%'")
    end
  end

  def show
  @book = Book.find_by(id: params[:id])
  if @book == nil
    redirect_to books_url
  end
  cookies["book_id"] = @book.id
end

end
