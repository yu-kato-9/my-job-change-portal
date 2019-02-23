class EnterprisesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show]
  
  def index
    @enterprises = current_user.registerings.page(params[:page])
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end
  
  def new
    @enterprises = Enterprise.search(params[:keyword])
  end
  
  private
  
  
  def correct_user
    unless current_user.registerings.find_by(id: params[:id])
      redirect_to current_user
    end
  end
  
end
