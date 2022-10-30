class ApplicationController < ActionController::Base

    def first_user 
        User.first 
    end

end
