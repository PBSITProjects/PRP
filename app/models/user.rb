class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :franchise
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: [:full_control, :can_pay, :data_entry]

  scope :franchise_users, -> (target_franchise) {where("franchise_id = ?",target_franchise).order("create_at ASC")}
  
  after_initialize :set_default_role, if: :new_record?
  after_create :log_event

  def set_default_role
  	self.role ||= :full_control
  end  

  private

    def log_event
      desc = "#{self.email} signed up on PR+P"
      EventLog.create(event_date: DateTime.now, franchise_id: self.franchise_id, fran: self.franchise.franchise, lastname: self.franchise.lastname, email: self.email, event_desc: desc)
    end     
end
