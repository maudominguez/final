class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
    if @author == nil
      redirect_to "/authors"
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

end
