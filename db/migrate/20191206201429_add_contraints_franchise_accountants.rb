class AddContraintsFranchiseAccountants < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :franchises, :area,false 
  	change_column_null :franchises, :mast, false 
  	change_column_null :franchises, :region,  false 
  	change_column_null :franchises, :franchise_number,  false 
  	change_column_null :franchises, :office,  false 
  	change_column_null :franchises, :lastname,  false 
  	change_column_null :franchises, :firstname,  false 
  	change_column_null :franchises, :email,  false 
  	change_column_null :franchises, :phone,  false 
  	change_column_null :franchises, :address, false 
  	change_column_null :franchises, :city,  false 
  	change_column_null :franchises, :state,  false 
  	change_column_null :franchises, :firm_id,  false 
  	change_column_null :franchises, :zip_code,  false 

  	add_index :franchises, [:franchise_number, :region, :office], unique: true

  	change_column_null :accountants, :accountant_num, false 
  	change_column_null :accountants, :lastname,  false 
  	change_column_null :accountants, :firstname,  false

  	add_index :accountants, [:accountant_num, :franchise_id], unique: true

  end
end
