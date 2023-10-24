class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "signin"
    end
  end

  def login
    @users = User.all
    @users.each do |user|
      if params[:uid] == user[:uid] && BCrypt::Password.new(user[:password_digest]) == params[:pass]
        @user = user
        break  # ユーザーが見つかったらループを終了
      end
    end

    if @user
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      redirect_to top_failed_path
    end
  end

  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
  def failed
    render "failed" #failedビューをレンダリング
  end
  
  def signin
    #uidとpassのデータベースへの保存
    bcrypted_pass = BCrypt::Password.create(params[:pass])
    @user = User.new(uid: params[:uid], password_digest: bcrypted_pass)
    @user.save
    
    render "login"  #ログイン画面を描画
  end
end

