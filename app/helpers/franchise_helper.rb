module FranchiseHelper
  def franchise_status(fran)
  	rtn_html = ""
  	if fran.non_compliant == 1 
  		rtn_html += <<-HTML
        <i class="fas fa-exclamation-circle fa-lg padgett-blue-icon" 
        aria-hidden="true" 
        data-html = "true" 
        data-toggle="tooltip" 
        title="Non Compliant #{fran.non_compliant_reason.nil? ? '' : '('+fran.non_compliant_reason+')'} "
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
        title="Inactive #{fran.term_reason.nil? ? '' : '('+fran.term_reason+')' } "
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
        title="Terminated On #{(l fran.term_date)} #{'('+fran.term_reason+')' if fran.term_reason}" 
        data-placement = "right" data-container="body">
       </i>
       HTML
    end

    rtn_html.html_safe    
  
  end
end