class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'
  
  before_action :login_required

  def login_required
    if not session[:logined].present?
      flash[:alert] = '请登录后操作!'     
      redirect_to login_path      
    end
  end

end
