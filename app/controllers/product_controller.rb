class ProductController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @info_contact = Company.all
  end
  def product_search
    @info_contact = Company.all
    @products = Product.search_all_product(params).paginate(:page => params[:page], :per_page => 20)
  end
end
