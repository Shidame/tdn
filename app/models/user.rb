class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, length: 2..20,
                   format: /^[a-z-]+$/i,
                   uniqueness: true,
                   presence: true
                   
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                    presence: true,
                    uniqueness: true

  validates_presence_of :password, :password_confirmation, on: :create
  
  def self.generate_token
    existing_tokens = User.select :token
    
    begin
      token = SecureRandom.hex
    end while existing_tokens.include?(token)
    
    token
  end
end
