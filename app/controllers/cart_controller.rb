class CartController < ApplicationController
  def index
    @cart.remove_item(params[:line_item_id]) if params[:do] == "remove_item"
    @info_contact = Company.all
  end

  def checkout
    @info_contact = Company.all
    @order = Order.new
    if @cart.line_items.empty?
      redirect_to shopping_cart_path
    end
  end

  def finish
    @info_contact = Company.all
  end
end
