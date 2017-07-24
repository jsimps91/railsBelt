class ShoesController < ApplicationController
    before_action :require_login
    def index
        @user = User.find(session[:user_id])
        @shoes = Shoe.where(status:true)
        render 'index'
    end   
    def dashboard
        @user= User.find(session[:user_id])
        @purchases = Sale.where(buyer:@user)
        @sum_purchases = 0
        @sales= Sale.where(seller:@user)
        @sum_sales = 0
        @user_shoes = Shoe.where(user:@user, status:true)
        render 'dashboard'
    end 
    def create
        user = User.find(session[:user_id])
        shoe = Shoe.new(user:user, product:params[:product], price:params[:price], status:true)
        if shoe.save
            redirect_to '/shoes'
        else
            flash[:errors] = shoe.errors.full_messages
            redirect_to '/dashboard'
        end
    end 
    def buy
        shoe = Shoe.find(params[:shoe_id])
        shoe.update(status:false)
        buyer = User.find(session[:user_id])
        sale = Sale.create(seller:shoe.user, buyer:buyer, shoe:shoe) 
        redirect_to '/dashboard'     
    end  
    def destroy
        shoe = Shoe.find(params[:id]) 
        shoe.delete
        redirect_to '/dashboard'
    end     
end
