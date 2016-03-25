class InfoController < ApplicationController
  def page1
  end

private
  def check_logged_in
    if !session[:logged_in]
      redirect_to logins_logins_form_path
    end
  end
end