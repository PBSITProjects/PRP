class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable

  enum role: [:full_control, :read_only]       

  after_initialize :set_default_role, if: :new_record?

  after_create :log_event


  def set_default_role
  	self.role ||= :full_control
  end

  def reset_pass
    self.send_reset_password_instructions
  end

  private

    def log_event
      desc = "Admin user #{self.email} added up on PR+P"
      EventLog.create(event_date: DateTime.now, franchise_id: nil, fran: nil, lastname: "HOME OFFICE", email: self.email, event_desc: desc)
    end    
end
