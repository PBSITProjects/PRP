class AddTermReasonToFranchise < ActiveRecord::Migration[6.0]
  def change
  	add_column :franchises, :term_reason , :string
  end
end
