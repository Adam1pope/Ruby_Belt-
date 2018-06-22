class ProductsController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@products = Product.where.not(user: @user.id)
  end

  def create
  		user = User.find(params[:id])
  	    product = Product.create(name: params[:name], price: params[:price])
  		product.user_id = session[:id]    #attaches the user who created the event
  		if product.save                      #saves the user who created the event to the database
  			redirect_to "/products/#{user.id}"
  		else
  			flash[:errors] = product.errors.full_messages
  			redirect_to :back
  		end	
  end

  def show
		@user = User.find(session[:id])
		@product = @user.products.all
		@market = Market.where(user_id: @user)
		@sales = Market.where.not(user_id: @user) 


  end


  def destroy
  	product = Product.find(params[:id])
  	product.destroy
  	redirect_to "/products/#{product.id}"
  end

end
