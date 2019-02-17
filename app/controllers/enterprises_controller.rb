class EnterprisesController < ApplicationController
  def index
    @enterprises = Enterprise.all
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end
  
  def new
    @enterprises = Enterprise.search(params[:keyword])
  end
end
