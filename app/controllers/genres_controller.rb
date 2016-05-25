class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new

  end

  def create
    genre = Genre.new
    genre.name = params[:name]
    genre.photo_url = params[:photo_url]
    genre.save
    redirect_to "http://localhost:3000/movies"
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    genre = Genre.find_by(id: params[:id])
    genre.name = params[:name]
    genre.photo_url = params[:photo_url]
    genre.save
    redirect_to "http://localhost:3000/movies"
  end

  def destroy
    genre = Genre.find_by(id: params[:id])
    genre.destroy
    redirect_to "http://localhost:3000/movies"
  end

end
