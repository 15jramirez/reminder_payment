class CreatesPayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.float :amount
      t.text :description
      t.datetime :due_date
    end
  end
end
