class GenresController < ApplicationController
  before_action :make_sure_signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @genres = Genre.paginate(page: params[:page], per_page: 10)
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new
    @genre.name = params[:genre][:name]
    @genre.description = params[:genre][:description]
    if @genre.save
      redirect_to genres_url, notice: "Created genre: #{@genre.name}"
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.name = params[:genre][:name]
    @genre.description = params[:genre][:description]
    if @genre.save
      redirect_to genre_url(@genre), notice: "Genre was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    genre = Genre.find_by(id: params[:id])
    genre.destroy
    redirect_to genres_url, notice: 'Genre destroyed'
  end

end
