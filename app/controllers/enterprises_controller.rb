class EnterprisesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @enterprises = current_user.registerings.page(params[:page])
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end
  
  def new
    @enterprises = Enterprise.search(params[:keyword])
  end
end
