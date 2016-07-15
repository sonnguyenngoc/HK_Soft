class CategoryController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.get_products_for_categories(params).paginate(:page => params[:page], :per_page => params[:number])
  end
  
  def category_sub_1
  end
  
  def category_sub_2
  end
end
