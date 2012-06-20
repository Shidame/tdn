class Discovery < ActiveRecord::Base
  belongs_to :user
  belongs_to :technology

  attr_accessible :technology_id, :user_id

  validates_uniqueness_of :technology_id, scope: :user_id
end
