module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!
    return "" if resource.errors.empty?
    msg =""
    resource.errors.full_messages.each do |m| 
      #message.each do |m| 
        msg = msg + content_tag(:li, m)
      #end
    end 
    sentence = I18n.t("devise.errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class = "card border-danger mb-3">
      <div class = "card-header text-danger">
       <strong>#{sentence}</strong>
      </div>
      <div class = "card-body text-danger">
          <ul>#{msg}</ul>
      </div>
    </div>  
    HTML

    html.html_safe
  end
end