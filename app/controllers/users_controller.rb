class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def create
        byebug
        @user = User.new(article_params)
        if @user.save
            flash[:notice] = "Article was created successfully."
            redirect_to users_path
        else
            flash[:notice] = "Article was not created successfully."
            render 'new'
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to users_path
        else
            render 'edit'
        end
            
        
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "Article was delete successfully."
        redirect_to users_path
    end

    def search
        #byebug
        if params[:user].present?
            @user = User.where(name: params[:user]).first
            if @user
                flash[:alert] = "Found the name"
                redirect_to users_path
            else
                flash[:alert] = "Name not found"
                redirect_to users_path
            end
        else
            @users = User.all
            flash.now[:alert] = "Please enter a name to search"
            render "users/index"
        end
    end


    private
    def article_params
        params.require(:user).permit(:name, :email)
    end
end