class CreateTalents < ActiveRecord::Migration[5.1]
  def change
    create_table :talents, id: :uuid do |t|
      t.integer :status, default: 0
      t.string :surname
      t.string :given_name
      t.string :place_of_birth
      t.date :date_of_birth
      t.date :date_of_issue
      t.date :date_of_expiry
      t.string :passport_copy
      t.integer :starting_payment
      t.integer :due_payment
      t.string :case_number
      t.uuid :user_id

      t.timestamps
    end


  end
end
