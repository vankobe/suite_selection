# encoding: utf-8
class SessionsController < ApplicationController
  def login
    auth = request.env['omniauth.auth']
    user = User.find_by_facebook_uid(auth['uid']) || User.create_account(auth)

    session[:user_id] = user.id
    logger.debug auth.to_yaml
    redirect_to root_url, :notice => 'ログインしました。'
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => 'ログアウトしました。'
  end
end
