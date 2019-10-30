class EventLog < ApplicationRecord
  #t.date   event_date
  #t.bigint franchise_id
  #t.string fran
  #t.string lastname
  #t.string email
  #t.string event_desc

  validates :event_date, :lastname, :email, :event_desc, presence: true
  scope :created_between,  ->  (start_date, end_date){where("event_date BETWEEN ? AND ?", start_date, end_date)}
  scope :for_date, -> (target_date) {where("event_date = ?", target_date).order("lastname ASC")}
  scope :for_franchise, -> (target_franchise){where("franchise_id =?").order("event_date DESC")}
  scope :for_month, -> (target_year, target_month) {where("extract(month from event_date) = ? AND extract(year from event_date) = ?", target_month, target_year).order("event_date DESC") }

end