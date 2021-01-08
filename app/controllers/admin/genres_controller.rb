class GenresController < ApplicationController
  def create
    @genre =Genre.new(genre_params)
  end

  def index
    @genres =Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
  end


private
 def genre params 
   params.require(:genre).permit(:name)
 end

end
