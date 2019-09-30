class CreateEventLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :event_logs do |t|
      t.date :event_date 
      t.bigint :franchise_id 
      t.string :fran 
      t.string :lastname 
      t.string :email 
      t.string :event_desc
    end
  end
end
