class UsersController < ApplicationController
  #protect_from_forgery with: :null_session

  skip_before_filter :verify_authenticity_token, :only => [:sign_out_user, :submit_data]
  before_filter :is_user_signed_in

  def is_user_signed_in
    if !user_signed_in?
	redirect_to '/users/sign_in'
    end
  end

  def upload_data  
    
  end

  def submit_data
    file_data = params[:uploaded_file]
    if params[:uploaded_file].nil?
	puts "here in"
#        render "users/upload_data.html" , :text => "please select file to be uploaded"
        return
    end
    post = UploadFile.new(current_user.id)
    post.save(file_data)
    revenue = post.revenue
    render :text => "File has been uploaded successfully and the total revenue from the file is #{revenue}."   
  end

  def sign_out_user
    sign_out(current_user)
  end
end
