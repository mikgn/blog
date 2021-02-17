class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in(@user)
      flash[:notice] = 'Logged in with Facebook'
    else
      flash[:erros] = 'Authentication error'
    end
    redirect_to root_path
  end
end
