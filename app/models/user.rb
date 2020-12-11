class User < ActiveRecord::Base
    has_many :payments
    # has secure_password
end