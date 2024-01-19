require "bcrypt"

module Auth
  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash_digest(hashed_password, plain_password)
    BCrypt::Password.new(hashed_password) == plain_password
  end

  def self.authenticate_user(username, password, user_list)
    user_list.each do |stored_user|
      found_username = stored_user.username == username
      hash_password = stored_user.password
      password_match = self.verify_hash_digest(hash_password, password)

      return stored_user if found_username && password_match
    end
    return nil
  end
end

      