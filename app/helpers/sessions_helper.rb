module SessionsHelper

  def sign_in(student)
    cookies.permanent.signed[:remember_token] = [student.username, student.salt]
    current_student = student
  end
  

  
  
  def sign_out
    current_student = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_student.nil?
  end
  
  def current_student=(student)
    @current_student = student
  end
  
  def current_student
    @current_student ||= student_from_remember_token
  end
  
  
 
  
  private

	
    def student_from_remember_token
      Student.authenticate_with_salt(*remember_token) #*=use [] instead of 2 vars
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end	
end
