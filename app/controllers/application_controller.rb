# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :detect_locale, :get_user
  before_filter :unpublish_pages

  def default_url_options(options = {})
    {:locale => I18n.locale}
  end

  private
  def get_user
    @user = User.where(["id = ?", session[:user_id]]).first
  end
  
  def only_user_allow
    raise "ログインしてください" unless @user.present?
  end

  def detect_locale
    I18n.locale = params[:locale]
  end

  def unpublish_pages
    raise SweetaErrors::AccessDeniedError# if Rails.env.production?
  end
end
