class User
  attr_reader :phone, :email

  def initialize(phone, email)
    @phone = phone
    @email = email
  end

  def self.find(phone)
    User.new(phone, 'test@example.com')
  end

end