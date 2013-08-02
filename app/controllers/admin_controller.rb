# encoding: utf-8
class AdminController < ApplicationController
  before_filter :unpublish_pages, except: [:login, :authenticate, :logout]
  before_filter :get_admin_user, except: [:login, :authenticate, :logout]
  skip_before_render :set_seo_word_hash
  def login
  end

  def authenticate
    admin_user = AdminUser.authorize(params["login_name"].to_s, params["password"].to_s)
    if admin_user
      session["admin_user_id"] = admin_user.id
      redirect_to controller: "admin/products", action: :index
    else
      raise "ログインIDかパスワードが違います"
    end
  end

  def logout
    session["admin_user_id"] = nil
    redirect_to controller: "/search", action: :products
  end

private

  def get_admin_user
    begin
      @admin_user = AdminUser.where(["id = ?",session["admin_user_id"]]).first
    rescue
      @admin_user = nil
    end
    redirect_to controller: "admin", action: :login if @admin_user.blank?
  end
end
