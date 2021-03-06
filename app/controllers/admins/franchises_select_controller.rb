class Admins::FranchisesSelectController < ApplicationController
  helper_method :sort_column, :sort_direction
    
  def index
    @destination = params[:destination]
    
    # Pass the destination to javascript
    gon.destination = @destination
    
    @franchises = Franchise.search(params[:search])
                  .order(sort_column + " " + sort_direction)
                  .paginate(per_page: 20, page: params[:page])
    
    authorize! :read, Franchise
  end 

  
  private

  def sort_column
    Franchise.column_names.include?(params[:sort]) ? params[:sort] : 'franchise_number'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
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