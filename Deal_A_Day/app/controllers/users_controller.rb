class UsersController < ApplicationController


  skip_before_filter :verify_authenticity_token, :only => [:sign_out_user, :submit_data]
  before_filter :is_user_signed_in

  #check if user is signed in. If not redirect to sign in page
  def is_user_signed_in
    if !user_signed_in?
	redirect_to '/users/sign_in'
    end
  end

  def upload_data  
    if params[:resubmit].to_i==1
	@message="Please select file to be uploaded"
    else
	@message=""
    end
  end

  def submit_data
    file_data = params[:uploaded_file]
    #if file is not selected, show error message
    if params[:uploaded_file].nil?
         redirect_to "/users/upload_data?resubmit=1"
        return
    end
    puts file_data
    #creating an object of the model UploadFile and save it to the database
    post = UploadFile.new(current_user.id)
    post.save(file_data)
    revenue = post.revenue
    render :text => "<div style='color:green' align='center'>File has been uploaded successfully and the total revenue from the file is #{revenue}.</div>"   
  end

  def sign_out_user
    sign_out(current_user)
  end
end
