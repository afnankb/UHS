class SuppliesController < ApplicationController
  def index 
    # if params[:current_user]
    @supplies = current_user.supplies.all
    
  end
  def findById
    @supplies = Supply.where(user_id:params[:id])
    
    # Supply.find_by(user_id: 1)
    # @supplies = @supply.user.all
  end

  def show
    @supply = Supply.find(params[:id])
    if  @supply.user != current_user
      flash[:notice] = 'Not allowed!'
      redirect_to supplies_path
    end 
  end


  def search 
    # if params[:search].blank?  
    #   redirect_to search_url 
    # else  
      @parameter = params[:search]
      # @results = Supply.all.where( " capitalize(name) LIKE :search", search: "%#{@parameter}%")
      @results = Supply.all.where( "Name LIKE :search ", search: "%#{@parameter}%")
    
      # end 
   
  end 

  def hospitalAreNeeded
    
    @users = User.all
    @supplies = Supply.all
    # @supplies = Supply.order(Availble: :asc).limit(5)
       
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
