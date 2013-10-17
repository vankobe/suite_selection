# encoding: utf-8
class ApplicationController < ActionController::Base
  include SetSeoHash

  protect_from_forgery
  before_filter :detect_locale, :get_user
  before_filter :unpublish_pages
  before_filter :set_currency
  before_render :set_seo_word_hash

  def default_url_options(options = {})
    {:locale => I18n.locale}
  end

  private
  def get_user
    @user = User.where(["id = ?", session[:user_id]]).first
  end
  
  def only_user_allow
    raise "ログインしてください" unless @user.present?
    redirect_to controller: :auth, action: :facebook unless @user.present?
  end

  def detect_locale
    I18n.locale = params[:locale]
  end

  def unpublish_pages
    raise SweetaErrors::AccessDeniedError if Rails.env.production?
  end
  
  def set_currency
    case I18n.locale
    when :en
      @currency_code = "USD"
    when :ja
      @currency_code = "JPY"
    else
      @currency_code = "JPY"
    end
  end

  def set_seo_word_hash
    @seo_word_hash = set_seo_word(:controller_path => controller_path, :action_name => action_name, :params => params, :product => @product, :shop => @shop) || {}
  end
end
