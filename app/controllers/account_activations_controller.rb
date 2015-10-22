# Account activation controller
class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      notice_successfully_activation(user)
    else
      notice_failure_activation
    end
  end

  private

  def notice_successfully_activation(user)
    flash[:success] = 'Account activated!'
    redirect_to user
  end

  def notice_failure_activation
    flash[:danger] = 'Invalid activation link'
    redirect_to root_url
  end
end
