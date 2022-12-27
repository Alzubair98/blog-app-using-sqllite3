class UsersController < ApplicationController
  # we can use before_action method just like that 
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  
    def show 
      @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index 
      # @users = User.all
      @users = User.paginate(page: params[:page], per_page: 5)
    end
  
    def new 
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to the blog #{@user.username.capitalize} , you have successfully signed up"
        redirect_to articles_path
      else  
        render 'new'
      end
    end

    def edit 
    end

    def update 
      if @user.update(user_params)
        flash[:notice] = "User was updated"
        redirect_to @user
      else 
        render 'edit'
      end
    end


    def destroy 
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Account and all associated articles successfully deleted"
      redirect_to articles_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user 
      if current_user != @user 
        flash[:alert] = "you can only edit/delete your own account "
        redirect_to @user
      end
    end
  end
  