# encoding: utf-8
class AdminController < ApplicationController
  before_filter :unpublish_pages, except: [:login, :login_process, :logout]
  before_filter :get_admin_user, except: [:login, :login_process, :logout]
  def login
  end

  def login_process
    user = AdminUser.where(["login_name = ?", Digest::SHA256.hexdigest(params["login_name"])]).first
    if user.present? && user.password == Digest::SHA256.hexdigest(params["password"])
      session["admin_user_id"] = user.id
       
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
