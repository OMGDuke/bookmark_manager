require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :username, String
  property :password_digest, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
