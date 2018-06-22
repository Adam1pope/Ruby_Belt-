class MarketsController < ApplicationController

	def buy
		@user = User.find(session[:id])
		@product = Product.find(params[:id])
		@markets = Market.create(user_id: @user.id, product_id: @product.id)
		@markets.save
		redirect_to "/products/#{@user.id}"

	end
end
