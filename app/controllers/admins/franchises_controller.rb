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

  def set_dates(fp)
    @franchise.start_date = Date.strptime(fp[:start_date],I18n.translate('date.formats.default')) unless fp[:start_date].blank?
    @franchise.renew_date = Date.strptime(fp[:renew_date],I18n.translate('date.formats.default')) unless fp[:renew_date].blank?
    @franchise.term_date = Date.strptime(fp[:term_date], I18n.translate('date.formats.default')) unless fp[:term_date].blank?
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