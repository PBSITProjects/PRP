class CreateAccountants < ActiveRecord::Migration[6.0]
  def change
    create_table :accountants do |t|
    	t.references :franchise, foreign_key: true
    	t.string :accountant_num
    	t.string :lastname
    	t.string :firstname
    	t.string :initial
    	t.string :salutation
    	t.date :birthdate
    	t.string :spouse_name
    	t.date :spouse_birthdate
    	t.integer :spouse_partner
    	t.date :start_date
    	t.integer :inactive
    	t.date :term_date
    	t.integer :cpa
    	t.integer :mba
    	t.integer :degree
    	t.integer :agent 
    	t.integer :advisory_board
    	t.text :notes
    end
  end
end
