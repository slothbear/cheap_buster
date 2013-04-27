class User
  def self.find(phone)
    raise "unknown phone" unless phone == '6175551212'
    User.new
  end

  def phone
    '6175551212'
  end

  def email
    'farbot@example.com'
  end
end