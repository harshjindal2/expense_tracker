class Employee < ApplicationRecord
    has_secure_password

    validates :email ,presence: true ,format:{with: /[^@\s]+@[^@\s]+/, message: "Must be valid Email Address"}

    
     has_many :expenses, dependent: :destroy
end
