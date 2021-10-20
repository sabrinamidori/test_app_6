class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :require_user, only: [ :edit, :update, :destroy ]
    before_action :require_same_user, only: [ :edit, :update, :destroy ]
    def index 
        @users = User.paginate(page: params[:page])
    end
    def new
         @user = User.new
    end
    def edit
    end
    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
      #byebug
    end
    def create
        #byebug
        @user = User.new(user_params) 
    
        if @user.save
            session[:user_id] =  @user.id
            flash[:notice] = "Wellcome to Alpha Blog #{@user.username}, you have successfully signed up."
            redirect_to articles_path
        else
            render 'new'  
        end
    end
    
    def update
        if @user.update(user_params) #calls method user_params
            flash[:notice] = "Account successfully updated."
            redirect_to @user
        else
            render 'edit'
        end
    end
    def destroy
        @user.destroy
        session[:user_id] = nil  
        flash[:notice] = "Account and all associated articles successfully deleted."
        redirect_to articles_path

    end
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            #byebug
            @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
        def require_same_user
          if current_user != @user
            flash[:alert] = "You can only edit your acount."
            redirect_to @user
          end
        end 

    end