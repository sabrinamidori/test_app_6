class UsersController < ApplicationController
    #before_action :set_user, only: %i[ show edit update destroy ]
    def new
         @user = User.new
    end
    def create
        #byebug
        @user = User.new(user_params) 
    
        if @user.save
            flash[:notice] = "Wellcome to Alpha Blog #{@user.username}, you have successfully signed up."
            redirect_to articles_path
        else
            render 'new'  
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end