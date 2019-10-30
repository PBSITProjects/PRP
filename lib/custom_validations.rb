module CustomValidations
  def email_valid?(email)
    return false if (email.nil? || email.gsub(/\s+/,"") == "")
    
    if email =~ /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      return true
    else
      return false
    end
  end
    
end