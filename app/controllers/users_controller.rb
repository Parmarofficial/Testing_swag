class UsersController < ApplicationController
        def index
          @users = User.all
          render json: @users
        end
      
        def show
          @user = User.find(params[:id])
          render json: @user  
        end
      
        def new
          @user = User.new
        end
      
        def create
          @user = User.new(users_params)
      
          if @user.save
            # redirect_to @user
            render json: @user
          else
            # render 'new'
            render json: {message: " not create"}
          end
        end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      render json:@user 
    else 
      render json: {message: "not found"}, status: :not_found
    end
  end
      
        def destroy
          @user = User.find(params[:id])
          if @user.destroy
              render json:@user 
          else 
             render json: @user.errors.full_message
          end
        end
      
        private
          def users_params
            params.permit(:name, :email)
          end
end