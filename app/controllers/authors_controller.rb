class AuthorsController < ApplicationController
  before_action :make_sure_signed_in_user, only: [:edit, :update, :destroy]

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
    @author.image_url = params[:author][:image_url]
    if @author.save
      redirect_to authors_url, notice: "Author added!"
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find_by(id: params[:id])
  end

  def update
    @author = Author.find_by(id: params[:id])
    @author.name = params[:author][:name]
    @author.image_url = params[:author][:image_url]
    if @author.save
      redirect_to authors_url(@author), notice: "Updated author"
    else
      render :edit
    end
  end

  def destroy
    author = Author.find_by(id: params[:id])
    if author
      author.destroy
    end
    redirect_to author_url
  end

end
