class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.float  :amount
      t.datetime :due_date
      t.text :description
      t.integer :user_id
    end
  end
end
