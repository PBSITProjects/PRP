module DisplayHelper
  #Helper that displays the proper payment icon
  #depending on the payment type
  def paid_with_icon(payment)	
  end

  #Throughout the app, we have the same links to 
#Edit, Show, Delete with the same icons
#This helper was created to minimize code in the view
def link_with_icon(link, action, description,confirm="",turbo=true)
  case action 
  when "show"
    a_tag = <<-HTML
    <a data-turbolinks="#{turbo}" 
       href="#{link}" 
       class="show-link">
    <i class="far fa-file-alt fa-2x padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML
  when "edit"
    a_tag = <<-HTML
    <a data-turbolinks="#{turbo}" href="#{link}" class = "edit-link">
    <i class="fas fa-edit fa-2x padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML
  when "audit"   
   a_tag = <<-HTML
    <a data-turbolinks="#{turbo}" href="#{link}" class = "audit-link">
    <i class="fas fa-eye fa-2x padgett-blue-icon" 
    aria-hidden="true" 
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}">
    </i>
    </a>
    HTML
  when "delete" 
    a_tag = <<-HTML
    <a data-confirm="#{confirm}" rel="nofollow" data-method="delete" href="#{link}" class="delete-link">
    <i class="far fa-trash-alt fa-2x padgett-blue-icon" 
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

def display_checkmark(value = 0, description = "")
  if value == 1
    i_tag = <<-HTML 
    <i class="far fa-check-circle fa-2x padgett-green-icon" 
    aria-hidden="true"
    data-html = "true" 
    data-toggle="tooltip" 
    title="#{description}" >
    </i>
    HTML
  else
    i_tag = ""
  end
  i_tag.html_safe

end


end