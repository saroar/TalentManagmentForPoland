class AddCasepasswordToTalents < ActiveRecord::Migration[5.1]
  def change
    add_column :talents, :casepassword, :string
  end
end
