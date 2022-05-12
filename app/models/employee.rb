class Employee < ApplicationRecord

    has_many :expenses

    has_secure_password

    validates :name ,presence: true
    validates :email ,presence: true ,format:{with: /[^@\s]+@[^@\s]+/, message: "Must be valid Email Address"}

end
