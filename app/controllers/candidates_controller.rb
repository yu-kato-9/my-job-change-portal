class CandidatesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @enterprise = Enterprise.find(params[:enterprise_id])
    current_user.register(@enterprise)
    flash[:success] = '企業を候補企業として登録しました'
    redirect_to controller: :enterprises, action: :index
  end
  
  def update
    @candidate = current_user.candidates.find_by(enterprise_id: params[:enterprise_id])
    if @candidate.update(candidate_params)
      flash[:success] = 'メモを保存しました'
      redirect_back(fallback_location: enterprises_url)
    else
      flash.now[:danger] = 'メモが保存できませんでした'
      @enterprises = current_user.registerings.page(params[:page])
      render 'enterprise/index'
    end
  end

  def destroy
    @enterprise = Enterprise.find(params[:enterprise_id])
    current_user.unregister(@enterprise)
    flash[:danger] = '企業を候補企業から削除しました'
    redirect_to controller: :enterprises, action: :index
  end
  
  private
  
  def candidate_params
    params.require(:candidate).permit(:memo)
  end
  
end
