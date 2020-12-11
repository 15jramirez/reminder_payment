class User < ActiveRecord::Base
    has_many :payments
    has_secure_password
end