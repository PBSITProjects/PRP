class Admins::FranchisesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_franchise, only: [:show, :edit, :update]
  
  def index
    # We use the franchise list in other modules to select a franchise before operations
    if params[:destination] 
      # If we provided a destination in params, we will use it in the link
      @destination = params[:destination]
    else
      # Otherwise it will be the standard franchise edit link
      @destination = "franchise_edit"
    end
    
    # Pass the destination to javascript
    gon.destination = @destination
    
    @franchises = Franchise.search(params[:search])
                           .order(sort_column + " " + sort_direction)
                           .paginate(per_page: 10, page: params[:page])
    authorize! :read, Franchise
  end 

  def new
    @franchise = Franchise.new(area: 1, mast: 0)
    authorize! :new, @franchise
  end

  def create
    @franchise = Franchise.new(franchise_params)
    @franchise.set_dates(franchise_params[:start_date], franchise_params[:renew_date], franchise_params[:term_date])
    authorize! :create, @franchise 
    if @franchise.save
      flash[:success] = 'Franchise Created Successfully'
      redirect_to admins_franchises_path 
    else
      render action: :new
    end
  end

  def edit 
    authorize! :edit, @franchise
  end

  def update
    authorize! :update, @franchise
    @franchise.assign_attributes(franchise_params)
    @franchise.set_dates(franchise_params[:start_date], franchise_params[:renew_date], franchise_params[:term_date])

    if @franchise.save
      flash[:success] = "Franchise profile modified successfully"
      redirect_to admins_franchises_path
    else
      render 'edit'
    end
  end

  def show
    authorize! :read, @franchise
  end


  private

  def sort_column
    Franchise.column_names.include?(params[:sort]) ? params[:sort] : 'franchise_number'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
  
  # Method that finds and sets the franchiseobject needed for some actions
  def set_franchise
    @franchise = Franchise.find(params[:id])
  end

  

  def franchise_params
    params.require(:franchise)
    .permit(:area, :mast,:region, :franchise_number, :office, :firm_id,
            :lastname, :firstname, :initial, :salutation, :address,
            :address2, :city, :state, :zip_code, :ship_address, :ship_address2,
            :ship_city, :ship_state, :ship_zip_code, :home_address,
            :home_address2, :home_city, :home_state, :home_zip_code,
            :phone, :phone2, :mobile, :fax, :email, :alt_email,
            :start_date, :renew_date, :salesman, :territory,
            :non_compliant, :non_compliant_reason, :prior_year_rebate,
            :advanced_rebate, :show_exempt_collect, :term_date,
            :term_reason, :inactive,
            franchise_cons_attributes:[:id, :fran, :_destroy ])
  end

end