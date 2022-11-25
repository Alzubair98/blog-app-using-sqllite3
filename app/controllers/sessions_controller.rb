class SessionsController < ApplicationController

    def new 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            falsh[:notice] = "Logged in successfully"
            redirect_to user

        else  
            flash.now[:alert]= "There was something wrong with your login details"
            render 'new'
        end
    end

    def delete 
    end
    
end