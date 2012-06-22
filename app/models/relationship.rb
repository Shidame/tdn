class Relationship < ActiveRecord::Base
  belongs_to :parent, class_name: "Technology"
  belongs_to :child, class_name: "Technology"

  attr_accessible :child_id, :parent_id

  accepts_nested_attributes_for :parent
  accepts_nested_attributes_for :child
end
