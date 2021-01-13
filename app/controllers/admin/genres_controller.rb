class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def create
    @genre =Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path(@genre.id)
    else
    end
  end

  def index
    @genres =Genre.all
    @genre =Genre.new
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
   params.require(:genre).permit(:name, :is_active)
 end

end


=begin
 {"name"=>"ケーキ", "is_active"=>"true", "commit"=>"新規登録"}
=end
