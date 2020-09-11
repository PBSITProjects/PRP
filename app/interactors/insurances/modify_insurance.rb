class ModifyInsurance
  include Interactor
  
  def call
  	insurance = context.insurance
    insurance.assign_attributes(context.params)
  	insurance.set_dates(context.params[:eo_expiration],
                        context.params[:gen_expiration],
		                    context.params[:other_expiration],
                        context.params[:other2_expiration])
  	if insurance.save
      context.insurance = insurance
      event_info = {fran: insurance.franchise.franchise_number,
      	            lastname: insurance.franchise.lastname,
      	            description: "Insurance File Modified",
      	            user_email: context.user.email}
      context.event_info = event_info
      context.log_event = true
    else
    	context.insurance = insurance 
    	context.fail!
    end
  end
end