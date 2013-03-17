# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_user
    @user = User.where(["id = ?", session[:user_id]]).first
    raise "ログインしてください" unless @user.present?
  end
end
