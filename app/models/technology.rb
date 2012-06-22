class Technology < ActiveRecord::Base
  has_many :discoveries
  has_many :users, through: :discoveries

  has_many :ancestors, class_name: "Relationship", foreign_key: "child_id", dependent: :destroy
  has_many :parents, through: :ancestors, source: :parent
  has_many :descendants, class_name: "Relationship", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :descendants, source: :child

  validates :name, uniqueness: true
  attr_accessible :name, :depth
  # Technology.select("sum(depth)/depth as max_depth_sibling ").group(:depth).order("max_depth_sibling DESC").first
end
