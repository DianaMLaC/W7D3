class UsersController < ApplicationController
    before_action
# dunno what to write here either

    


    def show
        @user = User.find(params[:id])
        render :show
        
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else  
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end


end
