class BooksController < ApplicationController

  def index
    @books = Book.all
    if params[:keyword].present?
      @books = @books.where("title LIKE ? OR year = ?", "%#{params[:keyword]}%", params[:keyword])
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book == nil
      redirect_to books_url
    end
    session["book_id"] = @book.id
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.description = params[:book][:description]
    @book.image_url = params[:book][:image_url]
    @book.genre_id = params[:book][:genre_id]
    @book.year = params[:book][:year]
    if @book.save
      redirect_to books_url, notice: "Book added! Thanks!"
    else
      # redirect_to new_book_url, notice: "Something went wrong!"
      render 'new'
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    book = Book.find_by(id: params[:id])
    book.title = params[:book][:title]
    book.description = params[:book][:description]
    book.image_url = params[:book][:image_url]
    book.year = params[:book][:year]
    book.save
    redirect_to books_url(@book), notice: "Updated #{book.title}"
  end

  def destroy
    book = Book.find_by(id: params[:id])
    if book
      book.delete
    end
    redirect_to books_url
  end

end
