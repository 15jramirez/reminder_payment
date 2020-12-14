class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.float  :amount
      t.date :due_date
      t.text :description
      t.integer :user_id
    end
  end
end
