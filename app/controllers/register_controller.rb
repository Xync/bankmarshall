class RegisterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def step2
    params.permit(:account_number, :full_name, :SSN)
    
    temp_user = User.new
    temp_user.account_number = params[:account_number]
    temp_user.full_name = params[:full_name]
    temp_user.SSN = params[:SSN]
    print("-----In Controller----")
    pp(temp_user)
    print("---------")
    @new_user = temp_user
  end

  def step3
  	 temp_user = Marshal.load(Base64.decode64(params[:confirm][:user]))
  	 pp(temp_user.full_name)
  	 @new_user = temp_user
  end 
end
