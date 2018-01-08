class AddMoreColumnsToTalent < ActiveRecord::Migration[5.1]
  def change
    add_column :talents, :mobile_number, :string
    add_column :talents, :email, :string
    add_column :talents, :postal, :string
    add_column :talents, :relationship_status, :integer, default: 0
  end
end
