class PortfolioController < ApplicationController
  def index
    @projects = Project.order("created_at DESC")
  end
  
  def detail
  end
end
