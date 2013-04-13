# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :detect_locale

  def default_url_options(options = {})
    {:locale => I18n.locale}
  end

  private
  def get_user
    @user = User.where(["id = ?", session[:user_id]]).first
    raise "ログインしてください" unless @user.present?
  end

  def detect_locale
    I18n.locale = params[:locale]
  end
end
