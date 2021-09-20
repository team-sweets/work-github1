class Admin::GenresController < ApplicationController
<<<<<<< HEAD
  
=======

>>>>>>> origin/develop
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to  admin_genres_path
  end


  def edit
   @genre = Genre.find(params[:id])
  end

  def update
   genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end
<<<<<<< HEAD
  
=======

>>>>>>> origin/develop
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
