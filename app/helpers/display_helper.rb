module DisplayHelper
  #Helper that displays the proper payment icon
  #depending on the payment type
  def paid_with_icon(payment)	
  end

  #Throughout the app, we have the same links to 
#Edit, Show, Delete with the same icons
#This helper was created to minimize code in the view
def link_with_icon(link, action, description,confirm="")
  case action 
  when "show"
    a_tag = <<-HTML
    <a href="#{link}">
    <i class="far fa-file-alt fa-lg padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML
  when "edit"
    a_tag = <<-HTML
    <a href="#{link}">
    <i class="far fa-edit fa-lg padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML

  when "delete" 
    a_tag = <<-HTML
    <a data-confirm="#{confirm}" rel="nofollow" data-method="delete" href="#{link}">
    <i class="far fa-trash fa-lg padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML
  end 
  a_tag.html_safe
end


end