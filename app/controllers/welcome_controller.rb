class WelcomeController < ApplicationController
  def index
    if current_user
      
    else
      redirect_to signin_path
    end
  end
end
