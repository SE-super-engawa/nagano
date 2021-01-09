class Admin::GenresController < ApplicationController
  def create
    @genre =Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path(@genre.id)
    else
    end
  end

  def index
    @genres =Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
    end
  end


private
 def genre_params 
   params.permit(:name)
 end

end