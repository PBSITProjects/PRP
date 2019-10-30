class FranchisePresenter < SimpleDelegator
  def initialize(model)	
  	@model = model
  	super(@model)
  end


  # def show_status
  # 	if @model.non_compliant == 1 
    
  #   <i class="fa fa-exclamation-circle fa-2x" 
  #      aria-hidden="true" data-html = "true" 
  #      data-toggle="tooltip" 
  #      title="Non Compliant <%=(@model.non_compliant_reason.nil? ? '' : '('+franchise.non_compliant_reason+')')%>" data-placement = "right" data-container="body"></i>
  #       <%end%>

  #        if franchise.inactive == 1 
  #         <i class="fa fa-lock fa-2x" aria-hidden="true" data-html = "true" data-toggle="tooltip" title="Inactive <%=(franchise.term_reason.nil? ? '' : '('+franchise.term_reason+')')%>" data-placement = "right" data-container="body"></i>
  #       <%end%>

  #       if (franchise.term_date <= Date.today if franchise.term_date) 
  #            <i class="fa fa-calendar-times-o fa-2x" aria-hidden="true"  data-html = "true" data-toggle="tooltip" title="Terminated on <%= (l franchise.term_date if franchise.term_date) + ' ' +  (franchise.term_reason.nil? ? '' : '('+franchise.term_reason+')')%>" data-placement = "right" data-container="body"></i>
  #        <%end%>    
  #   end

end