class FranchisesController < ApplicationController
  before_action :validate_franchise, only: [:edit, :update]
  before_action :set_franchise, only: [:edit, :update]


  def edit
  end

  def update
  end


  private

  #Franchise Users can only modify the advanced rebate field
  def franchise_params
    params.require(:franchise).permit(:advanced_rebate)
  end
  
  #Make sure a franchise cannot edit another franchise record
  def validate_franchise
  	fran = Franchise.find(params[:id])
  	redirect_to (root_url) unless (fran.id == current_user.franchise_id)
  end

  #Set the franchise instance variable for use in different methods
  def set_franchise
  	@franchise = Franchise.find(params[:id])
  end

end