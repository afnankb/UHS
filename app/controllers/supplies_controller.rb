class SuppliesController < ApplicationController
  def index 
    @supplies = current_user.supplies.all
    
  end
  def findById
  if current_user.id == 1
    @supplies = Supply.where(user_id:params[:id])

  else 
    flash[:notice] = 'Not allowed!'
    redirect_to supplies_path
  end
  end

  def show
    @findsupply = Supply.find(params[:id])
    @averg = @findsupply.In_used
    @averg = (@averg * 7)/ 100 
    @findsupply = Supply.find(params[:id]).update(Averge_used: @averg)
    @supply = Supply.find(params[:id])
    if  @supply.user != current_user
      flash[:notice] = 'Not allowed!'
      redirect_to supplies_path
    end 
  end


  def search  
      @parameter = params[:search]
      @parameterLoction = params[:location]
      if current_user.id == 1
       @results=Supply.all
       @users = User.all
      else 
        flash[:notice] = 'Not allowed!'
        redirect_to supplies_path
      end
  end 

  def hospitalAreNeeded
    if current_user.id == 1
    @users = User.all
    @supplies = Supply.all
  else 
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
    if  @supply.user != current_user
      flash[:notice] = 'Not allowed!'
      redirect_to supplies_path
    end
  end
  

  def update
    supply = Supply.find(params[:id])
    supply.update(supply_params)
    
    redirect_to supply
  end

  def destroy 
    Supply.find(params[:id]).destroy
    redirect_to supplies_path
  end


  private
  def supply_params
    params.require(:supply).permit(:Name, :Total, :In_used,:Availble)
  end
end
