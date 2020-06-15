class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    # sessionのidとuserのidが一緒だったらok
    # まずemailに合致するユーザーがいるか
    user = User.find_by(email: session_params[:email])
    # 「ユーザーが存在する」かつ「sessionに入っているpasswordが取得したuserのpasswordと一致している」
    if user&.authenticate(session_params[:password])
      login user
      flash[:success] = 'ログインしました'
      redirect_to admin_user_path user
    else
      render 'new'
    end
  end
  
  def destroy
    # sessionをresetするときにsessionに入っているparamerter全てを削除
    reset_session
    flash[:secondary] = 'ログアウトしました。'
    redirect_to root_path
  end
  
  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
    
end
