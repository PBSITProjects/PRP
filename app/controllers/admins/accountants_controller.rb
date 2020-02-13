class Admins::AccountantsController < ApplicationController
helper_method :sort_column, :sort_direction
before_action :set_accountant, only: [:show, :edit, :update, :destroy]


def index
	@accountants = Accountant.search(params[:search])
	               .order(sort_column + " " + sort_direction)
                 .paginate(per_page: 10, page: params[:page])
  
  authorize! :read, Accountant
end

def new 
  redirect_to root_url, notice: 'A Franchise was Not Selected' unless params[:franchise_id]
  franchise_id = params[:franchise_id].to_i
	@accountant = Accountant.new(franchise_id: franchise_id)
  @franchise = Franchise.find(franchise_id)

	authorize! :new, @accountant
end

def create
	@accountant = new_accountant 
	@accountant.set_dates(accountant_params[:start_date],
                        accountant_params[:birthdate],
		                    accountant_params[:spouse_birthdate],
                        accountant_params[:term_date])

	authorize! :create, @accountant
  if @accountant.save 
  	flash[:success] = "Accountant Created Successfully"
  	redirect_to admins_accountants_path
  else
  	render action: :new 
  end
end

def edit
	authorize! :edit, @accountant
end

def update
	authorize! :update, @accountant
	@accountant.assign_attributes(accountant_params)
	@accountant.set_dates(accountant_params[:start_date],
                        accountant_params[:birthdate],
		                    accountant_params[:spouse_birthdate],
                        accountant_params[:term_date])
	if @accountant.save 
		flash[:success] = "Accountant Modified Successfully"
		redirect_to admins_accountants_path 
	else
		render 'edit'
	end
end

def destroy 
	authorize! :destroy, @accountant
	if @accountant.destroy
    flash[:success] = 'Accountant Deleted Successfully'
    redirect_to admin_accountants_path
  else
    flash[:error] = @accountant.errors.full_messages.to_sentence
    redirect_to admin_accountants_path
  end 

end

def show 
	authorize! :read, @accountant
end



private
	def set_accountant
		@accountant = Accountant.find(params[:id])
  end

  def new_accountant
  	Accountant.new(accountant_params)
  end

  def accountant_params
    params.require(:accountant)
     .permit(:franchise_id, :accountant_num, :lastname,
      :firstname, :initial, :salutation, :birthdate,
      :spouse_name, :spouse_birthdate, :spouse_partner,
      :start_date, :inactive, :term_date, :cpa, :mba,
      :degree, :agent, :advisory_board, :notes)
  end

  def sort_column
    Accountant.column_names.include?(params[:sort]) ? params[:sort] : 'franchises.franchise_number'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

end