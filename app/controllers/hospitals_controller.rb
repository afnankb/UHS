class HospitalsController < ApplicationController

    def index
         if current_user.id > 1
            redirect_to supplies_path
         else 
          @users = User.all
         end 
    end

    def show
        @user = User.find(params[:id])
        if current_user.id > 1
        if @user != current_user
          flash[:notice] = 'Not allowed!'
          redirect_to supplies_path
        end
    end 
    end


end
