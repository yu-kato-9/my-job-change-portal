class ServicesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @services = current_user.services.all.page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
    @service = current_user.services.build
  end
  
  def create
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:success] = '転職サービスを登録しました。'
      redirect_to services_url
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    
    if @service.update(service_params)
      flash[:success] = '正常に更新されました'
      redirect_to @service
    else
      flash.now[:danger] = '更新できませんでした。'
      render :edit
    end
  end
  
  def destroy
    @service.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: current_user)
  end
  
  private
  
  def service_params
    params.require(:service).permit(:name, :url, :kind, :memo, :name_of_person_in_charge, :tel_of_person_in_charge, :email_of_person_in_charge)
  end
  
  def correct_user
    @service = current_user.services.find_by(id: params[:id])
    unless @service
      redirect_to current_user
    end
  end
end
