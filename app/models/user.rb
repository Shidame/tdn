class User < ActiveRecord::Base
  has_secure_password

  has_many :discoveries
  has_many :technologies, through: :discoveries
  has_one :city

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

  def assign_city
    User.transaction do
      city = City.new
      city.name = city.generate_name(self)
      city.user = self
      city.deben = 1000
      city.save!

      city.generate_first_parcels
    end
  end

  def to_s
    "#{name}"
  end
end
