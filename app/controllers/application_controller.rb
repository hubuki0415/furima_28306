class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_paramaters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_FURIMAUSER"] && password == ENV["BASIC_AUTH_FURIMAPASSWORD"]  # 環境変数を読み込む記述に変更
    end

    def configure_permitted_paramaters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :first_name_kana, :last_name, :last_name_kana, :email, :password, :birth_day])
    end
    
  

  end
end
