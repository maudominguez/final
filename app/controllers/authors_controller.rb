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

end
