class UsersController < ApplicationController
  before_filter :is_user_signed_in

  def is_user_signed_in
    if !user_signed_in?
	redirect_to '/users/sign_in'
    end
  end

  def upload_data    
  end

  def sign_out_user
    sign_out(current_user)
  end
end
