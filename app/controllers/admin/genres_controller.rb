class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def create
    @genre =Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path(@genre.id), success: "ジャンルを追加しました"
    else
     flash.now[:danger] = "ジャンルの追加に失敗しました"
     render :index
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
      flash[:success] = "ジャンル名を変更しました"
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "ジャンルの変更に失敗しました"
      render :index
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
