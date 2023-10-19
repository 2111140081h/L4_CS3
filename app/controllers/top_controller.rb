class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    @users = User.all
    @users.each do |user|
      if params[:uid] == user[:uid] and BCrypt::Password.new(user[:password_digest]) == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to top_main_path
      else
        redirect_to top_failed_path
      end
    end
  end

  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
  def failed
    render "failed" #failedビューをレンダリング
  end
end

