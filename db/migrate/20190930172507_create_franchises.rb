class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.string :area	
      t.string :mast
      t.integer :region
      t.string :franchise_number
      t.string :office 
      t.string :firm_id 
      t.string :salutation
      t.string :lastname
      t.string :firstname
      t.string :initial
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :email
      t.string :ship_address
      t.string :ship_address2
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zip_code
      t.string :home_address
      t.string :home_address2
      t.string :home_city
      t.string :home_state
      t.string :home_zip_code
      t.string :phone
      t.string :phone2
      t.string :fax
      t.string :mobile
      t.string :alt_email
      t.date   :start_date
      t.date   :renew_date
      t.date   :term_date
      t.string :salesman
      t.string :territory
      t.string :start_zip
      t.string :stop_zip
      t.decimal :prior_year_rebate, precision: 10, scale: 2, default: 0.00
      t.decimal :advanced_rebate, precision: 10, scale: 2, default: 0.00
      t.integer :show_exempt_collect, default: 0
      t.integer :inactive, default: 0
      t.integer :non_compliant, default: 0
      t.string :non_compliant_reason
      t.decimal :max_collections, precision: 10, scale: 2 , default: 0.00
      t.decimal :avg_collections, precision: 10, scale: 2 , default: 0.00
      t.integer :max_coll_year
      t.integer :max_coll_month
      t.timestamps
    end

    add_index :franchises, [:area, :mast, :region, :franchise_number, :office, :email , :inactive], name: "office_index",  unique: true
    add_index :franchises, [:franchise_number], name: "franchise_number" , unique: false
  end
end
