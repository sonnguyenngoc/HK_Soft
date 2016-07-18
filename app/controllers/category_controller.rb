class CategoryController < ApplicationController
  def index
    @info_contact = Company.all
    @category = Category.find(params[:category_id])
    @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 15)
  end
  
  def category_sub_1
    @info_contact = Company.all
    @category = Category.find(params[:category_id])
    @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 15)
  end
  
  def category_sub_2
    @info_contact = Company.all
    @category = Category.find(params[:category_id])
    @products = @category.get_products_for_categories(params).search(params).paginate(:page => params[:page], :per_page => 15)
  end
end
