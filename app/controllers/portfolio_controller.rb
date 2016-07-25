class PortfolioController < ApplicationController
  def index
    @projects = Project.order("created_at DESC")
  end
  
  def detail
    @project = Project.find(params[:project_id])
  end
end
