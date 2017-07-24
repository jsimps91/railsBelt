class UsersController < ApplicationController 

    def create 
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            @user = User.find(session[:user_id])
            redirect_to '/shoes'
        else 
            flash[:errors] = user.errors.full_messages
            redirect_to '/'
        end 
    end
    def authenticate 
        user = User.find_by(email: params[:email])
        if user.nil?
            flash[:errors] = ['User not found']
            redirect_to '/'
        elsif user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to '/shoes'
        else
            flash[:errors] = ['Incorrect password']  
            redirect_to '/'
        end
    end 
    def logout
        reset_session
        redirect_to '/'
    end 
        private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end 
end
