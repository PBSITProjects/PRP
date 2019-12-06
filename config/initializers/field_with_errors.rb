#to display vertically once the div was applied
#This is a much more simple
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  class_attr_index = html_tag.index 'class="'
  if html_tag !~ /^<label/
    if class_attr_index
      html_tag.insert class_attr_index+7, 'is-invalid '
    else
      html_tag.insert html_tag.index('>'), ' class="is-invalid"'
    end
  else
  	html_tag
  end
end