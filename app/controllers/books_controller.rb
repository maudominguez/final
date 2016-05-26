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
      redirect_to books_url and return
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
      add_author_to_book
      redirect_to books_url, notice: "Book was successfully added"
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.title = params[:book][:title]
    @book.description = params[:book][:description]
    @book.image_url = params[:book][:image_url]
    @book.year = params[:book][:year]
    if @book.save
      add_author_to_book
      redirect_to books_url(@book), notice: "Book was successfully updated"
    else
      render :edit
    end
  end

  def add_author_to_book
    if params[:book][:authors].present?
      author = Author.find(params[:book][:authors])
      if author
        @book.authors << author
      end
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    if @book
      @book.destroy
    end
    redirect_to books_url
  end

end
