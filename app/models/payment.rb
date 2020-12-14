class Payment < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :amount, :name, :description, :due_date
end