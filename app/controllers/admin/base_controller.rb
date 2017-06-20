class Admin::BaseController < ApplicationController
  before_action :check_admin

  def index; end

  protected

  def check_admin
    redirect_to root_path, alert: 'You have not access' unless current_user.admin?
  end
end
