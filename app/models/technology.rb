class Technology < ActiveRecord::Base
  has_many :discoveries
  has_many :users, through: :discoveries

  has_many :descendants, class_name: "Relationship", primary_key: "child_id", foreign_key: "parent_id"
  has_many :children, through: :descendants, source: :technology
  has_many :ancestors, class_name: "Relationship", primary_key: "parent_id", foreign_key: "child_id"
  has_many :parents, through: :ancestors, source: :technology

  attr_accessible :name
end
