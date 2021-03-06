class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :new]
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @edit_user = User.find(params[:id])
    end

    def update
        @edit_user = User.find(params[:id])
        post_params = params.require(:user).permit(:first_name, :last_name, :address, :additional_address, :city, :zipcode, :country, :description, :avatar, :is_admin)
        @edit_user.update(post_params)
        if user_completed?(@edit_user)
            @edit_user.update_attributes(completed: true)
            # Create an initial User_Library (the Alpha_disc) when user is completed creation, to move in model for FAT models, SKINNY controllers
            unless @edit_user.user_libraries.present?
                new_deal_content = UserLibrary.create(disc_id: 1, description: "Ce disque n'est pas sensé apparaître, merci de contacter les administrateurs du site à ce sujet si vous voyez ce message.", user_id: current_user.id)
            end
            ####
            redirect_to user_path(@edit_user.id)
        else
            @edit_user.update_attributes(completed: false)
            redirect_to root_path
        end
    end

    def destroy
        @destroy_user = User.find(params[:id])
        @destroy_user.destroy
        redirect_to users_path
    end


    private
    def user_completed?(user)
        if user.country.present? && user.first_name.present? && user.last_name.present? && user.address.present? && user.city.present? && user.zipcode.present? && user.description.present?
            true
        else
            false
        end
    end
end
