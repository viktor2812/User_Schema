class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 
  validates :email, format: {with: /\A[a-zA-Z\.]+@[a-zA-Z\.]{2,}\.[a-zA-Z]+\z/}
  validates :email, uniqueness: true
  validates :age, numericality: {greater_than_or_equal_to: 18}
  validate :valid_phone?

  def valid_phone?
    count = 0
    for i in 0...phone.length
      if phone[i]=~ /\d/
        count += 1
      end
    end
    if count < 9
      errors.add(:phone, "does not contain enough digits")
    end
  end
  def name
    "#{first_name} #{last_name}"
  end

  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years 
    age
  end

end
