class ProductController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @info_contact = Company.all
  end
end
