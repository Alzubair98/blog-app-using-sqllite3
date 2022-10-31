class UsersController < ApplicationController
    def show 
      set_user
      @articles = @user.articles
    end

    def index 
      @users = User.all
    end
  
    def new 
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save 
        flash[:notice] = "Welcome to the blog #{@user.username.capitalize} , you have successfully signed up"
        redirect_to articles_path
      else  
        render 'new'
      end
    end

    def edit 
      set_user
    end

    def update 
      set_user 
      if @user.update(user_params)
        flash[:notice] = "User was updated"
        redirect_to articles_path
      else 
        render 'edit'
      end
    end


    private

    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end
  end
  