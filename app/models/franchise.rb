class Franchise < ApplicationRecord
# t.string   area
# t.string   mast
# t.integer   region
# t.string   franchise
# t.string   office
# t.string   firm_id
# t.string   lastname
# t.string   firstname
# t.string   city
# t.string   state
# t.datetime created_at
# t.datetime updated_at
# t.string   email
# t.de cimal  prior_year_rebate
# t.decimal  advanced_rebate
# t.integer  show_exempt_collect
# t.string   "initial"
# t.string   "salutation"
# t.string   "address"
# t.string   "address2 "
#t.string   "zip_code"
#t.string   "ship_address"
#t.string   "ship_address2"
#t.string   "ship_city"
#t.string   "ship_state"
#t.string   "ship_zip_code"
#t.string   "home_address"
#t.string   "home_address2"
#t.string   "home_city"
#t.string   "home_state"
#t.string   "home_zip_code"
#t.string   "phone"
#t.string   "phone2"
#t.string   "fax"
#t.string   "mobile"
#t.date     "start_date"
#t.date     "renew_date"
#t.date     "term_date"
#t.string   "term_reason"
#t.string   "salesman"
#t.string   "territory"
#t.string   "start_zip"
#t.string   "stop_zip"
#t.string   "alt_email"
#t.integer  "non_compliant"
#t.string   "non_compliant_reason"
#t.integer  "inactive"
#t.decimal "max_collections"
#t.decimal "avg_collections"
#t.integer "max_coll_year"
#t.integer "max_coll_month"
#t.datetime "created_at"
#t.datetime "updated_at"

has_many :users
has_many :event_logs

NULL_ATTRS = %w(start_date renew_date term_date)

before_save :nil_if_blank

after_create :log_new_franchise
after_save :log_rebate_changed, if: :advanced_rebate_changed?
#after_save :reset_name_variable, if: :name_has_changed?

#Model Validation
  validates :area,       presence: {message: "Area cannot be blank"}
  validates :mast,       presence: {message:  "Mast cannot be blank"}  
  validates :region,     presence: {message:  "Region cannot be blank"}
  validates :franchise_number,  presence: {message:  "Franchise number cannot be blank"}  
  validates :office,     presence: {essage:  "Office number cannot be blank"}  
  validates :lastname,   presence: {message:  "Last Name cannot be blank"}  
  validates :firstname,  presence: {message:  "First Name cannot be blank"}  
  validates :email,      presence: {message:  "Email cannot be blank"}  
  validates :phone,      presence: {message:  "Phone cannot be blank"}  
  validates :start_date, presence: {message:  "Start Date cannot be blank"}  
  validates :address,    presence: {message:  "Address cannot be blank"}  
  validates :city,       presence: {message:  "City cannot be blank"}  
  validates :state,      presence: {message:  "State cannot be blank"}  
  validates :zip_code,   presence: {message:  "Zip Code cannot be blank"}  
  validates :prior_year_rebate, numericality: {greater_than_or_equal_to: 0, message: 'Credit cannot exceed available balance'}
  validates :advanced_rebate, numericality: {greater_than_or_equal_to: 0 ,  message: 'Negative advanced rebate not allowed'}
  validates :franchise_number, :uniqueness => {:scope => [:region, :office], message: 'This franchise entry already exists'}
  validates :email , format: {with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: 'Invalid email format'}

  #================================================================= 
  #Instance Methods  
  #=================================================================
  #firstname and lastname with a space
  def full_name
    [firstname , lastname].join(' ')
  end
  #franchise number lastname and firstname
  def number_and_name
    [franchise_number , lastname, firstname].join(' ')
  end
  #lastname firstname and franchise number
  def dropdown_list
    [lastname  ,firstname, "(#{franchise_number})"].join(' ')
  end
  #franchise number and lastname
  def full_denomination
    [franchise_number, lastname].join(' ')
  end

  #flag to see if name changed
  def name_has_changed?
    lastname_changed? || firstname_changed?
  end
  
  def region_desc
    case self.region 
    when 1
      "Southeast"  
    when 2
      "Mid-Atlantic"
    when 3
      "Northeast Corridor"
    when 4
      "Mid-USA"
    when 5
      "West"
    end
  end
  #================================================================= 
  #Class Methods  
  #=================================================================
  #Method that search through the franchises based on search criterias
  #This is called from the find frachise screen
  def self.search(search)
    if search
      where('lower(lastname) LIKE ? OR lower(firstname) LIKE ?', "%#{search.downcase}%","%#{search.downcase}%")
    else
      where(nil)
    end
  end

  private

  def nil_if_blank
    NULL_ATTRS.each {|attr| self[attr] = nil if self[attr].blank?}
  end

  def log_new_franchise
  	desc = "Franchise #{self.franchise_number} #{self.lastname} was Created"
  	EventLog.create(event_date: DateTime.now, franchise_id: self.id, fran: self.franchise_number, lastname: self.lastname, email: self.email, event_desc: desc)
  end

end