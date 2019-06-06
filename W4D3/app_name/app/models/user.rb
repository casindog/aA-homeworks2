class User < ApplicationRecord
    validate :username, :session_token, presense: true
    validate :password #set error msg to password can't be blank
    validate :password #length & allow_nil to true

#   validates :username, presence: true, uniqueness: true
#   validates :password_digest, presence: { message: 'Password can\'t be blank'}
#   validates :session_token, presence: true, uniqueness: true
#   validates :password, length: { minimum: 6, allow_nil: true }
#   before_validation :ensure_session_token


    attr_reader :password

    def self.find_by_credentials(username, password)
    user = users.find_by(username: username, password: password)

    #user = User.find_by(username: username)
    #return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    #nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!

        #self.session_token
    end

    def ensure_session_token
        @session_token ||= reset_session_token!
        
        #self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        encrypt = SecureRandom.urlsafe_base64(password)
        self.password_digest = encrypt
    end
end
