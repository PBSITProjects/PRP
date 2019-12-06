module FranchiseHelper
  def franchise_status(fran)
  	rtn_html = ""
  	if fran.non_compliant == 1 
  		rtn_html += <<-HTML
        <i class="fas fa-exclamation-circle fa-lg padgett-blue-icon" 
        aria-hidden="true" 
        data-html = "true" 
        data-toggle="tooltip" 
        title="Non Compliant#{fran.non_compliant_reason.empty? ? '' : ' ('+fran.non_compliant_reason+')'} "
        data-placement = "right" data-container="body">
       </i>
       HTML
    end  

    if fran.inactive == 1
    	rtn_html += <<-HTML
        <i class="fas fa-user-times fa-lg padgett-blue-icon" 
        aria-hidden="true" 
        data-html = "true" 
        data-toggle="tooltip" 
        title="Inactive#{fran.term_reason.empty? ? '' : ' ('+fran.term_reason+')' } "
        data-placement = "right" data-container="body">
       </i>
       HTML
    end
    

    if fran.term_date && fran.term_date <= Date.today 
    	rtn_html += <<-HTML
        <i class="fas fa-calendar-times fa-lg padgett-blue-icon" 
        aria-hidden="true" 
        data-html = "true" 
        data-toggle="tooltip" 
        title="Terminated On #{(l fran.term_date)} #{fran.term_reason.empty? ? '' : ' ('+fran.term_reason+')'}" 
        data-placement = "right" data-container="body">
       </i>
       HTML
    end

    if rtn_html == ""
      rtn_html = <<-HTML
        <i class="fas fa-check-circle fa-lg padgett-green-icon" 
        aria-hidden="true" 
        data-html = "true" 
        data-toggle="tooltip" 
        title="In Compliance" 
        data-placement = "right" data-container="body">
       </i>
       HTML
    end
    rtn_html.html_safe    
  
  end

  def destination_button(destination,franchise)
    rtn_html = ""
    route = ""
      case destination 
      when 'add_royalty'
        route = new_remittance_path(franchise_id: franchise.id)
      when 'add_receivable'
        route = new_receivable_path(franchise_id: franchise.id)
      when 'add_invoice'
        route = new_invoice_path(franchise_id: franchise.id)
      when 'add_payment'
        route = new_check_payment_path(franchise_id: franchise.id)
      when 'add_credit'
        route = new_franchise_credit_path(franchise_id: franchise.id)
      when 'add_accountant'
        route = new_accountant_path(franchise_id: franchise.id)
      when 'support'
        route = supports_path(franchise_id: franchise.id)
      end

      rtn_html = <<-HTML     
        <td class = "text-nowrap" style="text-align:right">
          <a href="#{route}" class="btn btn-sm btn-padgett">Continue</a>
        </td>
      HTML
    
    rtn_html.html_safe
  end
end