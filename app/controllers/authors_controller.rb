class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
    if @author == nil
      redirect_to authors_url
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new
    @author.name = params[:author][:name]
    if @author.save
      redirect_to authors_url, notice: "Author added!"
    else
      # redirect_to new_author_url, notice: "Something went wrong!"
      render 'new'
    end
  end

  def edit
    @author = Author.find_by(id: params[:id])
  end

  def update
    author = Author.find_by(id: params[:id])
    author.name = params[:author][:name]
    author.save
    redirect_to authors_url(@author), notice: "Updated #{author.name}"
  end

  def destroy
    author = Author.find_by(id: params[:id])
    if author
      author.destroy
    end
    redirect_to author_url
  end

end
