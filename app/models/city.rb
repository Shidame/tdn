class City < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name

  def generate_name(user)
  	"#{user.name.capitalize}'s city"
  end

  def to_s
  	"#{name}"
  end
end
