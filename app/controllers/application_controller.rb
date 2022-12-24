class ApplicationController < ActionController::Base
    #the methods here work for all controllers only not views to make it helper we
    # do that

    helper_method :current_user, :logged_in?

    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user  #(!! is to turn the object to a boolean)
    end
end
