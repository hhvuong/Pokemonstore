require 'digest/md5'

class LoginsController < ApplicationController
  def new_login
  end

  def show_logins
  end
  
  def registration_confirmation
  	@login = Login.new
    @login.customer = params[:customer]
    pw_from_customer = params[:pw]
    confirm_from_customer = params[:confirm_pw]
    if pw_from_customer != confirm_from_customer
      redirect_to logins_new_login_path, 
        notice: 'Password does not match confirmation.'
      return
    end
    @login.password = Digest::MD5.hexdigest(pw_from_customer)    
    if @login.save
      @msg = 'New customer was successfully registered.'
      @all_logins = Login.all
    else
      if @login.errors.any?
        cnt = @login.errors.count
        error_messages = cnt.to_s + " " + "error".pluralize(cnt) + 
          " prohibited password from being created.\n"
        @login.errors.full_messages.each do |msg|
          error_messages += "--" + msg + ".\n"
        end
      end
	  redirect_to logins_new_login_path, notice: error_messages
      return
    end 
  end

  def login_form  
	 
    # customer must login again when arriving at the login page,
    # even if already logged in previously.
	reset_session
	
    # Get customername and password
    customer_from_login = params[:customer_from_login]
    pw_from_login = params[:pw_from_login]
	
    # Get password from database for entered customername.  
    # If password from database matches the entered password,
    # store true in session variable so customer need not login again.
    if !customer_from_login.blank?
      pw_array = Login.where(customer: customer_from_login)
      encoded_pw = Digest::MD5.hexdigest(pw_from_login)	
      if pw_array.length > 0
        pw_from_db = pw_array[0].password
        if pw_from_db == encoded_pw
          session[:logged_in] = true
          redirect_to info_page1_path
        end
      end
    end
  end
	
  def logout
	
    # If customer logs out from any page,
    # reset session variable to false.
    reset_session
	
    # Go back to login again.
    redirect_to logins_login_form_path
	
  end 
end