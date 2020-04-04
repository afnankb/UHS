class SuppliesController < ApplicationController
  def index 
    @supplies = current_user.supplies.all
  end

  def show
    @supply = Supply.find(params[:id])
    if  @supply.user != current_user
      flash[:notice] = 'Not allowed!'
      redirect_to supplies_path
    end 
  end

  def new
    @supply=Supply.new
  end
  
  def create
    @supply = Supply.new(supply_params)
    @supply.user = current_user

    if @supply.save
      redirect_to @supply
    else
      render 'new' 

    end 
  end

  def edit
    @supply = Supply.find(params[:id])
  end
  

  def update
    supply = Supply.find(params[:id])
    supply.update(supply_params)
    
    redirect_to supply
  end

  def destroy
    @supply.destroy
    redirect_to supplies_path
  end


  private
  def supply_params
    params.require(:supply).permit(:Name, :Total, :In_used,:Averge_used,:Availble)
  end
end
