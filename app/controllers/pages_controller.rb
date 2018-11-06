class PagesController < ApplicationController
  authorize_resource class: false

  def dashboard
    @users = User.all.order(:name)
  end

  def grant
    @user = User.find(params[:id])
    if @user.admin?
      @user.role = nil
      @user.save!
    else
      @user.admin!
    end
    redirect_to pages_dashboard_path
  end

end
