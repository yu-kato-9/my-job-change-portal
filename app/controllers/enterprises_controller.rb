class EnterprisesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new]
#  before_action :correct_user, only: [:show]
  
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
  
#  def correct_user
#    @enterprise = current_user.registerings.find_by(id: params[:id])
#    unless @enterprise
#      redirect_to enterprises_path
#    end
#  end
end
