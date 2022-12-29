class CategoriesController < ApplicationController
    before_action :require_admin, except:[:index, :show]

    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save 
            flash[:notice] ="Category was Created successfully"
            redirect_to @category
        else 
            render 'new'
        end
    end

    def index 
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end 

    def show 
        @category = Category.find(params[:id])
    end

    private 
    def category_params 
        params.require(:category).permit(:name)
    end

    def require_admin  
        if !(logged_in? && current_user.admin?) 
            flash[:alert] = "only admins can add categories "
            redirect_to categories_path
        end
    end


    

end