class UserLibrariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_completed?, except: [:index, :show]

  def index
    @user_libraries = UserLibrary.all
    @all_genres = Genre.all
  end

  def show
    @user_library = UserLibrary.find(params[:id])
  end

  def new
    @new_user_library = UserLibrary.new

  end

  def create
    @new_user_library  = UserLibrary.new(user_id: params[:user_id], disc_id: params[:disc_id], description: params[:description])
    if @new_user_library.save
      flash[:notice_good] = "Un nouveau disque a bien été ajouté à votre discothèque."
      redirect_to user_libraries_path
    else
      flash[:notice_bad] = "Le disque n'a pas pu être ajouté à votre discothèque."
      render 'new'
    end
  end

  def edit
    @edit_user_library=UserLibrary.find(params[:id])
  end

  def update
    @edit_user_library=UserLibrary.find(params[:id])
    post_params = params.require(:user_library).permit(user_id: session[:id], disc_id: params[:disc_id], descripion: params[:description])
    @edit_user_library.update(post_params)
    redirect_to user_libraries_path
  end

  def destroy
    @destroy_user_library = UserLibrary.find(params[:id])
    @destroy_user_library.destroy
    redirect_to user_libraries_path
  end


end
