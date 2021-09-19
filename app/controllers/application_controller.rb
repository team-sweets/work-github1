class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #ログアウト時のパスの変更
  def after_sign_out_path_for(resource)
    if current_customer
      root_path
    else
      new_admin_session_path
    end
  end

  # 新規登録後のリダイレクト先（顧客側）
    def after_sign_in_path_for(resource)
      if current_customer
        flash[:notice] = "ログインに成功しました"
        products_path
      else
        flash[:notice] = "ログインに成功しました"
        admin_products_path
      end
    end

 # 新規登録の保存機能
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :is_deleted])
    end

end